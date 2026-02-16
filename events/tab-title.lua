local wezterm = require("wezterm")

local M = {}
local __cells__ = {} -- wezterm FormatItems

-- ─────────────────────────────────────────────────────────────
-- Colors for tabs
-- ─────────────────────────────────────────────────────────────
local colors = {
	default   = { bg = '#45475a', fg = '#1c1b19' },
	is_active = { bg = '#7FB4CA', fg = '#11111b' },
	hover     = { bg = '#587d8c', fg = '#1c1b19' },
}

-- ─────────────────────────────────────────────────────────────
-- UTF-8 helper for LuaJIT
-- ─────────────────────────────────────────────────────────────
local function utf8_char(...)
	local str = ""
	for _, cp in ipairs({ ... }) do
		if cp < 0x80 then
			str = str .. string.char(cp)
		elseif cp < 0x800 then
			str = str .. string.char(0xC0 + math.floor(cp / 0x40), 0x80 + (cp % 0x40))
		elseif cp < 0x10000 then
			str = str .. string.char(
				0xE0 + math.floor(cp / 0x1000),
				0x80 + (math.floor(cp / 0x40) % 0x40),
				0x80 + (cp % 0x40)
			)
		else
			str = str .. string.char(
				0xF0 + math.floor(cp / 0x40000),
				0x80 + (math.floor(cp / 0x1000) % 0x40),
				0x80 + (math.floor(cp / 0x40) % 0x40),
				0x80 + (cp % 0x40)
			)
		end
	end
	return str
end

-- ─────────────────────────────────────────────────────────────
-- Icons
-- ─────────────────────────────────────────────────────────────
local icons = {
	SOLID_LEFT_ARROW  = utf8_char(0xe0ba),
	SOLID_RIGHT_ARROW = utf8_char(0xe0bc),
	SOLID_LEFT_MOST   = utf8_char(0x2588),
	ADMIN             = utf8_char(0xf49c),
	HOURGLASS         = utf8_char(0xf252),
}

-- Process name → icon mappings
local process_icons = {
	nu = " NU", pwsh = " PS", cmd = " CMD",
	nvim = " NVIM", python = " PYTHON", node = " NODE",
}

local function get_process_icon(name)
	return process_icons[name] or name
end

-- Extract base process name from full path
local function set_process_name(s)
	local process_name = string.gsub(s, "(.*[/\\])(.*)", "%2")
	return process_name:gsub("%.exe$", "")
end

-- Build tab title string with icon and truncation
local function set_title(process_name, base_title, max_width, inset)
	local icon = get_process_icon(process_name)
	local title = icon .. " ~ " .. base_title
	inset = inset or 6

	if #title > max_width - inset then
		local diff = #title - max_width + inset
		title = wezterm.truncate_right(title, #title - diff)
	end
	return title
end

-- Check if tab is running as Administrator
local function check_if_admin(p)
	return p:match("^Administrator: ") ~= nil
end

-- Push an item to the __cells__ table
---@param bg string
---@param fg string
---@param attribute table
---@param text string
local function push(bg, fg, attribute, text)
	table.insert(__cells__, { Background = { Color = bg } })
	table.insert(__cells__, { Foreground = { Color = fg } })
	table.insert(__cells__, { Attribute = attribute })
	table.insert(__cells__, { Text = text })
end

-- ─────────────────────────────────────────────────────────────
-- Setup tab title formatting
-- ─────────────────────────────────────────────────────────────
function M.setup()
	wezterm.on("format-tab-title", function(tab, _tabs, _panes, _config, hover, max_width)
		__cells__ = {}

		local process_name = set_process_name(tab.active_pane.foreground_process_name)
		local is_admin = check_if_admin(tab.active_pane.title)
		local title = set_title(process_name, tab.active_pane.title, max_width, (is_admin and 8))

		local bg, fg
		if tab.is_active then
			bg, fg = colors.is_active.bg, colors.is_active.fg
		elseif hover then
			bg, fg = colors.hover.bg, colors.hover.fg
		else
			bg, fg = colors.default.bg, colors.default.fg
		end

		local has_unseen_output = false
		for _, pane in ipairs(tab.panes) do
			if pane.has_unseen_output then
				has_unseen_output = true
				break
			end
		end

		-- Left semi-circle
		push("rgba(0, 0, 0, 0.4)", bg, { Intensity = "Bold" }, icons.SOLID_LEFT_ARROW)

		-- Admin icon
		if is_admin then
			push(bg, fg, { Intensity = "Bold" }, " " .. icons.ADMIN)
		end

		-- Tab title
		push(bg, fg, { Intensity = "Bold" }, " " .. title)

		-- Unseen output alert
		if has_unseen_output then
			push(bg, "#FFA066", { Intensity = "Bold" }, " " .. icons.HOURGLASS)
		end

		-- Right padding and semi-circle
		push(bg, fg, { Intensity = "Bold" }, " ")
		push("rgba(0, 0, 0, 0.4)", bg, { Intensity = "Bold" }, icons.SOLID_RIGHT_ARROW)

		return __cells__
	end)
end

return M
