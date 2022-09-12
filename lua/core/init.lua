-- basic
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.shiftround = true
vim.opt.updatetime = 100
vim.opt.cursorline = true
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.whichwrap = '<,>,[,]'

if (vim.fn.has('termguicolors') == 1) then
  vim.opt.termguicolors = true
end

-- tabstop
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.mouse = 'a'
vim.opt.expandtab = true
vim.opt.formatoptions = ''

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- style
vim.opt.list = true
vim.opt.listchars = "space:·"

-- split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- backup
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

require('core.colorscheme')
require('core.keymaps')
require('core.plugins')

-- plugins
require('impatient') -- improve startup time for Neovim
require('configs.nvim-tree').config()
require('configs.lualine').config()
require('configs.bufferline').config()
require('configs.dashboard').config()
require('configs.telescope').config()
require('configs.nvim-treesitter').config()
require('configs.surround').config()
require('configs.whichkey').config()
