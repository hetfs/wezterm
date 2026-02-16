local wezterm = require("wezterm")
local platform = require("utils.platform")()

-- ─────────────────────────────────────────────────────────────
-- Type Aliases
-- ─────────────────────────────────────────────────────────────
---@alias WeztermGPUBackend 'Vulkan'|'Metal'|'Gl'|'Dx12'
---@alias WeztermGPUDeviceType 'DiscreteGpu'|'IntegratedGpu'|'Cpu'|'Other'

---@class WeztermGPUAdapter
---@field name string
---@field backend WeztermGPUBackend
---@field device number
---@field device_type WeztermGPUDeviceType
---@field driver? string
---@field driver_info? string
---@field vendor string

---@alias AdapterMap { [WeztermGPUBackend]: WeztermGPUAdapter|nil }|nil

---@class GpuAdapters
---@field __backends WeztermGPUBackend[]
---@field __preferred_backend WeztermGPUBackend
---@field DiscreteGpu AdapterMap
---@field IntegratedGpu AdapterMap
---@field Cpu AdapterMap
---@field Other AdapterMap
local GpuAdapters = {}
GpuAdapters.__index = GpuAdapters

-- ─────────────────────────────────────────────────────────────
-- Platform-specific GPU backends
-- ─────────────────────────────────────────────────────────────
GpuAdapters.AVAILABLE_BACKENDS = {
  windows = { "Dx12", "Vulkan", "Gl" },
  linux = { "Vulkan", "Gl" },
  mac = { "Metal" },
}

---@type WeztermGPUAdapter[]
GpuAdapters.ENUMERATED_GPUS = wezterm.gui.enumerate_gpus()

-- ─────────────────────────────────────────────────────────────
-- Initialize GPU adapter tables
-- ─────────────────────────────────────────────────────────────
---@return GpuAdapters
function GpuAdapters:init()
  local initial = {
    __backends = self.AVAILABLE_BACKENDS[platform.os],
    __preferred_backend = self.AVAILABLE_BACKENDS[platform.os][1],
    DiscreteGpu = {},
    IntegratedGpu = {},
    Cpu = {},
    Other = {},
  }

  -- Populate adapter maps by device type and backend
  for _, adapter in ipairs(self.ENUMERATED_GPUS) do
    initial[adapter.device_type][adapter.backend] = adapter
  end

  return setmetatable(initial, self)
end

-- ─────────────────────────────────────────────────────────────
-- Pick the best GPU adapter automatically
-- ─────────────────────────────────────────────────────────────
---@return WeztermGPUAdapter|nil
function GpuAdapters:pick_best()
  -- Prioritize device types: Discrete → Integrated → Other → Cpu
  local adapters_options =
    next(self.DiscreteGpu) and self.DiscreteGpu
    or next(self.IntegratedGpu) and self.IntegratedGpu
    or next(self.Other) and self.Other
    or next(self.Cpu) and self.Cpu

  if not adapters_options then
    wezterm.log_error("No GPU adapters found. Using default adapter.")
    return nil
  end

  local adapter_choice = adapters_options[self.__preferred_backend]
  if not adapter_choice then
    wezterm.log_error("Preferred backend not available. Using default adapter.")
    return nil
  end

  return adapter_choice
end

-- ─────────────────────────────────────────────────────────────
-- Pick a GPU adapter manually by backend and device type
-- ─────────────────────────────────────────────────────────────
---@param backend WeztermGPUBackend
---@param device_type WeztermGPUDeviceType
---@return WeztermGPUAdapter|nil
function GpuAdapters:pick_manual(backend, device_type)
  local adapters_options = self[device_type]

  if not adapters_options then
    wezterm.log_error("No GPU adapters found for device type. Using default adapter.")
    return nil
  end

  local adapter_choice = adapters_options[backend]
  if not adapter_choice then
    wezterm.log_error("Preferred backend not available for device type. Using default adapter.")
    return nil
  end

  return adapter_choice
end

-- ─────────────────────────────────────────────────────────────
-- Return initialized instance
-- ─────────────────────────────────────────────────────────────
return GpuAdapters:init()
