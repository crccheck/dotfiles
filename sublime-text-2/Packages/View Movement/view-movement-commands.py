import sublime, sublime_plugin

class PaneMoveCommand(sublime_plugin.WindowCommand):
  def run(self, direction):
    layout      = self.window.get_layout()
    num_rows    = len(layout['rows']) - 1
    num_cols    = len(layout['cols']) - 1
    current_grp = self.window.active_group()

    cur_col = current_grp % num_cols
    cur_row = (int(current_grp) / int(num_rows)) % num_rows

    if direction == 'right':
      next_col = (cur_col + 1) % num_cols
      next_row = cur_row
    elif direction == 'left':
      next_col = (cur_col - 1) % num_cols
      next_row = cur_row
    elif direction == 'down':
      next_col = cur_col
      next_row = (cur_row + 1) % num_rows
    else:
      next_col = cur_col
      next_row = (cur_row - 1) % num_rows

    next_group = next_col + (next_row * num_rows)
    self.window.focus_group(next_group)

class ViewMoveRelativeCommand(sublime_plugin.WindowCommand):
  def run(self, direction):
    if self.window.active_view() is None:
      print "Nothing to do"
      return

    layout      = self.window.get_layout()
    num_rows    = len(layout['rows']) - 1
    num_cols    = len(layout['cols']) - 1
    current_grp = self.window.active_group()

    cur_col = current_grp % num_cols
    cur_row = (int(current_grp) / int(num_rows)) % num_rows

    if direction == 'right':
      next_col = (cur_col + 1) % num_cols
      next_row = cur_row
    elif direction == 'left':
      next_col = (cur_col - 1) % num_cols
      next_row = cur_row
    elif direction == 'down':
      next_col = cur_col
      next_row = (cur_row + 1) % num_rows
    else:
      next_col = cur_col
      next_row = (cur_row - 1) % num_rows

    next_group = next_col + (next_row * num_rows)

    v = self.window.active_view()
    self.window.set_view_index(v, next_group, 0)
    self.window.focus_group(next_group)
