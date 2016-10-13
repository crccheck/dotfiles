-- https://github.com/tekezo/Karabiner/issues/354#issuecomment-148980744
--
-- To list your profiles:
--     /Applications/Karabiner.app/Contents/Library/bin/karabiner list

local usbWatcher = nil

function usbDeviceCallback(data)
    if (data["productName"] == "USB Keyboard") then
        if (data["eventType"] == "added") then
            hs.execute('/Applications/Karabiner.app/Contents/Library/bin/karabiner select 1')
        elseif (data["eventType"] == "removed") then
            hs.execute('/Applications/Karabiner.app/Contents/Library/bin/karabiner select 0')
        end
    end
end

usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
usbWatcher:start()
