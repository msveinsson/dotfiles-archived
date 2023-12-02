

-- ██╗    ██╗███████╗███████╗████████╗███████╗██████╗ ███╗   ███╗
-- ██║    ██║██╔════╝╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
-- ██║ █╗ ██║█████╗    ███╔╝    ██║   █████╗  ██████╔╝██╔████╔██║
-- ██║███╗██║██╔══╝   ███╔╝     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
-- ╚███╔███╔╝███████╗███████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
--  ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
-- WezTerm cross-platform terminal emulator and multiplexer                                                            
-- https://wezfurlong.org/wezterm/index.html

local wezterm = require("wezterm")
local act = wezterm.action
local k = require("utils/keys")

local fish_path = "/opt/homebrew/bin/fish"

local config = {}

if wezterm.config_builder then config = wezterm.config_builder() end

-- Settings
config.default_prog = { fish_path, "-l" }
--config.color_scheme = "Tokyo Night"
config.color_scheme = "Catppuccin Mocha"
--config.debug_key_events = false
config.enable_tab_bar = false
config.native_macos_fullscreen_mode = false
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5
}

-- Font
config.font = wezterm.font_with_fallback({
  { family = "JetBrainsMono Nerd Font",  scale = 1.5, weight = "Bold", },
  { family = "CaskaydiaCove Nerd Font",  scale = 1.5 },
})

-- Padding -- old
config.window_padding = ({
	left = 30,
	right = 30,
	top = 20,
	bottom = 10,
})

-- Keys
config.keys = {
	k.cmd_key(".", k.multiple_actions(":ZenMode")),
	k.cmd_key("[", act.SendKey({ mods = "CTRL", key = "o" })),
	k.cmd_key("]", act.SendKey({ mods = "CTRL", key = "i" })),
	k.cmd_key("f", k.multiple_actions(":Grep")),
	k.cmd_key("H", act.SendKey({ mods = "CTRL", key = "h" })),
	k.cmd_key("i", k.multiple_actions(":SmartGoTo")),
	k.cmd_key("J", act.SendKey({ mods = "CTRL", key = "j" })),
	k.cmd_key("K", act.SendKey({ mods = "CTRL", key = "k" })),
	k.cmd_key("L", act.SendKey({ mods = "CTRL", key = "l" })),
	k.cmd_key("P", k.multiple_actions(":GoToCommand")),
	k.cmd_key("p", k.multiple_actions(":GoToFile")),
	k.cmd_key("q", k.multiple_actions(":qa!")),
	k.cmd_to_tmux_prefix("1", "1"),
	k.cmd_to_tmux_prefix("2", "2"),
	k.cmd_to_tmux_prefix("3", "3"),
	k.cmd_to_tmux_prefix("4", "4"),
	k.cmd_to_tmux_prefix("5", "5"),
	k.cmd_to_tmux_prefix("6", "6"),
	k.cmd_to_tmux_prefix("7", "7"),
	k.cmd_to_tmux_prefix("8", "8"),
	k.cmd_to_tmux_prefix("9", "9"),
	k.cmd_to_tmux_prefix("`", "n"),
	k.cmd_to_tmux_prefix("b", "B"),
	k.cmd_to_tmux_prefix("C", "C"),
	k.cmd_to_tmux_prefix("d", "D"),
	k.cmd_to_tmux_prefix("E", "%"),
	k.cmd_to_tmux_prefix("e", '"'),
	k.cmd_to_tmux_prefix("G", "G"),
	k.cmd_to_tmux_prefix("g", "g"),
	k.cmd_to_tmux_prefix("j", "O"),
	k.cmd_to_tmux_prefix("k", "T"),
	k.cmd_to_tmux_prefix("l", "L"),
	k.cmd_to_tmux_prefix("n", '"'),
	k.cmd_to_tmux_prefix("N", "%"),
	k.cmd_to_tmux_prefix("o", "u"),
	k.cmd_to_tmux_prefix("T", "!"),
	k.cmd_to_tmux_prefix("t", "c"),
	k.cmd_to_tmux_prefix("w", "x"),
	k.cmd_to_tmux_prefix("z", "z"),
	k.cmd_key(
		"R",
		act.Multiple({
			act.SendKey({ key = "\x1b" }), -- escape
			k.multiple_actions(":source %"),
		})
	),
	k.cmd_key(
		"s",
		act.Multiple({
			act.SendKey({ key = "\x1b" }), -- escape
			k.multiple_actions(":w"),
		})
	),

	{
		mods = "CMD|SHIFT",
		key = "}",
		action = act.Multiple({
			act.SendKey({ mods = "CTRL", key = "b" }),
			act.SendKey({ key = "n" }),
		}),
	},

	{
		mods = "CMD|SHIFT",
		key = "{",
		action = act.Multiple({
			act.SendKey({ mods = "CTRL", key = "b" }),
			act.SendKey({ key = "p" }),
		}),
	},

	{
		mods = "CTRL",
		key = "Tab",
		action = act.Multiple({
			act.SendKey({ mods = "CTRL", key = "b" }),
			act.SendKey({ key = "n" }),
		}),
	},

	{
		mods = "CTRL|SHIFT",
		key = "Tab",
		action = act.Multiple({
			act.SendKey({ mods = "CTRL", key = "b" }),
			act.SendKey({ key = "n" }),
		}),
	},

	{
		mods = "CMD",
		key = "~",
		action = act.Multiple({
			act.SendKey({ mods = "CTRL", key = "b" }),
			act.SendKey({ key = "p" }),
		}),
	},
}

return config