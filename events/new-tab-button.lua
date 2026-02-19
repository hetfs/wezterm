local wezterm = require('wezterm')
local nf = wezterm.nerdfonts

local M = {}

-- Setup the new-tab button click behavior
M.setup = function()
   wezterm.on('new-tab-button-click', function(window, pane, button, default_action)
      -- Log the event for debugging
      wezterm.log_info('new-tab', window, pane, button, default_action)

      if default_action then
         if button == 'Left' then
            -- Perform the default action for the left-click
            window:perform_action(default_action, pane)
         elseif button == 'Right' then
            -- Show launcher for the right-click
            window:perform_action(
               wezterm.action.ShowLauncherArgs({
                  title = nf.fa_rocket .. '  Select/Search:',
                  flags = 'FUZZY|LAUNCH_MENU_ITEMS|DOMAINS',
               }),
               pane
            )
         end
      end
      return false
   end)
end

return M

