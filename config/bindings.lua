-- ─────────────────────────────────────────────────────────────
-- WezTerm Config — Neovim-native Workflow
-- ─────────────────────────────────────────────────────────────

local wezterm = require("wezterm")
local act = wezterm.action

local platform = require("utils.platform")()
local backdrops = require("utils.backdrops")

-- ─────────────────────────────────────────────────────────────
-- Modifiers per platform
-- ─────────────────────────────────────────────────────────────
local mod = {}
if platform.is_mac then
  mod.SUPER = "SUPER"
  mod.SUPER_REV = "SUPER|CTRL"
else
  mod.SUPER = "ALT"
  mod.SUPER_REV = "ALT|CTRL"
end

-- ─────────────────────────────────────────────────────────────
-- Smart pane navigation helper
-- ─────────────────────────────────────────────────────────────
local function smart_nav(direction)
  return wezterm.action_callback(function(window, pane)
    local success = window:perform_action(act.ActivatePaneDirection(direction), pane)
    if not success then
      -- Fallback to tab switching for horizontal directions
      if direction == "Left" then
        window:perform_action(act.ActivateTabRelative(-1), pane)
      elseif direction == "Right" then
        window:perform_action(act.ActivateTabRelative(1), pane)
      end
    end
  end)
end

-- ─────────────────────────────────────────────────────────────
-- Key Bindings
-- ─────────────────────────────────────────────────────────────
local keys = {
  -- Misc
  { key = "F1",  mods = "NONE", action = "ActivateCopyMode" },
  { key = "F2",  mods = "NONE", action = act.ActivateCommandPalette },
  { key = "F3",  mods = "NONE", action = act.ShowLauncher },
  { key = "F4",  mods = "NONE", action = act.ShowLauncherArgs({ flags = "FUZZY|TABS" }) },
  { key = "F5",  mods = "NONE", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
  { key = "F11", mods = "NONE", action = act.ToggleFullScreen },
  { key = "F12", mods = "NONE", action = act.ShowDebugOverlay },
  { key = "f",   mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = "" }) },

  -- URL QuickSelect
  {
    key = "u",
    mods = mod.SUPER,
    action = wezterm.action.QuickSelectArgs({
      label = "open url",
      patterns = {
        "\\((https?://\\S+)\\)", "\\[(https?://\\S+)\\]", "\\{(https?://\\S+)\\}",
        "<(https?://\\S+)>", "\\bhttps?://\\S+[)/a-zA-Z0-9-]+",
      },
      action = wezterm.action_callback(function(window, pane)
        local url = window:get_selection_text_for_pane(pane)
        wezterm.log_info("opening: " .. url)
        wezterm.open_with(url)
      end),
    }),
  },

  -- Cursor Movement
  { key = "LeftArrow",  mods = mod.SUPER, action = act.SendString("\x1bOH") },
  { key = "RightArrow", mods = mod.SUPER, action = act.SendString("\x1bOF") },
  { key = "Backspace",  mods = mod.SUPER, action = act.SendString("\x15") },

  -- Copy / Paste
  { key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
  { key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },

  -- Tab Management
  { key = "t", mods = mod.SUPER, action = act.SpawnTab("DefaultDomain") },
  { key = "t", mods = mod.SUPER_REV, action = act.SpawnTab({ DomainName = "WSL:Ubuntu" }) },
  { key = "w", mods = mod.SUPER_REV, action = act.CloseCurrentTab({ confirm = false }) },
  { key = "[", mods = mod.SUPER, action = act.ActivateTabRelative(-1) },
  { key = "]", mods = mod.SUPER, action = act.ActivateTabRelative(1) },
  { key = "[", mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
  { key = "]", mods = mod.SUPER_REV, action = act.MoveTabRelative(1) },

  -- Window Management
  { key = "n", mods = mod.SUPER, action = act.SpawnWindow },

  -- Backgrounds
  { key = "/", mods = mod.SUPER, action = wezterm.action_callback(function(window) backdrops:random(window) end) },
  { key = ",", mods = mod.SUPER, action = wezterm.action_callback(function(window) backdrops:cycle_back(window) end) },
  { key = ".", mods = mod.SUPER, action = wezterm.action_callback(function(window) backdrops:cycle_forward(window) end) },
  {
    key = "/",
    mods = mod.SUPER_REV,
    action = act.InputSelector({
      title = "Select Background",
      choices = backdrops:choices(),
      fuzzy = true,
      fuzzy_description = "Select Background: ",
      action = wezterm.action_callback(function(window, _pane, idx)
        backdrops:set_img(window, tonumber(idx))
      end),
    }),
  },

  -- Pane Management
  { key = "\\", mods = mod.SUPER, action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "\\", mods = mod.SUPER_REV, action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "Enter", mods = mod.SUPER, action = act.TogglePaneZoomState },
  { key = "w", mods = mod.SUPER, action = act.CloseCurrentPane({ confirm = false }) },

  -- Smart pane navigation (Neovim-style)
  { key = "h", mods = mod.SUPER_REV, action = smart_nav("Left") },
  { key = "l", mods = mod.SUPER_REV, action = smart_nav("Right") },
  { key = "k", mods = mod.SUPER_REV, action = smart_nav("Up") },
  { key = "j", mods = mod.SUPER_REV, action = smart_nav("Down") },

  -- Leader + KeyTables
  {
    key = "f",
    mods = "LEADER",
    action = act.ActivateKeyTable({ name = "resize_font", one_shot = false, timeout_milliseconds = 1000 }),
  },
  {
    key = "p",
    mods = "LEADER",
    action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false, timeout_milliseconds = 1000 }),
  },
  {
    key = "s",
    mods = "LEADER",
    action = act.ActivateKeyTable({ name = "swap_pane", one_shot = false, timeout_milliseconds = 1000 }),
  },
}

-- ─────────────────────────────────────────────────────────────
-- Key Tables: resizing & swapping
-- ─────────────────────────────────────────────────────────────
local key_tables = {
  resize_font = {
    { key = "k", action = act.IncreaseFontSize },
    { key = "j", action = act.DecreaseFontSize },
    { key = "r", action = act.ResetFontSize },
    { key = "Escape", action = "PopKeyTable" },
    { key = "q", action = "PopKeyTable" },
  },
  resize_pane = {
    { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
    { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
    { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
    { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "q", action = "PopKeyTable" },
  },
  swap_pane = {
    { key = "1", action = act.PaneSelect({ alphabet = "1", mode = "SwapWithActiveKeepFocus" }) },
    { key = "2", action = act.PaneSelect({ alphabet = "2", mode = "SwapWithActiveKeepFocus" }) },
    { key = "3", action = act.PaneSelect({ alphabet = "3", mode = "SwapWithActiveKeepFocus" }) },
    { key = "4", action = act.PaneSelect({ alphabet = "4", mode = "SwapWithActiveKeepFocus" }) },
    { key = "5", action = act.PaneSelect({ alphabet = "5", mode = "SwapWithActiveKeepFocus" }) },
    { key = "6", action = act.PaneSelect({ alphabet = "6", mode = "SwapWithActiveKeepFocus" }) },
    { key = "7", action = act.PaneSelect({ alphabet = "7", mode = "SwapWithActiveKeepFocus" }) },
    { key = "8", action = act.PaneSelect({ alphabet = "8", mode = "SwapWithActiveKeepFocus" }) },
    { key = "9", action = act.PaneSelect({ alphabet = "9", mode = "SwapWithActiveKeepFocus" }) },
    { key = "0", action = act.PaneSelect({ alphabet = "0", mode = "SwapWithActiveKeepFocus" }) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "q", action = "PopKeyTable" },
  },
}

-- ─────────────────────────────────────────────────────────────
-- Mouse Bindings
-- ─────────────────────────────────────────────────────────────
local mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = act.OpenLinkAtMouseCursor,
  },
}

-- ─────────────────────────────────────────────────────────────
-- Final Config Export
-- ─────────────────────────────────────────────────────────────
return {
  disable_default_key_bindings = true,
  leader = { key = "Space", mods = mod.SUPER_REV },
  keys = keys,
  key_tables = key_tables,
  mouse_bindings = mouse_bindings,
}
