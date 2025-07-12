-- Import the wezterm API
local wezterm = require("wezterm")

-- Initialize an empty configuration table
local config = {}

config.check_for_updates = true
adjust_window_size_when_changing_font_size = true
-- config.initial_cols = 130
-- config.initial_rows = 35

-- This is where you actually apply your config choices
config.window_padding = {
    top = 0,
    right = 0,
    left = 0,
    bottom = 0,
}

-- config.background = {
-- 	{
-- 		source = {
-- 			File = "C:/Users/rumc-/OneDrive/Fotos/Wallpapers/abstract.png", -- Path to the background image file
-- 			-- File = "C:/Users/rumc-/OneDrive/Fotos/Wallpapers/neon-sign.jpg", -- Path to the background image file
-- 		},
-- 		width = "100%", -- Set the background image width to 100% of the terminal window
-- 		height = "100%", -- Set the background image height to gg100% of the terminal window
-- 		opacity = 1.0, -- Set the opacity of the background image (0.0 - 1.0)
-- 		hsb = {
-- 			brightness = 0.10, -- Set the brightness of the background image (low value to darken the image)
-- 			saturation = 1, -- Set the saturation of the background image
-- 		},
-- 	},
-- }

config.colors = {
    foreground = "#D8E2EC",
    background = "#0F1419",
    cursor_bg = "#539AFC",
    cursor_border = "#539AFC",
    cursor_fg = "#0F1419",
    selection_bg = "#28323A",
    selection_fg = "#D8E2EC",

    ansi = {
        "#1D252C", -- black
        "#C44659", -- red
        "#79CD8D", -- green
        "#FF9E64", -- yellow
        "#4690F7", -- blue
        "#A41D55", -- magenta
        "#60CFD6", -- cyan
        "#B7C5D3", -- white
    },

    brights = {
        "#28323A", -- bright black
        "#D95468", -- bright red
        "#8BD49C", -- bright green
        "#EBBF83", -- bright yellow
        "#539AFC", -- bright blue
        "#B62D65", -- bright magenta
        "#70E1E8", -- bright cyan
        "#FBFBFD", -- bright white
    },
}

-- Set the terminal font
config.font = wezterm.font("CaskaydiaCove Nerd Font")
-- config.font = wezterm.font("FiraCode NF")
-- config.font = wezterm.font("Liga SFMono Nerd Font")
-- config.font = wezterm.font("Iosevka NF")

-- Hide the tab bar if only one tab is open
config.hide_tab_bar_if_only_one_tab = true
config.max_fps = 240 -- hack for smoothness
-- config.window_decorations = "RESIZE"

-- Font Size
config.font_size = 13

-- Enable Kitty Graphics
config.enable_kitty_graphics = true

-- Background with Transparency
config.window_background_opacity = 0.85 -- Adjust this value as needed
-- config.win32_system_backdrop = "Acrylic" -- Only Works in Windows

-- Disable Scroll Bar
config.enable_scroll_bar = false

-- activate ONLY if windows --

config.default_domain = "WSL:Ubuntu"
config.front_end = "OpenGL"
local gpus = wezterm.gui.enumerate_gpus()
if #gpus > 0 then
    config.webgpu_preferred_adapter = gpus[1] -- only set if there's at least one GPU
else
    -- fallback to default behavior or log a message
    wezterm.log_info("No GPUs found, using default settings")
end

-- and finally, return the configuration to wezterm

return config
