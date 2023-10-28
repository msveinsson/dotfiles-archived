-- Keybindings for opening applications (Hyper + key)

-- Based on:
--    dmgerman / hs_select_window.spoon => https://github.com/dmgerman/hs_select_window.spoon
--    Porco-Rosso / PorcoSpoon => https://github.com/Porco-Rosso/PorcoSpoon

--  function to either open apps or switch through them using hs_select_window spoon (modified)
local function openapp(name)
	return function()
		if hs.application.frontmostApplication():name() == name then
			--switcher.switcherfunc()
			spoon.hs_select_window:switcherfunc()
		else
			hs.application.launchOrFocus(name)
		end
	end
end

local hyper = { "cmd", "ctrl", "alt", "shift" }

hs.hotkey.bind(hyper, "return", openapp("Alacritty"))
hs.hotkey.bind(hyper, "A", openapp("Arc"))
hs.hotkey.bind(hyper, "B", openapp("Brave Browser"))
hs.hotkey.bind(hyper, "C", openapp("Visual Studio Code"))
hs.hotkey.bind(hyper, "D", openapp("Azure Data Studio"))
hs.hotkey.bind(hyper, "E", openapp("Microsoft Edge"))
hs.hotkey.bind(hyper, "F", openapp("Finder"))
hs.hotkey.bind(hyper, "G", openapp("Github Desktop"))
hs.hotkey.bind(hyper, "K", openapp("Kitty"))
hs.hotkey.bind(hyper, "M", openapp("Microsoft Teams"))
hs.hotkey.bind(hyper, "N", openapp("Obsidian"))
hs.hotkey.bind(hyper, "R", openapp("Microsoft Remote Desktop"))
hs.hotkey.bind(hyper, "S", openapp("SQLDeveloper"))
hs.hotkey.bind(hyper, "O", openapp("Microsoft Outlook"))
hs.hotkey.bind(hyper, "W", openapp("Windows 11"))
hs.hotkey.bind(hyper, "X", openapp("Remote Desktop Manager"))
