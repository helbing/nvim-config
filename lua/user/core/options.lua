vim.cmd [[ syntax on ]]
vim.cmd [[ filetype plugin indent on ]]

local options = {
  encoding = 'utf-8',
  fileencoding = 'utf-8',

  number = true,
  relativenumber = true,
  ruler = true,
  mouse = 'a',

  -- tabstop
  autoindent = true,
  smartindent = true,
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,

  -- search
  ignorecase = true,
  smartcase = true,
  hlsearch = false,
  incsearch = true,

  -- style
  list = true,
  listchars = "space:·",

  -- split
  splitbelow = true,
  splitright = true,

  -- backup
  backup = false,
  writebackup = false,
  swapfile = false,

  -- completion
  completeopt = { 'menu', 'menuone', 'noselect' }
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
