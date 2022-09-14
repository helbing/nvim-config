local status, cmp = pcall(require, 'cmp')
if (not status) then return end

local status2, luasnip = pcall(require, 'luasnip')
if (not status2) then return end

require('luasnip.loaders.from_vscode').lazy_load()
-- require('luasnip.loaders.from_vscode').load({
--   paths = {
--     vim.fn.stdpath('config') .. '/snippets'
--   }
-- })

cmp.setup({
  mapping = require('user.core.keymaps').cmp(cmp),
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
  }),
  experimental = {
    ghost_text = true,
  },
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

cmp.setup.cmdline('?', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})
