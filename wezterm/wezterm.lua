local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_kitty_graphics = true
config.term = "xterm-kitty"
-- config.term = "wezterm"

-- Window settings
config.window_decorations = "NONE"
config.initial_cols = 133
config.initial_rows = 33
config.window_close_confirmation = "NeverPrompt"
config.quit_when_all_windows_are_closed = false
config.use_fancy_tab_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Font
config.font = wezterm.font("JetBrains Mono")
config.font_size = 16

-- Colors
local current_theme = "Catppuccin Macchiato (Gogh)"
config.color_scheme = current_theme
local colors = wezterm.color.get_builtin_schemes()[current_theme]
config.colors = {
	tab_bar = {
		background = colors.background,
		active_tab = {
			bg_color = colors.background,
			fg_color = colors.foreground,
			-- italic = true,
			intensity = "Bold",
			italic = true,
		},
		inactive_tab = {
			bg_color = colors.background,
			fg_color = colors.foreground,
		},
		new_tab = {
			bg_color = colors.background,
			fg_color = colors.foreground,
		},
	},
}

-- keybindings
local act = wezterm.action
config.disable_default_key_bindings = true
config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 3000 }
config.keys = {

	-- Commands
	{ key = "P", mods = "LEADER", action = act.ActivateCommandPalette },
	{ key = "v", mods = "LEADER", action = act.ActivateCopyMode },

	-- Copy - paste
	{ key = "C", mods = "CTRL", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },

	-- Arrow moving
	{ key = "h", mods = "ALT", action = act.SendKey({ key = "LeftArrow" }) },
	{ key = "j", mods = "ALT", action = act.SendKey({ key = "DownArrow" }) },
	{ key = "k", mods = "ALT", action = act.SendKey({ key = "UpArrow" }) },
	{ key = "l", mods = "ALT", action = act.SendKey({ key = "RightArrow" }) },
	{ key = "l", mods = "ALT|CTRL", action = act.SendKey({ key = "RightArrow", mods = "CTRL" }) },

	-- Panes
	{ key = "'", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "/", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
	-- Tabs
	{ key = "\\", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "X", mods = "LEADER", action = act.CloseCurrentTab({ confirm = false }) },

	--binds CTRL 1-9 to switch tabs
	require("tab_activation").set_keybindings({ mods = "LEADER" }),
}

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 2 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 2 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 2 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 2 }) },
		{ key = "q", action = "PopKeyTable" },
	},
}
return config
