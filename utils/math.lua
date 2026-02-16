local M = {}

-- ─────────────────────────────────────────────────────────────
-- Clamp a value between a minimum and maximum
-- ─────────────────────────────────────────────────────────────
--- Clamps a value between `min` and `max`.
---@param x number The value to clamp.
---@param min number The minimum allowed value.
---@param max number The maximum allowed value.
---@return number The clamped value.
function M.clamp(x, min, max)
  return math.max(min, math.min(x, max))
end

-- ─────────────────────────────────────────────────────────────
-- Round a number to the nearest increment or integer
-- ─────────────────────────────────────────────────────────────
--- Rounds a number to the nearest integer or specified increment.
---@param x number The value to round.
---@param increment? number Optional increment to round to.
---@return number The rounded value.
function M.round(x, increment)
  if increment then
    return M.round(x / increment) * increment
  end
  return x >= 0 and math.floor(x + 0.5) or math.ceil(x - 0.5)
end

return M
