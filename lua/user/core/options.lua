vim.cmd [[ syntax on ]]
vim.cmd [[ filetype plugin indent on ]]

local options = {
  number = true,
  relativenumber = true,
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

}

for k, v in pairs(options) do
  vim.opt[k] = v
end
