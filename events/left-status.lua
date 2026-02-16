local wezterm = require("wezterm")

local nf = wezterm.nerdfonts
local M = {}

-- ─────────────────────────────────────────────────────────────
-- Glyphs
-- ─────────────────────────────────────────────────────────────
local GLYPH_SEMI_CIRCLE_LEFT = nf.ple_left_half_circle_thick   -- ''
local GLYPH_SEMI_CIRCLE_RIGHT = nf.ple_right_half_circle_thick -- ''
local GLYPH_KEY_TABLE = nf.md_table_key                        -- '󱏅'
local GLYPH_KEY = nf.md_key                                    -- '󰌆'

-- ─────────────────────────────────────────────────────────────
-- Colors
-- ─────────────────────────────────────────────────────────────
local colors = {
  glyph_semi_circle = { bg = "rgba(0, 0, 0, 0.4)", fg = "#fab387" },
  text = { bg = "#fab387", fg = "#1c1b19" },
}

-- ─────────────────────────────────────────────────────────────
-- Internal cell buffer
-- ─────────────────────────────────────────────────────────────
local __cells__ = {}

---@param text string
---@param fg string
---@param bg string
local function _push(text, fg, bg)
  table.insert(__cells__, { Foreground = { Color = fg } })
  table.insert(__cells__, { Background = { Color = bg } })
  table.insert(__cells__, { Attribute = { Intensity = "Bold" } })
  table.insert(__cells__, { Text = text })
end

-- ─────────────────────────────────────────────────────────────
-- Setup the right status for key tables and leader
-- ─────────────────────────────────────────────────────────────
function M.setup()
  wezterm.on("update-right-status", function(window, _pane)
    __cells__ = {}

    -- Show active key table
    local key_table_name = window:active_key_table()
    if key_table_name then
      _push(GLYPH_SEMI_CIRCLE_LEFT, colors.glyph_semi_circle.fg, colors.glyph_semi_circle.bg)
      _push(GLYPH_KEY_TABLE, colors.text.fg, colors.text.bg)
      _push(" " .. string.upper(key_table_name), colors.text.fg, colors.text.bg)
      _push(GLYPH_SEMI_CIRCLE_RIGHT, colors.glyph_semi_circle.fg, colors.glyph_semi_circle.bg)
    end

    -- Show active leader key
    if window:leader_is_active() then
      _push(GLYPH_SEMI_CIRCLE_LEFT, colors.glyph_semi_circle.fg, colors.glyph_semi_circle.bg)
      _push(GLYPH_KEY, colors.text.fg, colors.text.bg)
      _push(" ", colors.text.fg, colors.text.bg)
      _push(GLYPH_SEMI_CIRCLE_RIGHT, colors.glyph_semi_circle.fg, colors.glyph_semi_circle.bg)
    end

    window:set_left_status(wezterm.format(__cells__))
  end)
end

return M
