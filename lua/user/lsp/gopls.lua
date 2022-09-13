require('lspconfig').gopls.setup({
  on_attach = function(client, bufnr)
    require('lsp_signature').on_attach(client, bufnr)
  end,
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  flags = {
    debounce_text_changes = 300,
  },
  filetypes = { 'go', 'gomod' },
  root_dir = require('lspconfig/util').root_pattern("go.work", "go.mod", ".git"),
})
