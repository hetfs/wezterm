-- Configuration parameters
local std = "luajit"
local cache = true
local codes = true

local max_line_length = 150
local max_comment_line_length = 200

-- Configuration for specific files
local files = {
	["utils/backdrops.lua"] = {
		ignore = { "212" },
	},
}

return {
	std = std,
	cache = cache,
	codes = codes,
	max_line_length = max_line_length,
	max_comment_line_length = max_comment_line_length,
	files = files,
}
