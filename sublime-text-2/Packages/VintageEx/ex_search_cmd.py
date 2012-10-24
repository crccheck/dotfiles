# TODO(guillermooo): All of this functionality, along with key bindings, rather
# belongs in Vintage, but we need to extract the necessary functions out of
# VintageEx first. This is a temporary solution.

import sublime
import sublime_plugin

from vex import ex_location
import ex_commands


def compute_flags(view, term):
    flags = 0 # case sensitive
    search_mode = view.settings().get('vintage_search_mode')
    if search_mode == 'smart_case':
        if term.lower() == term:
            flags = sublime.IGNORECASE
    elif search_mode == 'case_insensitive':
        flags = sublime.IGNORECASE
    return flags


class SearchImpl(object):
    last_term = ""
    def __init__(self, view, cmd, remember=True, start_sel=None):
        self.start_sel = start_sel
        self.remember = remember
        if not cmd:
            return
        self.view = view
        self.reversed = cmd.startswith("?")
        if not cmd.startswith(("?", "/")):
            cmd = "/" + cmd
        if len(cmd) == 1 and SearchImpl.last_term:
            cmd += SearchImpl.last_term
        elif not cmd:
            return
        self.cmd = cmd[1:]
        self.flags = compute_flags(self.view, self.cmd)

    def search(self):
        if not getattr(self, "cmd", None):
            return
        if self.remember:
            SearchImpl.last_term = self.cmd
        sel = self.start_sel[0]

        next_match = None
        if self.reversed:
            current_line = self.view.line(self.view.sel()[0])
            left_side = sublime.Region(current_line.begin(),
                                       self.view.sel()[0].begin())
            if ex_location.search_in_range(self.view, self.cmd,
                                           left_side.begin(),
                                           left_side.end(),
                                           self.flags):
                next_match = ex_location.find_last_match(self.view,
                                                         self.cmd,
                                                         left_side.begin(),
                                                         left_side.end(),
                                                         self.flags)
            else:
                line_nr = ex_location.reverse_search(self.view, self.cmd,
                                                end=current_line.begin() - 1,
                                                flags=self.flags)
                if line_nr:
                    pt = self.view.text_point(line_nr - 1, 0)
                    line = self.view.full_line(pt)
                    if line.begin() != current_line.begin():
                        next_match = ex_location.find_last_match(self.view,
                                                             self.cmd,
                                                             line.begin(),
                                                             line.end(),
                                                             self.flags)
        else:
            next_match = self.view.find(self.cmd, sel.end(), self.flags)
        # handle search restart
        if not next_match:
            if self.reversed:
                sublime.status_message("VintageEx: search hit TOP, continuing at BOTTOM")
                line_nr = ex_location.reverse_search(self.view, self.cmd, flags=self.flags)
                if line_nr:
                    pt = self.view.text_point(line_nr - 1, 0)
                    line = self.view.full_line(pt)
                    next_match = ex_location.find_last_match(self.view,
                                                             self.cmd,
                                                             line.begin(),
                                                             line.end(),
                                                             self.flags)
            else:
                sublime.status_message("VintageEx: search hit BOTTOM, continuing at TOP")
                next_match = self.view.find(self.cmd, 0, sel.end())
        # handle result
        if next_match:
            self.view.sel().clear()
            if not self.remember:
                self.view.add_regions("vi_search", [next_match], "search.vi",
                                      sublime.DRAW_OUTLINED)
            else:
                self.view.sel().add(next_match)
            self.view.show(next_match)
        else:
            sublime.status_message("VintageEx: Pattern not found:" + self.cmd)


class ViRepeatSearchBackward(sublime_plugin.TextCommand):
   def run(self, edit):
        if ex_commands.VintageExState.search_buffer_type == 'pattern_search':
            SearchImpl(self.view, "?" + SearchImpl.last_term,
                      start_sel=self.view.sel()).search()
        elif ex_commands.VintageExState.search_buffer_type == 'find_under':
            self.view.window().run_command("find_prev", {"select_text": False})


class ViRepeatSearchForward(sublime_plugin.TextCommand):
    def run(self, edit):
        if ex_commands.VintageExState.search_buffer_type == 'pattern_search':
            SearchImpl(self.view, SearchImpl.last_term,
                       start_sel=self.view.sel()).search()
        elif ex_commands.VintageExState.search_buffer_type == 'find_under':
            self.view.window().run_command("find_next", {"select_text": False})


class ViFindUnder(sublime_plugin.TextCommand):
    def run(self, edit, forward=True):
        ex_commands.VintageExState.search_buffer_type = 'find_under'
        if forward:
            self.view.window().run_command('find_under', {'select_text': False})
        else:
            self.view.window().run_command('find_under_prev', {'select_text': False})


class ViSearch(sublime_plugin.TextCommand):
    def run(self, edit, initial_text=""):
        self.original_sel = list(self.view.sel())
        self.view.window().show_input_panel("", initial_text,
                                            self.on_done,
                                            self.on_change,
                                            self.on_cancel)

    def on_done(self, s):
        self._restore_sel()
        try:
            SearchImpl(self.view, s, start_sel=self.original_sel).search()
            ex_commands.VintageExState.search_buffer_type = 'pattern_search'
        except RuntimeError, e:
            if 'parsing' in str(e):
                print "VintageEx: Regex parsing error. Incomplete pattern: %s" % s
            else:
                raise e
        self.original_sel = None
        self._restore_sel()

    def on_change(self, s):
        if s in ("/", "?"):
            return
        self._restore_sel()
        try:
            SearchImpl(self.view, s, remember=False,
                       start_sel=self.original_sel).search()
        except RuntimeError, e:
            if 'parsing' in str(e):
                print "VintageEx: Regex parsing error. Expected error." 
            else:
                raise e

    def on_cancel(self):
        self._restore_sel()
        self.original_sel = None

    def _restore_sel(self):
        self.view.erase_regions("vi_search")
        if not self.original_sel:
            return
        self.view.sel().clear()
        for s in self.original_sel:
            self.view.sel().add(s)
        self.view.show(self.view.sel()[0])
