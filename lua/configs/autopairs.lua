local M = {}

function M.config()
  local npairs = require('nvim-autopairs')

  npairs.setup({
    fast_wrap = {},
    map_cr = true,
    disable_filetype = { 'TelescopePrompt', 'vim' },
    enable_check_bracket_line = false,
    ignored_next_char = '[%w%.]'
  })
end

return M
