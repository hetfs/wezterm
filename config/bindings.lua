-- ─────────────────────────────────────────────
-- WezTerm Key System (Neovim Native + Safe)
-- ─────────────────────────────────────────────

local wezterm = require("wezterm")
local act = wezterm.action

local platform = require("utils.platform")()
local backdrops = require("utils.backdrops")

-- ─────────────────────────────────────────────
-- Platform Modifiers
-- ─────────────────────────────────────────────
local mod = {}

if platform.is_mac then
  mod.SUPER = "SUPER"
  mod.SUPER_REV = "SUPER|CTRL"
else
  mod.SUPER = "ALT"
  mod.SUPER_REV = "ALT|CTRL"
end

-- ─────────────────────────────────────────────
-- Leader Definition
-- ─────────────────────────────────────────────
local leader = {
  key = "Space",
  mods = mod.SUPER_REV,
  timeout_milliseconds = 1000,
}

-- ─────────────────────────────────────────────
-- Collision-Safe Registration
-- ─────────────────────────────────────────────
local keys = {}
local seen = {}

local function register(key, mods, action)
  local id = mods .. "|" .. key
  if seen[id] then
    error("Key collision detected: " .. id)
  end
  seen[id] = true
  keys[#keys + 1] = {
    key = key,
    mods = mods,
    action = action,
  }
end

-- ─────────────────────────────────────────────
-- SYSTEM / GLOBAL
-- ─────────────────────────────────────────────
register("F1", "NONE", act.ActivateCopyMode)
register("F2", "NONE", act.ActivateCommandPalette)
register("F3", "NONE", act.ShowLauncher)
register("F11", "NONE", act.ToggleFullScreen)
register("F12", "NONE", act.ShowDebugOverlay)

register("Enter", "ALT", act.ToggleFullScreen)

register("R", "CTRL", act.ReloadConfiguration)
register("P", "CTRL", act.ActivateCommandPalette)
register("T", "CTRL", act.ShowLauncher)
register("N", "CTRL", act.SpawnWindow)

-- Background / opacity
register("o", "CTRL|SHIFT", wezterm.action.EmitEvent("toggle-background"))
register("o", "CTRL|ALT|SHIFT", wezterm.action.EmitEvent("toggle-opacity"))

-- Colorscheme toggle
register("E", "CTRL|SHIFT|ALT", wezterm.action.EmitEvent("toggle-colorscheme"))

-- Rename tab
register("E", mod.SUPER .. "|SHIFT", act.PromptInputLine({
  description = "Rename Tab",
  action = wezterm.action_callback(function(window, _, line)
    if line then
      window:active_tab():set_title(line)
    end
  end),
}))

-- ─────────────────────────────────────────────
-- CLIPBOARD
-- ─────────────────────────────────────────────
register("c", "CTRL|SHIFT", act.CopyTo("Clipboard"))
register("v", "CTRL|SHIFT", act.PasteFrom("Clipboard"))
register("Insert", "SHIFT", act.PasteFrom("PrimarySelection"))
register("Insert", "CTRL", act.CopyTo("PrimarySelection"))

-- ─────────────────────────────────────────────
-- FONT CONTROL
-- ─────────────────────────────────────────────
register("=", "CTRL", act.IncreaseFontSize)
register("-", "CTRL", act.DecreaseFontSize)
register("0", "CTRL", act.ResetFontSize)

register("=", mod.SUPER, act.IncreaseFontSize)
register("-", mod.SUPER, act.DecreaseFontSize)
register("0", mod.SUPER, act.ResetFontSize)

-- ─────────────────────────────────────────────
-- TAB NAVIGATION
-- ─────────────────────────────────────────────
register("Tab", "CTRL", act.ActivateTabRelative(1))
register("Tab", "SHIFT|CTRL", act.ActivateTabRelative(-1))

register("[", mod.SUPER, act.ActivateTabRelative(-1))
register("]", mod.SUPER, act.ActivateTabRelative(1))

register("[", mod.SUPER_REV, act.MoveTabRelative(-1))
register("]", mod.SUPER_REV, act.MoveTabRelative(1))

for i = 1, 8 do
  register(tostring(i), "CTRL", act.ActivateTab(i - 1))
end

-- ─────────────────────────────────────────────
-- TAB MANAGEMENT
-- ─────────────────────────────────────────────
register("t", mod.SUPER, act.SpawnTab("DefaultDomain"))
register("w", mod.SUPER, act.CloseCurrentTab({ confirm = true }))
register("n", mod.SUPER, act.SpawnWindow)

-- ─────────────────────────────────────────────
-- NEOVIM-NATIVE PANE NAVIGATION
-- ─────────────────────────────────────────────
register("h", mod.SUPER, act.ActivatePaneDirection("Left"))
register("j", mod.SUPER, act.ActivatePaneDirection("Down"))
register("k", mod.SUPER, act.ActivatePaneDirection("Up"))
register("l", mod.SUPER, act.ActivatePaneDirection("Right"))

register("z", "CTRL", act.TogglePaneZoomState)
register("x", "CTRL", act.ActivateCopyMode)

-- ─────────────────────────────────────────────
-- SCROLL / PROMPT NAVIGATION
-- ─────────────────────────────────────────────
register("PageUp", "SHIFT", act.ScrollByPage(-1))
register("PageDown", "SHIFT", act.ScrollByPage(1))
register("UpArrow", "SHIFT|CTRL", act.ScrollToPrompt(-1))
register("DownArrow", "SHIFT|CTRL", act.ScrollToPrompt(1))

-- ─────────────────────────────────────────────
-- QUICK SELECT
-- ─────────────────────────────────────────────
register("phys:Space", "SHIFT|CTRL", act.QuickSelect)

-- ─────────────────────────────────────────────
-- HYDRA LEADER ACTIVATION
-- ─────────────────────────────────────────────
register("Space", mod.SUPER_REV, act.ActivateKeyTable({
  name = "leader",
  one_shot = false,
}))

-- ─────────────────────────────────────────────
-- LEADER KEY TABLE
-- ─────────────────────────────────────────────
local key_tables = {
  leader = {
    { key = "Escape", action = "PopKeyTable" },
    { key = "Space", action = "PopKeyTable" },

    -- Pane navigation
    { key = "h", action = act.ActivatePaneDirection("Left") },
    { key = "j", action = act.ActivatePaneDirection("Down") },
    { key = "k", action = act.ActivatePaneDirection("Up") },
    { key = "l", action = act.ActivatePaneDirection("Right") },

    -- Resize
    { key = "H", action = act.AdjustPaneSize({ "Left", 3 }) },
    { key = "J", action = act.AdjustPaneSize({ "Down", 3 }) },
    { key = "K", action = act.AdjustPaneSize({ "Up", 3 }) },
    { key = "L", action = act.AdjustPaneSize({ "Right", 3 }) },

    -- Splits
    { key = "\\", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "-", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

    -- Pane control
    { key = "z", action = act.TogglePaneZoomState },
    { key = "x", action = act.CloseCurrentPane({ confirm = true }) },
    { key = "b", action = act.RotatePanes("Clockwise") },
    { key = "B", action = act.RotatePanes("CounterClockwise") },

    -- Tabs
    { key = "t", action = act.SpawnTab("CurrentPaneDomain") },
    { key = "n", action = act.ActivateTabRelative(1) },
    { key = "p", action = act.ActivateTabRelative(-1) },
    { key = "c", action = act.CloseCurrentTab({ confirm = true }) },
  },
}

-- ─────────────────────────────────────────────
-- MOUSE
-- ─────────────────────────────────────────────
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

-- ─────────────────────────────────────────────
-- EXPORT
-- ─────────────────────────────────────────────
return {
  disable_default_key_bindings = true,
  leader = leader,
  keys = keys,
  key_tables = key_tables,
  mouse_bindings = mouse_bindings,
}
