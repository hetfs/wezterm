-- status line with date and battery

local wezterm = require("wezterm")
local umath = require("utils.math")

local nf = wezterm.nerdfonts
local M = {}

-- ─────────────────────────────────────────────────────────────
-- Separator
-- ─────────────────────────────────────────────────────────────
local SEPARATOR_CHAR = "" -- You can replace this with any separator

-- ─────────────────────────────────────────────────────────────
-- Battery icons
-- ─────────────────────────────────────────────────────────────
local discharging_icons = {
  nf.md_battery_10, nf.md_battery_20, nf.md_battery_30, nf.md_battery_40,
  nf.md_battery_50, nf.md_battery_60, nf.md_battery_70, nf.md_battery_80,
  nf.md_battery_90, nf.md_battery,
}

local charging_icons = {
  nf.md_battery_charging_10, nf.md_battery_charging_20, nf.md_battery_charging_30,
  nf.md_battery_charging_40, nf.md_battery_charging_50, nf.md_battery_charging_60,
  nf.md_battery_charging_70, nf.md_battery_charging_80, nf.md_battery_charging_90,
  nf.md_battery_charging,
}

-- ─────────────────────────────────────────────────────────────
-- Colors for status line
-- ─────────────────────────────────────────────────────────────
local colors = {
  date_fg = "#fab387",
  date_bg = "rgba(0, 0, 0, 0.4)",
  battery_fg = "#f9e2af",
  battery_bg = "rgba(0, 0, 0, 0.4)",
  separator_fg = "#74c7ec",
  separator_bg = "rgba(0, 0, 0, 0.4)",
}

local __cells__ = {} -- Table to hold formatted status items

-- ─────────────────────────────────────────────────────────────
-- Push a new item to the status line
-- ─────────────────────────────────────────────────────────────
---@param bg string Background color
---@param fg string Foreground color
---@param icon string Icon string
---@param text string Text to display
---@param separate boolean Whether to add separator after
local function push(bg, fg, icon, text, separate)
  table.insert(__cells__, { Background = { Color = bg } })
  table.insert(__cells__, { Foreground = { Color = fg } })
  table.insert(__cells__, { Attribute = { Intensity = "Bold" } })
  table.insert(__cells__, { Text = icon .. " " .. text .. " " })

  if separate then
    table.insert(__cells__, { Foreground = { Color = colors.separator_fg } })
    table.insert(__cells__, { Background = { Color = colors.separator_bg } })
    table.insert(__cells__, { Text = SEPARATOR_CHAR })
  end
end

-- ─────────────────────────────────────────────────────────────
-- Set the current date and time
-- ─────────────────────────────────────────────────────────────
local function set_date()
  local date = wezterm.strftime(" %a %H:%M:%S")
  push(colors.date_bg, colors.date_fg, nf.fa_calendar, date, true)
end

-- ─────────────────────────────────────────────────────────────
-- Set the battery status
-- ─────────────────────────────────────────────────────────────
local function set_battery()
  local charge, icon = "", ""

  for _, b in ipairs(wezterm.battery_info()) do
    local idx = umath.clamp(umath.round(b.state_of_charge * 10), 1, 10)
    charge = string.format("%.0f%%", b.state_of_charge * 100)

    if b.state == "Charging" then
      icon = charging_icons[idx]
    else
      icon = discharging_icons[idx]
    end
  end

  push(colors.battery_bg, colors.battery_fg, icon, charge, false)
end

-- ─────────────────────────────────────────────────────────────
-- Setup the right status update function
-- ─────────────────────────────────────────────────────────────
function M.setup()
  wezterm.on("update-right-status", function(window, _pane)
    __cells__ = {}
    set_date()
    set_battery()
    window:set_right_status(wezterm.format(__cells__))
  end)
end

return M
