local hyper = {"ctrl", "cmd"}

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.3
-- TODO only enable one set depending on if external keyboard detected
-- TODO need to nudge windows
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "f"},
  nextscreen = {hyper, "n"}
})

spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "pad8"},
  right = {hyper, "pad6"},
  down = {hyper, "pad2"},
  left = {hyper, "pad4"},
  fullscreen = {hyper, "pad5"},
  nextscreen = {hyper, "n"}
})

-- Hammerspoon doesn't show you how to get keycodes, use this as a reference instead:
-- https://github.com/Hammerspoon/hammerspoon/issues/1004#issuecomment-252463464
