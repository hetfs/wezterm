--─────────────────────────────────────────────────────────────
-- WezTerm Keybinding Guide (Example Reference)
--
-- Default Key Assignments:
-- https://wezterm.org/config/default-keys.html
--
-- This file is NOT intended for direct production use.
-- It exists purely as a structured learning reference
-- and inspiration for designing a modular keybinding system.
--
-- Philosophy:
--   • Disable defaults for full control
--   • Centralize all bindings in one predictable structure
--   • Use a Leader-driven pane workflow
--   • Provide redundant tab access (numbers + symbols)
--   • Maintain cross-platform consistency
--   • Encourage clarity and maintainability
--─────────────────────────────────────────────────────────────

local wezterm = require("wezterm")
local act = wezterm.action
local M = {}

--─────────────────────────────────────────────────────────────
-- Setup
--─────────────────────────────────────────────────────────────

function M.setup(config)
  -- Disable all built-in defaults
  config.disable_default_key_bindings = true

  -- Leader: CTRL + a (1 second timeout)
  config.leader = {
    key = "a",
    mods = "CTRL",
    timeout_milliseconds = 1000,
  }

  config.keys = {

    ------------------------------------------------------------------
    -- Appearance / UI
    ------------------------------------------------------------------
    { key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
    { key = "F11", mods = "NONE", action = act.ToggleFullScreen },

    { key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
    { key = "L", mods = "SHIFT|CTRL", action = act.ShowDebugOverlay },
    { key = "l", mods = "SHIFT|CTRL", action = act.ShowDebugOverlay },

    ------------------------------------------------------------------
    -- Theme / Background
    ------------------------------------------------------------------
    { key = "E", mods = "CTRL|SHIFT|ALT", action = act.EmitEvent("toggle-colorscheme") },
    { key = "o", mods = "CTRL|SHIFT", action = act.EmitEvent("toggle-background") },
    { key = "o", mods = "CTRL|ALT|SHIFT", action = act.EmitEvent("toggle-opacity") },

    ------------------------------------------------------------------
    -- Tabs: Navigation
    ------------------------------------------------------------------
    { key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
    { key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },

    { key = "[", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(-1) },
    { key = "]", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(1) },

    { key = "{", mods = "SUPER", action = act.ActivateTabRelative(-1) },
    { key = "{", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(-1) },
    { key = "}", mods = "SUPER", action = act.ActivateTabRelative(1) },
    { key = "}", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(1) },

    { key = "PageUp", mods = "CTRL", action = act.ActivateTabRelative(-1) },
    { key = "PageDown", mods = "CTRL", action = act.ActivateTabRelative(1) },

    ------------------------------------------------------------------
    -- Tabs: Direct Index (CTRL + Number)
    ------------------------------------------------------------------
    { key = "1", mods = "CTRL", action = act.ActivateTab(0) },
    { key = "2", mods = "CTRL", action = act.ActivateTab(1) },
    { key = "3", mods = "CTRL", action = act.ActivateTab(2) },
    { key = "4", mods = "CTRL", action = act.ActivateTab(3) },
    { key = "5", mods = "CTRL", action = act.ActivateTab(4) },

    ------------------------------------------------------------------
    -- Extended Direct Index Variants
    ------------------------------------------------------------------
    { key = "1", mods = "SHIFT|CTRL", action = act.ActivateTab(0) },
    { key = "1", mods = "SUPER", action = act.ActivateTab(0) },

    { key = "2", mods = "SHIFT|CTRL", action = act.ActivateTab(1) },
    { key = "2", mods = "SUPER", action = act.ActivateTab(1) },

    { key = "3", mods = "SHIFT|CTRL", action = act.ActivateTab(2) },
    { key = "3", mods = "SUPER", action = act.ActivateTab(2) },

    { key = "4", mods = "SHIFT|CTRL", action = act.ActivateTab(3) },
    { key = "4", mods = "SUPER", action = act.ActivateTab(3) },

    { key = "5", mods = "SHIFT|CTRL", action = act.ActivateTab(4) },
    { key = "5", mods = "SHIFT|ALT|CTRL", action = act.SplitHorizontal },
    { key = "5", mods = "SUPER", action = act.ActivateTab(4) },

    { key = "6", mods = "SHIFT|CTRL", action = act.ActivateTab(5) },
    { key = "6", mods = "SUPER", action = act.ActivateTab(5) },

    { key = "7", mods = "SHIFT|CTRL", action = act.ActivateTab(6) },
    { key = "7", mods = "SUPER", action = act.ActivateTab(6) },

    { key = "8", mods = "SHIFT|CTRL", action = act.ActivateTab(7) },
    { key = "8", mods = "SUPER", action = act.ActivateTab(7) },

    { key = "9", mods = "SHIFT|CTRL", action = act.ActivateTab(-1) },
    { key = "9", mods = "SUPER", action = act.ActivateTab(-1) },

    ------------------------------------------------------------------
    -- Tabs: Symbol Index
    ------------------------------------------------------------------
    { key = "!", mods = "CTRL", action = act.ActivateTab(0) },
    { key = "!", mods = "SHIFT|CTRL", action = act.ActivateTab(0) },

    { key = "@", mods = "CTRL", action = act.ActivateTab(1) },
    { key = "@", mods = "SHIFT|CTRL", action = act.ActivateTab(1) },

    { key = "#", mods = "CTRL", action = act.ActivateTab(2) },
    { key = "#", mods = "SHIFT|CTRL", action = act.ActivateTab(2) },

    { key = "$", mods = "CTRL", action = act.ActivateTab(3) },
    { key = "$", mods = "SHIFT|CTRL", action = act.ActivateTab(3) },

    { key = "%", mods = "CTRL", action = act.ActivateTab(4) },
    { key = "%", mods = "SHIFT|CTRL", action = act.ActivateTab(4) },

    { key = "^", mods = "CTRL", action = act.ActivateTab(5) },
    { key = "^", mods = "SHIFT|CTRL", action = act.ActivateTab(5) },

    { key = "&", mods = "CTRL", action = act.ActivateTab(6) },
    { key = "&", mods = "SHIFT|CTRL", action = act.ActivateTab(6) },

    { key = "*", mods = "CTRL", action = act.ActivateTab(7) },
    { key = "*", mods = "SHIFT|CTRL", action = act.ActivateTab(7) },

    { key = "(", mods = "CTRL", action = act.ActivateTab(-1) },
    { key = "(", mods = "SHIFT|CTRL", action = act.ActivateTab(-1) },

    ------------------------------------------------------------------
    -- Tab Management
    ------------------------------------------------------------------
    { key = "T", mods = "CTRL", action = act.ShowLauncher },
    { key = "T", mods = "SHIFT|CTRL", action = act.ShowLauncher },
    { key = "t", mods = "SUPER", action = act.ShowLauncher },

    { key = "W", mods = "CTRL", action = act.CloseCurrentTab({ confirm = true }) },
    { key = "W", mods = "SHIFT|CTRL", action = act.CloseCurrentTab({ confirm = true }) },
    { key = "w", mods = "SUPER", action = act.CloseCurrentTab({ confirm = true }) },

    ------------------------------------------------------------------
    -- Font Controls
    ------------------------------------------------------------------
    { key = "+", mods = "CTRL", action = act.IncreaseFontSize },
    { key = "+", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
    { key = "=", mods = "CTRL", action = act.IncreaseFontSize },
    { key = "=", mods = "SHIFT|CTRL", action = act.IncreaseFontSize },
    { key = "=", mods = "SUPER", action = act.IncreaseFontSize },

    { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
    { key = "-", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },
    { key = "-", mods = "SUPER", action = act.DecreaseFontSize },

    { key = "_", mods = "CTRL", action = act.DecreaseFontSize },
    { key = "_", mods = "SHIFT|CTRL", action = act.DecreaseFontSize },

    { key = "0", mods = "CTRL", action = act.ResetFontSize },
    { key = "0", mods = "SHIFT|CTRL", action = act.ResetFontSize },
    { key = "0", mods = "SUPER", action = act.ResetFontSize },

    { key = ")", mods = "CTRL", action = act.ResetFontSize },
    { key = ")", mods = "SHIFT|CTRL", action = act.ResetFontSize },

    ------------------------------------------------------------------
    -- Clipboard
    ------------------------------------------------------------------
    { key = "C", mods = "CTRL", action = act.CopyTo("Clipboard") },
    { key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
    { key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },

    { key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
    { key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },

    { key = "Insert", mods = "SHIFT", action = act.PasteFrom("PrimarySelection") },
    { key = "Insert", mods = "CTRL", action = act.CopyTo("PrimarySelection") },

    { key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard") },
    { key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard") },

    ------------------------------------------------------------------
    -- Search / Selection
    ------------------------------------------------------------------
    { key = "F", mods = "CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
    { key = "F", mods = "SHIFT|CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
    { key = "f", mods = "SUPER", action = act.Search("CurrentSelectionOrEmptyString") },

    { key = "phys:Space", mods = "SHIFT|CTRL", action = act.QuickSelect },

    ------------------------------------------------------------------
    -- System / Window
    ------------------------------------------------------------------
    { key = "N", mods = "CTRL", action = act.SpawnWindow },
    { key = "n", mods = "SUPER", action = act.SpawnWindow },

    { key = "M", mods = "CTRL", action = act.Hide },
    { key = "M", mods = "SHIFT|CTRL", action = act.Hide },
    { key = "m", mods = "SUPER", action = act.Hide },

    { key = "R", mods = "CTRL", action = act.ReloadConfiguration },
    { key = "R", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },
    { key = "r", mods = "SUPER", action = act.ReloadConfiguration },

    { key = "P", mods = "CTRL", action = act.ActivateCommandPalette },

    ------------------------------------------------------------------
    -- Scroll / Navigation
    ------------------------------------------------------------------
    { key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-1) },
    { key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(1) },

    { key = "PageUp", mods = "SHIFT|CTRL", action = act.MoveTabRelative(-1) },
    { key = "PageDown", mods = "SHIFT|CTRL", action = act.MoveTabRelative(1) },

    { key = "UpArrow", mods = "SHIFT|CTRL", action = act.ScrollToPrompt(-1) },
    { key = "DownArrow", mods = "SHIFT|CTRL", action = act.ScrollToPrompt(1) },

    ------------------------------------------------------------------
    -- Pane Management (Leader)
    ------------------------------------------------------------------
    { key = "LeftArrow", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
    { key = "UpArrow", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
    { key = "DownArrow", mods = "LEADER", action = act.ActivatePaneDirection("Down") },

    { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
    { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
    { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
    { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },

    { key = "H", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 3 }) },
    { key = "L", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 3 }) },
    { key = "K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 3 }) },
    { key = "J", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 3 }) },

    { key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
    { key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

    ------------------------------------------------------------------
    -- Rename Tab
    ------------------------------------------------------------------
    {
      key = "E",
      mods = "CMD|SHIFT",
      action = act.PromptInputLine({
        description = "Enter new name for tab",
        action = wezterm.action_callback(function(window, _, line)
          if line then
            window:active_tab():set_title(line)
          end
        end),
      }),
    },
  }

  --─────────────────────────────────────────────────────────────
  -- Mouse Bindings
  --─────────────────────────────────────────────────────────────
  config.mouse_bindings = {
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
      action = act.SelectTextAtMouseCursor("SemanticZone"),
    },
  }
end

return M
