local wezterm = require("wezterm")

-- ─────────────────────────────────────────────────────────────
-- Helper: Check if a pattern exists in a string
-- ─────────────────────────────────────────────────────────────
--- Checks if a pattern exists in a string
---@param str string The string to search in
---@param pattern string The Lua pattern to match
---@return boolean True if pattern is found, false otherwise
local function is_found(str, pattern)
  return string.find(str, pattern) ~= nil
end

-- ─────────────────────────────────────────────────────────────
-- Determine the current platform
-- ─────────────────────────────────────────────────────────────
--- Returns a table with platform information
---@return table { os: string, is_win: boolean, is_linux: boolean, is_mac: boolean }
local function platform()
  local target = wezterm.target_triple

  local is_win = is_found(target, "windows")
  local is_linux = is_found(target, "linux")
  local is_mac = is_found(target, "apple")

  local os_name = is_win and "windows" or is_linux and "linux" or is_mac and "mac" or "unknown"

  return {
    os = os_name,
    is_win = is_win,
    is_linux = is_linux,
    is_mac = is_mac,
  }
end

return platform
