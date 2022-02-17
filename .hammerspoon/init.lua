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

-- Hammerspoon keycodes:
-- https://github.com/Hammerspoon/hammerspoon/blob/master/extensions/keycodes/keycodes.lua#L67

-- Fix forward delete does not work if you modify 'fn' key to get 'ctrl' to the left corner
-- https://stackoverflow.com/questions/433keys-using-hammerspoon
local function keyCode(key, modifiers)
  modifiers = modifiers or {}
  return function()
     hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
     hs.timer.usleep(100)
     hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
  end
end

local function remapKey(modifiers, key, keyCode)
  hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end

remapKey({'ctrl'}, 'delete', keyCode('forwarddelete'))
