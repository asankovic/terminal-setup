local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- only for WSL
--config.default_domain = 'WSL:Ubuntu'

-- Theme & Fonts
config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font 'FiraCode Nerd Font'
--config.font = wezterm.font 'HackNerdFont'
config.font_size = 11.0

-- Window
config.enable_tab_bar = false
config.window_decorations = 'RESIZE'
config.window_close_confirmation = 'NeverPrompt'
config.window_background_opacity = 0.99
--config.macos_window_background_blur = 30

-- Keys
config.keys = {
    {
        key = 'f',
        mods = 'CTRL',
        action = wezterm.action.ToggleFullScreen,
    },
}

return config
