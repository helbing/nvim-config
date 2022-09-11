require('mason').setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    'gopls', 'rust_analyzer',
    'html', 'cssls', 'tsserver',
    'yamlls', 'jsonls', 'taplo',
  }
})
