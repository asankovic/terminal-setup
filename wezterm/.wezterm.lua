local wezterm = require("wezterm")
local mux = wezterm.mux

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- mainly for Windows taskbar
local screen_height_offset = 0

-- OS-specific config
if wezterm.target_triple:find("windows") ~= nil then
	config.default_domain = "WSL:Ubuntu"
	screen_height_offset = 50
elseif wezterm.target_triple:find("darwin") ~= nil then
	--config.macos_window_background_blur = 30
end

-- Theme & Fonts
-- config.color_scheme = 'Catppuccin Mocha'
local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#11111B"
config.color_schemes = {
	["AlenCatpuccin"] = custom,
}
config.color_scheme = "AlenCatpuccin"

config.font = wezterm.font("FiraCode Nerd Font")
--config.font = wezterm.font 'HackNerdFont'
config.font_size = 11.0

-- Window
config.enable_tab_bar = false
config.initial_rows = 68
config.initial_cols = 275
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.99

config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.5cell",
	bottom = "0cell",
}
-- Keys
config.keys = {
	{
		key = "f",
		mods = "CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- centers screen on startup
wezterm.on("gui-attached", function(domain)
	local workspace = mux.get_active_workspace()
	for _, window in ipairs(mux.all_windows()) do
		if window:get_workspace() == workspace then
			local gui_window = window:gui_window()
			local window_height = gui_window:get_dimensions().pixel_height
			local window_width = gui_window:get_dimensions().pixel_width

			local screen_height = wezterm.gui.screens().active.height - screen_height_offset
			local screen_width = wezterm.gui.screens().active.width

			local center_y = (screen_height - window_height) / 2
			local center_x = (screen_width - window_width) / 2

			gui_window:set_position(center_x, center_y)
		end
	end
end)

return config
