---@type ChadrcConfig
local M = {}


M.ui = {
  theme = 'kanagawa',
  transparency = true,
  statusline = {
    theme = "minimal",
  }
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")
return M

