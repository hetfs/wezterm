return {
  -- ─────────────────────────────────────────────────────────────
  -- General Behaviors
  -- ─────────────────────────────────────────────────────────────
  automatically_reload_config = true,       -- Reload config automatically when changed
  exit_behavior = "CloseOnCleanExit",       -- Only close if shell exits cleanly
  exit_behavior_messaging = "Verbose",      -- Detailed messaging on exit
  status_update_interval = 1000,            -- Status update interval in milliseconds

  scrollback_lines = 5000,                  -- Number of lines in scrollback buffer

  -- ─────────────────────────────────────────────────────────────
  -- Hyperlink Rules
  -- ─────────────────────────────────────────────────────────────
  hyperlink_rules = {
    -- URLs in parentheses
    {
      regex = "\\((\\w+://\\S+)\\)",
      format = "$1",
      highlight = 1,
    },
    -- URLs in brackets
    {
      regex = "\\[(\\w+://\\S+)\\]",
      format = "$1",
      highlight = 1,
    },
    -- URLs in curly braces
    {
      regex = "\\{(\\w+://\\S+)\\}",
      format = "$1",
      highlight = 1,
    },
    -- URLs in angle brackets
    {
      regex = "<(\\w+://\\S+)>",
      format = "$1",
      highlight = 1,
    },
    -- Bare URLs not wrapped in any brackets
    {
      regex = "\\b\\w+://\\S+[)/a-zA-Z0-9-]+",
      format = "$0",
    },
    -- Implicit mailto links
    {
      regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
      format = "mailto:$0",
    },
  },
}
