local wezterm = require("wezterm")
local gpu_adapters = require("utils.gpu_adapter")
local colors = require("colors.custom")

-- ─────────────────────────────────────────────────────────────
-- WezTerm GPU & Performance Configuration
-- ─────────────────────────────────────────────────────────────
return {
  -- Rendering
  animation_fps = 60,                  -- Smooth animations
  max_fps = 60,                        -- Limits FPS to save resources
  front_end = "WebGpu",                -- Use WebGPU for rendering
  webgpu_power_preference = "HighPerformance", -- Prefer high-performance GPU
  webgpu_preferred_adapter = gpu_adapters:pick_best(), -- Auto-select best GPU adapter

  -- Color Scheme
  colors = colors,

  -- Background
  background = {
    {
      source = { File = wezterm.GLOBAL.background }, -- Custom image
      horizontal_align = "Center",
    },
    {
      source = { Color = colors.background },        -- Overlay color with opacity
      height = "100%",
      width = "100%",
      opacity = 0.90,
    },
  },

  -- Scrollbar
  enable_scroll_bar = true,

  -- Tab Bar
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  use_fancy_tab_bar = false,        -- Simple tab bar for performance
  tab_max_width = 20,
  show_tab_index_in_tab_bar = false,
  switch_to_last_active_tab_when_closing_tab = true,

  -- Window Settings
  window_padding = {
    left = 4,
    right = 8,
    top = 10,
    bottom = 6,
  },
  window_close_confirmation = "NeverPrompt", -- Disable close confirmation
  window_frame = {
    active_titlebar_bg = "#090909", -- Dark title bar
  },
  inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.70, -- Dim inactive panes
  },
}
