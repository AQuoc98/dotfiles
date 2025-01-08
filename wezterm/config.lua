local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = {
	default_cursor_style = "SteadyBar",
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	window_background_opacity = 0.8,
	macos_window_background_blur = 10,
	check_for_updates = false,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	font_size = 12.5,
	font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	enable_tab_bar = false,
	animation_fps = 1,
	max_fps = 120,
	window_padding = {
		left = 3,
		right = 3,
		top = 0,
		bottom = 0,
	},
}
return config
