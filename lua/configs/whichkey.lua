local M = {}

function M.config()
  local mappings = {}
  local opts = { prefix = '<Leader>' }
  require('which-key').register(mappings, opts)
end

return M
