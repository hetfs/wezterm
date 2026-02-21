local wezterm = require("wezterm")
local platform = require("utils.platform")()

--[[
Troubleshooting Fonts
Run: wezterm ls-fonts
--]]

-- ─────────────────────────────────────────────────────────────
-- Font Configuration
-- ─────────────────────────────────────────────────────────────
local font_name = "JetBrains Mono"
local font_size = platform.is_mac and 8 or 9

return {
  -- Font
  font = wezterm.font(font_name),
  font_size = font_size,

  -- FreeType rendering settings for optimal font display
  freetype_load_target = "Normal",    -- 'Normal' | 'Light' | 'Mono' | 'HorizontalLcd'
  freetype_render_target = "Normal",  -- 'Normal' | 'Light' | 'Mono' | 'HorizontalLcd'
}
