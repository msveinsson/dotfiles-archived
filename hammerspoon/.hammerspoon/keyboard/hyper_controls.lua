-- Keybindings for System Controls (Hyper + key)Hyper -> s + key

local hyper = { "cmd", "ctrl", "alt", "shift" }

local function sendSystemKey(key)
	hs.eventtap.event.newSystemKeyEvent(key, true):post()
	hs.eventtap.event.newSystemKeyEvent(key, false):post()
end

local volume = {
	up = function()
		sendSystemKey("SOUND_UP")
	end,
	down = function()
		sendSystemKey("SOUND_DOWN")
	end,
	mute = function()
		sendSystemKey("MUTE")
	end,
}
hs.hotkey.bind(hyper, "=", volume.up)
hs.hotkey.bind(hyper, "-", volume.down)
hs.hotkey.bind(hyper, "\\", volume.mute)

local brihtness = {
	up = function()
		sendSystemKey("BRIGHTNESS_UP")
	end,
	down = function()
		sendSystemKey("BRIGHTNESS_DOWN")
	end,
}
hs.hotkey.bind(hyper, "]", brihtness.up)
hs.hotkey.bind(hyper, "[", brihtness.down)

-- local video = {
-- 	play = function()
-- 		sendSystemKey("PLAY")
-- 	end,
-- }
--hs.hotkey.bind(hyperPlus, "p", video.play)
