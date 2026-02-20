-- ─────────────────────────────────────────────────────────────
-- ██╗    ██╗███████╗███████╗████████╗███████╗██████╗ ███╗   ███╗
-- ██║    ██║██╔════╝╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
-- ██║ █╗ ██║█████╗    ███╔╝    ██║   █████╗  ██████╔╝██╔████╔██║
-- ██║███╗██║██╔══╝   ███╔╝     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
-- ╚███╔███╔╝███████╗███████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
--  ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
-- GPU-accelerated cross-platform terminal emulator
-- https://wezfurlong.org/wezterm/
-- ─────────────────────────────────────────────────────────────

-- Load the core configuration module
local Config = require('config')

-- Initialize and randomize background images
local backdrops = require('utils.backdrops')
backdrops:set_files():random()

-- Load and initialize event handlers
local right_status   = require('events.right-status')
local left_status    = require('events.left-status')
local tab_title      = require('events.tab-title')
local new_tab_button = require('events.new-tab-button')

right_status.setup()
left_status.setup()
tab_title.setup()
new_tab_button.setup()

-- Assemble the configuration by appending individual modules
return Config:init()
   :append(require('config.appearance'))
   :append(require('config.bindings'))
   -- :append(require('config.domains')) -- Optional domain configuration
   :append(require('config.fonts'))
   :append(require('config.general'))
   :append(require('config.launch')).options
