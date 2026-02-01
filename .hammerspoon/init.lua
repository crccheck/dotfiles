local hyper = {"ctrl", "alt"}  -- Ctrl+Option (Rectangle standard)

-- Simple window management for laptop use
-- Ctrl+Option+Enter to maximize window (Rectangle standard)
hs.hotkey.bind(hyper, "return", function()
  local win = hs.window.focusedWindow()
  if win then
    win:maximize()
  end
end)

--[[
================================================================================
ARCHIVED: Full window management config for docked setup with external keyboard
================================================================================

When using external keyboard with numpad and dual monitors, uncomment below:

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.3

-- Arrow key bindings
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "f"},
  nextscreen = {hyper, "n"}
})

-- Numpad bindings
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "pad8"},
  right = {hyper, "pad6"},
  down = {hyper, "pad2"},
  left = {hyper, "pad4"},
  fullscreen = {hyper, "pad5"},
  nextscreen = {hyper, "n"}
})

================================================================================
--]]

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

-- Remap Ctrl+W to Cmd+W in Firefox only
firefoxCtrlW = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
  local flags = event:getFlags()
  local keyCode = event:getKeyCode()

  -- Check if it's Ctrl+W (keyCode 13 is 'w')
  if flags.ctrl and not flags.cmd and not flags.alt and not flags.shift and keyCode == 13 then
    local app = hs.application.frontmostApplication()

    if app and app:name() == 'Firefox' then
      -- Replace ctrl with cmd
      event:setFlags({cmd = true})
      return false
    end
  end

  return false
end):start()

