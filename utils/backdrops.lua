local wezterm = require("wezterm")
local platform = require("utils.platform")()
local colors = require("colors.custom")

-- Seed random number generator
math.randomseed(os.time())

local PATH_SEP = platform.is_win and "\\" or "/"

---@class BackDrops
---@field current_idx number Index of current image
---@field files string[] Background images
local BackDrops = {}
BackDrops.__index = BackDrops

-- ─────────────────────────────────────────────────────────────
-- Initialize backdrop controller
-- ─────────────────────────────────────────────────────────────
---@private
---@return BackDrops
function BackDrops:init()
  local initial = {
    current_idx = 1,
    files = {},
  }
  local backdrops = setmetatable(initial, self)
  wezterm.GLOBAL.background = nil
  return backdrops
end

-- ─────────────────────────────────────────────────────────────
-- Set the list of background files
-- Must be called before using other BackDrops methods
-- ─────────────────────────────────────────────────────────────
---@return BackDrops
function BackDrops:set_files()
  self.files = wezterm.read_dir(wezterm.config_dir .. PATH_SEP .. "backdrops")
  wezterm.GLOBAL.background = self.files[1]
  return self
end

-- ─────────────────────────────────────────────────────────────
-- Apply the current background to a window
-- ─────────────────────────────────────────────────────────────
---@private
---@param window any WezTerm Window
function BackDrops:_set_opt(window)
  local opts = {
    background = {
      {
        source = { File = wezterm.GLOBAL.background },
        horizontal_align = "Center",
      },
      {
        source = { Color = colors.background },
        height = "100%",
        width = "100%",
        opacity = 0.90,
      },
    },
  }
  window:set_config_overrides(opts)
end

-- ─────────────────────────────────────────────────────────────
-- Convert the files array to InputSelector choices
-- ─────────────────────────────────────────────────────────────
---@return table[]
function BackDrops:choices()
  local choices = {}
  for idx, file in ipairs(self.files) do
    local name = file:match("([^" .. PATH_SEP .. "]+)$")
    table.insert(choices, { id = tostring(idx), label = name })
  end
  return choices
end

-- ─────────────────────────────────────────────────────────────
-- Select a random background
-- ─────────────────────────────────────────────────────────────
---@param window? any WezTerm Window
function BackDrops:random(window)
  self.current_idx = math.random(#self.files)
  wezterm.GLOBAL.background = self.files[self.current_idx]
  if window then
    self:_set_opt(window)
  end
end

-- ─────────────────────────────────────────────────────────────
-- Cycle forward through the backgrounds
-- ─────────────────────────────────────────────────────────────
---@param window any WezTerm Window
function BackDrops:cycle_forward(window)
  self.current_idx = (self.current_idx % #self.files) + 1
  wezterm.GLOBAL.background = self.files[self.current_idx]
  self:_set_opt(window)
end

-- ─────────────────────────────────────────────────────────────
-- Cycle backward through the backgrounds
-- ─────────────────────────────────────────────────────────────
---@param window any WezTerm Window
function BackDrops:cycle_back(window)
  self.current_idx = (self.current_idx == 1) and #self.files or self.current_idx - 1
  wezterm.GLOBAL.background = self.files[self.current_idx]
  self:_set_opt(window)
end

-- ─────────────────────────────────────────────────────────────
-- Set a specific background by index
-- ─────────────────────────────────────────────────────────────
---@param window any WezTerm Window
---@param idx number Index of the files array (1-based)
function BackDrops:set_img(window, idx)
  if idx < 1 or idx > #self.files then
    wezterm.log_error("Index out of range")
    return
  end
  self.current_idx = idx
  wezterm.GLOBAL.background = self.files[self.current_idx]
  self:_set_opt(window)
end

-- ─────────────────────────────────────────────────────────────
-- Return initialized BackDrops instance
-- ─────────────────────────────────────────────────────────────
return BackDrops:init()
