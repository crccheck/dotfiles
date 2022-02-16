local hyper = {"ctrl", "cmd"}

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.3
-- TODO only enable one set depending on if external keyboard detected
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
