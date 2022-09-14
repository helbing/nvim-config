local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  sources = {
    -- formatting

    -- golang
    formatting.gofumpt,

    -- code actions
    code_actions.gitsigns,

    -- diagnostics
    diagnostics.golangci_lint,
  },
  diagnostics_format = "[#{s}] #{m}",
  on_attach = function(client)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
  end,
})
