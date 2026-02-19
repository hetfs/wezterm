local wezterm = require('wezterm')
local platform = require('utils.platform')

-- Define the font and adjust size based on platform
local font = 'JetBrainsMono Nerd Font'
local font_size = platform().is_mac and 10 or 11

return {
   font = wezterm.font(font),
   font_size = font_size,

   -- Set freetype rendering settings for optimal font display
   freetype_load_target = 'Normal',  ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
   freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}

