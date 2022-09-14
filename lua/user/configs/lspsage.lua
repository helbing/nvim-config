local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.init_lsp_saga({
  symbol_in_winbar = {
    in_custom = true
  }
})

require('user.core.keymaps').lspsage()
