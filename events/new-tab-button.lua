local wezterm = require('wezterm')
local nf = wezterm.nerdfonts

local M = {}

-- ─────────────────────────────────────────────────────────────
-- Setup behavior for clicking the new-tab button
-- ─────────────────────────────────────────────────────────────
function M.setup()
  wezterm.on('new-tab-button-click', function(window, pane, button, default_action)
    -- Log event for debugging
    wezterm.log_info('new-tab click', window, pane, button, default_action)

    if not default_action then
      return false
    end

    if button == 'Left' then
      -- Perform the default new-tab action for left click
      window:perform_action(default_action, pane)

    elseif button == 'Right' then
      -- Show launcher on right click with a custom title
      window:perform_action(
        wezterm.action.ShowLauncherArgs({
          title = nf.fa_rocket .. '  Select/Search:',
          flags = 'FUZZY|LAUNCH_MENU_ITEMS|DOMAINS',
        }),
        pane
      )
    end

    return false
  end)
end

return M
