-- =====================================================
-- WezTerm Configuration
-- =====================================================

local wezterm = require("wezterm")
local act = wezterm.action

local platform = require("utils.platform")()
local backdrops = require("utils.backdrops")

-- =====================================================
-- Platform Modifiers
-- =====================================================

local mod = {}

if platform.is_mac then
  mod.SUPER = "SUPER"
  mod.SUPER_REV = "SUPER|CTRL"
elseif platform.is_win or platform.is_linux then
  mod.SUPER = "ALT"         -- Avoid Windows key conflicts
  mod.SUPER_REV = "ALT|CTRL"
end

-- =====================================================
-- Key Bindings
-- =====================================================

local keys = {

  -- ---------------------------------------------------
  -- Function Keys / System
  -- ---------------------------------------------------
  { key = "F1",  mods = "NONE", action = "ActivateCopyMode" },
  { key = "F2",  mods = "NONE", action = act.ActivateCommandPalette },
  { key = "F3",  mods = "NONE", action = act.ShowLauncher },
  { key = "F4",  mods = "NONE", action = act.ShowLauncherArgs({ flags = "FUZZY|TABS" }) },
  { key = "F5",  mods = "NONE", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
  { key = "F11", mods = "NONE", action = act.ToggleFullScreen },
  { key = "F12", mods = "NONE", action = act.ShowDebugOverlay },

  -- ---------------------------------------------------
  -- Search / Quick Select
  -- ---------------------------------------------------
  { key = "f", mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = "" }) },
  { key = "F", mods = "CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
  { key = "phys:Space", mods = "SHIFT|CTRL", action = act.QuickSelect },
  {
    key = "u",
    mods = mod.SUPER,
    action = wezterm.action.QuickSelectArgs({
      label = "open url",
      patterns = {
        "\\((https?://\\S+)\\)",
        "\\[(https?://\\S+)\\]",
        "\\{(https?://\\S+)\\}",
        "<(https?://\\S+)>",
        "\\bhttps?://\\S+[)/a-zA-Z0-9-]+",
      },
      action = wezterm.action_callback(function(window, pane)
        local url = window:get_selection_text_for_pane(pane)
        wezterm.open_with(url)
      end),
    }),
  },

  -- ---------------------------------------------------
  -- Clipboard
  -- ---------------------------------------------------
  { key = "C", mods = "CTRL", action = act.CopyTo("Clipboard") },
  { key = "c", mods = mod.SUPER, action = act.CopyTo("Clipboard") },
  { key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
  { key = "v", mods = mod.SUPER, action = act.PasteFrom("Clipboard") },
  { key = "Insert", mods = "SHIFT", action = act.PasteFrom("PrimarySelection") },
  { key = "Insert", mods = "CTRL", action = act.CopyTo("PrimarySelection") },
  { key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard") },
  { key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard") },

  -- ---------------------------------------------------
  -- Tab Management
  -- ---------------------------------------------------
  { key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
  { key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },

  { key = "t", mods = mod.SUPER, action = act.SpawnTab("DefaultDomain") },
  { key = "t", mods = mod.SUPER_REV, action = act.SpawnTab({ DomainName = "WSL:Ubuntu" }) },
  { key = "w", mods = mod.SUPER_REV, action = act.CloseCurrentTab({ confirm = false }) },
  { key = "[", mods = mod.SUPER, action = act.ActivateTabRelative(-1) },
  { key = "]", mods = mod.SUPER, action = act.ActivateTabRelative(1) },
  { key = "[", mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
  { key = "]", mods = mod.SUPER_REV, action = act.MoveTabRelative(1) },

  { key = "1", mods = "CTRL", action = act.ActivateTab(0) },
  { key = "2", mods = "CTRL", action = act.ActivateTab(1) },
  { key = "3", mods = "CTRL", action = act.ActivateTab(2) },
  { key = "4", mods = "CTRL", action = act.ActivateTab(3) },
  { key = "5", mods = "CTRL", action = act.ActivateTab(4) },

  -- ---------------------------------------------------
  -- Window
  -- ---------------------------------------------------
  { key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
  { key = "m", mods = mod.SUPER, action = act.Hide },
  { key = "n", mods = mod.SUPER, action = act.SpawnWindow },

  -- ---------------------------------------------------
  -- Font Size
  -- ---------------------------------------------------
  { key = "+", mods = "CTRL", action = act.IncreaseFontSize },
  { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
  { key = "=", mods = "CTRL", action = act.IncreaseFontSize },
  { key = "0", mods = "CTRL", action = act.ResetFontSize },

  -- ---------------------------------------------------
  -- Pane Management
  -- ---------------------------------------------------
  { key = "\\", mods = mod.SUPER, action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "\\", mods = mod.SUPER_REV, action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

  { key = "Z", mods = "CTRL", action = act.TogglePaneZoomState },
  { key = "X", mods = "CTRL", action = act.ActivateCopyMode },
  { key = "phys:Space", mods = "SHIFT|CTRL", action = act.QuickSelect },
  { key = "w", mods = mod.SUPER, action = act.CloseCurrentPane({ confirm = true }) },

  { key = "h", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = mod.SUPER_REV, action = act.ActivatePaneDirection("Right") },
  {
    key = "p",
    mods = mod.SUPER_REV,
    action = act.PaneSelect({ alphabet = "1234567890", mode = "SwapWithActiveKeepFocus" }),
  },

  -- ---------------------------------------------------
  -- Background Control
  -- ---------------------------------------------------
  {
    key = "/",
    mods = mod.SUPER,
    action = wezterm.action_callback(function(window) backdrops:random(window) end),
  },
  {
    key = ",",
    mods = mod.SUPER,
    action = wezterm.action_callback(function(window) backdrops:cycle_back(window) end),
  },
  {
    key = ".",
    mods = mod.SUPER,
    action = wezterm.action_callback(function(window) backdrops:cycle_forward(window) end),
  },
  {
    key = "/",
    mods = mod.SUPER_REV,
    action = act.InputSelector({
      title = "Select Background",
      choices = backdrops:choices(),
      fuzzy = true,
      action = wezterm.action_callback(function(window, _, idx)
        backdrops:set_img(window, tonumber(idx))
      end),
    }),
  },

  -- -- ---------------------------------------------------
  -- -- Leader Key Actions
  -- -- ---------------------------------------------------
  -- { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  -- { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  -- { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  -- { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  --
  -- { key = "H", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 3 }) },
  -- { key = "J", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 3 }) },
  -- { key = "K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 3 }) },
  -- { key = "L", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 3 }) },
  --
  -- { key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  -- { key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  -- { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
  -- { key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
}

-- =====================================================
-- Key Tables
-- =====================================================

-- local key_tables = {
--   resize_font = {
--     { key = "k", action = act.IncreaseFontSize },
--     { key = "j", action = act.DecreaseFontSize },
--     { key = "r", action = act.ResetFontSize },
--     { key = "Escape", action = "PopKeyTable" },
--     { key = "q", action = "PopKeyTable" },
--   },
--   resize_pane = {
--     { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
--     { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
--     { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
--     { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
--     { key = "Escape", action = "PopKeyTable" },
--     { key = "q", action = "PopKeyTable" },
--   },
-- }

-- =====================================================
-- Mouse Bindings
-- =====================================================

local mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = act.CompleteSelection("ClipboardAndPrimarySelection"),
  },
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = act.OpenLinkAtMouseCursor,
  },
  {
    event = { Down = { streak = 3, button = "Left" } },
    mods = "NONE",
    action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
  },
}

-- =====================================================
-- Final Config
-- =====================================================

return {
  disable_default_key_bindings = true,
  leader = { key = "Space", mods = mod.SUPER_REV },
  keys = keys,
  -- key_tables = key_tables,
  mouse_bindings = mouse_bindings,
}
