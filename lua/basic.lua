-- charset
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "UTF-8"

-- scroll off
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- line number
vim.wo.number = true
vim.wo.relativenumber = true

-- column line
vim.wo.colorcolumn = "80,120"

-- tab stop
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true

-- shift width
vim.o.shiftwidth =2
vim.bo.shiftwidth = 2

-- expand tab
vim.o.expandtab = true
vim.bo.expandtab = true

-- indent
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

vim.wo.cursorline = true
vim.wo.signcolumn = "yes"

vim.o.cmdheight = 1
vim.o.autoread = true
vim.bo.autoread = true
vim.wo.wrap = false
vim.o.whichwrap = '<,>,[,]'
vim.o.hidden = true
vim.o.mouse = "a"

-- no backup
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- display of invisible char
vim.o.list = true
vim.o.listchars = "space:·"

vim.o.updatetime = 300
vim.o.timeoutlen = 500

-- split
vim.o.splitbelow = true
vim.o.splitright = true

-- style
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
vim.o.showtabline = 4
vim.o.showmode = false
vim.o.wildmenu = true
vim.o.shortmess = vim.o.shortmess .. 'c'

-- completion
vim.g.completeopt = "menu,menuone,noselect,noinsert"
vim.o.pumheight = 10


