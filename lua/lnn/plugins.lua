local M = {}

M.config = function()
  lvim.plugins = {
    require("lnn.plugins.pomo"),
  }
end

return M
