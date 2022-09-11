vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

local pluginKeys = {}

-- nvim-tree
map('n', '<Leader>b', ':NvimTreeToggle<CR>', opt)
pluginKeys.nvimTreeList = {
  { key = 'R', action = 'refresh' },

  { key = { '<CR>', '<2-LeftMouse>' }, action = 'edit' },
  { key = 'o', action = 'system_open' },
  { key = 'v', action = 'vsplit' },
  { key = 'h', action = 'split' },

  -- ignore
  { key = 'i', action = 'toggle_ignored' },
  { key = '.', action = 'toggle_dotfiles' },

  { key = 'n', action = 'create' },
  { key = 'd', action = 'remove' },
  { key = 'r', action = 'rename' },
  { key = 'x', action = 'cut' },
  { key = 'c', action = 'copy' },
  { key = 'p', action = 'past' },
  { key = 'cn', action = 'copy_name' },
  { key = 'cp', action = 'copy_path' }, -- relation path
  { key = 'cap', action = 'copy_absolute_path' },

  { key = { ']' }, action = 'cd' },
  { key = { '[' }, action = 'dir_up' },
}

-- telescope
map("n", "<Leader>fr", ":Telescope oldfiles<CR>", opt)
map("n", "<Leader>fp", ":Telescope projects<CR>", opt)
map("n", "<Leader>ff", ":Telescope find_files<CR>", opt)
map("n", "<Leader>fg", ":Telescope live_grep<CR>", opt)
map("n", "<Leader>fb", ":Telescope buffers<CR>", opt)
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opt)

pluginKeys.telescopeList = {
  i = {
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    ["<Esc>"] = "close",
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  }
}

-- bufferline
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- moll/vim-bbye
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<Leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<Leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<Leader>bc", ":BufferLinePickClose<CR>", opt)

return pluginKeys
