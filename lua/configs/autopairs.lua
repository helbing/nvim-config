local status, npairs = pcall(require, 'nvim-autopairs')
if (not status) then return end

npairs.setup({
  fast_wrap = {},
  map_cr = true,
  disable_filetype = { 'TelescopePrompt', 'vim' },
  enable_check_bracket_line = false,
  ignored_next_char = '[%w%.]'
})
