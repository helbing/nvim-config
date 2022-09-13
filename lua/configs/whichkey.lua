local status, which_key = pcall(require, 'which-key')
if (not status) then return end

local mappings = {}
local opts = { prefix = '<Leader>' }
which_key.register(mappings, opts)
