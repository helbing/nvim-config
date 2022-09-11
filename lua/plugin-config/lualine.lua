require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '|', right = '|' },
    -- https://github.com/ryanoasis/powerline-extra-symbols
    section_separators = { left = ' ', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_c = {
      'filename',
      {
        'lsp_progress',
        spinner_symbols = { ' ', ' ', ' ', ' ', ' ', ' ' },
      },
    },
    lualine_x = {
      'filesize',
      {
        'fileformat',
        symbols = {
          unix = 'LF',
          dos = 'CRLF',
          mac = 'CR',
        },
      },
      'encoding',
      'filetype'
    }
  },
  extensions = { 'nvim-tree' }
})
