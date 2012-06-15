import sublime, sublime_plugin
import re

css_data = """
"background-attachment"=scroll | fixed | inherit
"background-color"=<color> | inherit
"background-image"=<uri> | none | inherit
"background-position"=[ [ <percentage> | <length> | left | center | right ] [ <percentage> | <length> | top | center | bottom ]? ] | [ [ left | center | right ] || [ top | center | bottom ] ] | inherit 0% 0%
"background-repeat"=repeat | repeat-x | repeat-y | no-repeat | inherit
"background"=['background-color' || 'background-image' || 'background-repeat' || 'background-attachment' || background-position] | inherit
"border-collapse"=collapse | separate | inherit
"border-color"=[ <color> ]{1,4} | inherit
"border-spacing"=<length> <length>? | inherit
"border-style"=<border-style>{1,4} | inherit
"border-top" "border-right" "border-bottom" "border-left"=[ <border-width> || <border-style> || border-top-color ] | inherit
"border-top-color" "border-right-color" "border-bottom-color" "border-left-color"=<color> | inherit
"border-top-style" "border-right-style" "border-bottom-style" "border-left-style"=<border-style> | inherit
"border-top-width" "border-right-width" "border-bottom-width" "border-left-width"=<border-width> | inherit
"border-width"=<border-width>{1,4} | inherit
"border"=[ <border-width> || <border-style> || border-top-color ] | inherit
"bottom"=<length> | <percentage> | auto | inherit
"caption-side"=top | bottom | inherit
"clear"=none | left | right | both | inherit
"clip"=<shape> | auto | inherit
"color"=<color> | inherit
"content"=normal | none | [ <string> | <uri> | <counter> | attr(<identifier>) | open-quote | close-quote | no-open-quote | no-close-quote ]+ | inherit
"counter-increment"=[ <identifier> <integer>? ]+ | none | inherit
"counter-reset"=[ <identifier> <integer>? ]+ | none | inherit
"cursor"=[ [<uri> ,]* [ auto | crosshair | default | pointer | move | e-resize | ne-resize | nw-resize | n-resize | se-resize | sw-resize | s-resize | w-resize | text | wait | help | progress ] ] | inherit
"direction"=ltr | rtl | inherit ltr all elements, but see prose yes
"display"=inline | block | list-item | inline-block | table | inline-table | table-row-group | table-header-group | table-footer-group | table-row | table-column-group | table-column | table-cell | table-caption | none | inherit
"empty-cells"=show | hide | inherit
"float"=left | right | none | inherit
"font-family"=[ [ <family-name> | <generic-family> ] [, <family-name>| <generic-family> ]* ] | inherit
"font-size"=<absolute-size> | <relative-size> | <length> | <percentage> | inherit
"font-style"=normal | italic | oblique | inherit
"font-variant"=normal | small-caps | inherit
"font-weight"=normal | bold | bolder | lighter | 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900 | inherit
"font"=[ [ 'font-style' || 'font-variant' || 'font-weight' ]? 'font-size' [ / 'line-height' ]? font-family ] | caption | icon | menu | message-box | small-caption | status-bar | inherit
"height"=<length> | <percentage> | auto | inherit
"left"=<length> | <percentage> | auto | inherit
"letter-spacing"=normal | <length> | inherit
"line-height"=normal | <number> | <length> | <percentage> | inherit
"list-style-image"=<uri> | none | inherit
"list-style-position"=inside | outside | inherit
"list-style-type"=disc | circle | square | decimal | decimal-leading-zero | lower-roman | upper-roman | lower-greek | lower-latin | upper-latin | armenian | georgian | lower-alpha | upper-alpha | none | inherit
"list-style"=[ 'list-style-type' || 'list-style-position' || list-style-image ] | inherit
"margin-right" "margin-left"=<margin-width> | inherit
"margin-top" "margin-bottom"=<margin-width> | inherit
"margin"=<margin-width>{1,4} | inherit
"max-height"=<length> | <percentage> | none | inherit
"max-width"=<length> | <percentage> | none | inherit
"min-height"=<length> | <percentage> | inherit
"min-width"=<length> | <percentage> | inherit
"opacity"=<number> | inherit
"orphans"=<integer> | inherit 2
"outline-color"=<color> | invert | inherit
"outline-style"=<border-style> | inherit
"outline-width"=<border-width> | inherit
"outline"=[ 'outline-color' || 'outline-style' || outline-width ] | inherit
"overflow"=visible | hidden | scroll | auto | inherit
"padding-top" "padding-right" "padding-bottom" "padding-left"=<padding-width> | inherit
"padding"=<padding-width>{1,4} | inherit
"page-break-after"=auto | always | avoid | left | right | inherit
"page-break-before"=auto | always | avoid | left | right | inherit
"page-break-inside"=avoid | auto | inherit
"position"=static | relative | absolute | fixed | inherit
"quotes"=[<string> <string>]+ | none | inherit
"right"=<length> | <percentage> | auto | inherit
"table-layout"=auto | fixed | inherit
"text-align"=left | right | center | justify | inherit
"text-decoration"=none | [ underline || overline || line-through || blink ] | inherit none
"text-indent"=<length> | <percentage> | inherit
"text-transform"=capitalize | uppercase | lowercase | none | inherit none
"top"=<length> | <percentage> | auto | inherit
"unicode-bidi"=normal | embed | bidi-override | inherit
"vertical-align"=baseline | sub | super | top | text-top | middle | bottom | text-bottom | <percentage> | <length> | inherit baseline
"visibility"=visible | hidden | collapse | inherit
"white-space"=normal | pre | nowrap | pre-wrap | pre-line | inherit
"widows"=<integer> | inherit 2
"width"=<length> | <percentage> | auto | inherit
"word-spacing"=normal | <length> | inherit
"z-index"=auto | <integer> | inherit


"background"=[ <bg-layer> , ]* <final-bg-layer>
"background-attachment"=<attachment> [ , <attachment> ]*
"background-clip"=<box> [ , <box> ]*
"background-color"=<color>
"background-image"=<bg-image> [ , <bg-image> ]*
"background-origin"=<box> [ , <box> ]*
"background-position"=<position> [ , <position> ]*
"background-repeat"=<repeat-style> [ , <repeat-style> ]*
"background-size"=<bg-size> [ , <bg-size> ]*
"border"=<border-width> || <border-style> || <color>
"border-color"=<color>{1,4}
"border-image"=<'border-image-source'> || <'border-image-slice'> [ / <'border-image-width'> | / <'border-image-width'>? / <'border-image-outset'> ]? || <'border-image-repeat'>
"border-image-outset"=[ <length> | <number> ]{1,4}
"border-image-repeat"=[ stretch | repeat | round | space ]{1,2}
"border-image-slice"=[<number> | <percentage>]{1,4} && fill?
"border-image-source"=none | <image>
"border-image-width"=[ <length> | <percentage> | <number> | auto ]{1,4}
"border-radius"=[ <length> | <percentage> ]{1,4} [ / [ <length> | <percentage> ]{1,4} ]?
"border-style"=<border-style>{1,4}
"border-top" "border-right" "border-bottom" "border-left"=<border-width> || <border-style> || <color>
"border-top-color" "border-right-color" "border-bottom-color" "border-left-color"=<color>
"border-top-left-radius" "border-top-right-radius" "border-bottom-right-radius" "border-bottom-left-radius"=[ <length> | <percentage> ]{1,2}
"border-top-style" "border-right-style" "border-bottom-style" "border-left-style"=<border-style>
"border-top-width" "border-right-width" "border-bottom-width" "border-left-width"=<border-width>
"border-width"=<border-width>{1,4}
"box-decoration-break"=slice | clone
"box-shadow"=none | <shadow> [ , <shadow> ]* none
"""

def parse_css_data(data):
    props = {}
    for l in data.splitlines():
        if l == "":
            continue

        names, values = l.split('=')

        allowed_values = []
        for v in values.split('|'):
            v = v.strip()
            if v == "" or v[0] == '<' or v[0] == '[':
                allowed_values = []
                break
            else:
                allowed_values.append(v)

        for e in names.split():
            if e[0] == '"':
                props[e[1:-1]] = sorted(allowed_values)
            else:
                break

    return props

class CSSCompletions(sublime_plugin.EventListener):
    props = None
    rex = None

    def on_query_completions(self, view, prefix, locations):
        if not view.match_selector(locations[0], "source.css - meta.selector.css"):
            return []

        if not self.props:
            self.props = parse_css_data(css_data)
            self.rex = re.compile("([a-zA-Z-]+):\s*$")

        l = []
        if (view.match_selector(locations[0], "meta.property-value.css") or
            # This will catch scenarios like .foo {font-style: |}
            view.match_selector(locations[0] - 1, "meta.property-value.css")):
            loc = locations[0] - len(prefix)
            line = view.substr(sublime.Region(view.line(loc).begin(), loc))

            m = re.search(self.rex, line)
            if m:
                prop_name = m.group(1)
                if prop_name in self.props:
                    values = self.props[prop_name]

                    add_semi_colon = view.substr(sublime.Region(loc, loc + 1)) != ';'

                    for v in values:
                        if add_semi_colon:
                            l.append((v, v + ";"))
                        else:
                            l.append((v, v))

                    return (l, sublime.INHIBIT_WORD_COMPLETIONS | sublime.INHIBIT_EXPLICIT_COMPLETIONS)

            return None
        else:
            add_colon = not view.match_selector(locations[0], "meta.property-name.css")

            for p in self.props:
                if add_colon:
                    l.append((p, p + ": "))
                else:
                    l.append((p, p))

            return (l, sublime.INHIBIT_WORD_COMPLETIONS | sublime.INHIBIT_EXPLICIT_COMPLETIONS)
