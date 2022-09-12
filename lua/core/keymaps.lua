vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
local M = {}

-- split windows
map('n', 's', '', opt)
map('n', 'sv', ':vsp<CR>', opt)
map('n', 'sh', ':sp<CR>', opt)

-- move windows
map('n', '<A-h>', '<C-w>h', opt)
map('n', '<A-j>', '<C-w>j', opt)
map('n', '<A-k>', '<C-w>k', opt)
map('n', '<A-l>', '<C-w>l', opt)

-- resize windows
map('n', '<A-Left>', ':vertical resize -4<CR>', opt)
map('n', '<A-Right>', ':vertical resize +4<CR>', opt)
map('n', '<A-Down>', ':resize +4<CR>', opt)
map('n', '<A-Up>', ':resize -4<CR>', opt)
map('n', '<A-=>', '<C-w>=', opt)

-- move text
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)
map('v', 'J', ":move '>+1<CR>gv-gv", opt)
map('v', 'K', ":move '<-2<CR>gv-gv", opt)

-- view
map('n', '<C-j>', '5j', opt)
map('n', '<C-k>', '5k', opt)
map('n', '<C-u>', '10k', opt)
map('n', '<C-d>', '10j', opt)

-- don't copy when paste
map('v', 'p', '"_dP', opt)

-- nvim-tree
map('n', '<Leader>b', ':NvimTreeToggle<CR>', opt)
function M.nvimTree()
  return {
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
    { key = { '[' }, action = 'dir_up' }
  }
end

-- telescope
map("n", "<Leader>fr", ":Telescope oldfiles<CR>", opt)
map("n", "<Leader>fp", ":Telescope projects<CR>", opt)
map("n", "<Leader>ff", ":Telescope find_files<CR>", opt)
map("n", "<Leader>fg", ":Telescope live_grep<CR>", opt)
map("n", "<Leader>fb", ":Telescope buffers<CR>", opt)
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opt)

function M.telescope()
  return {
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
end

return M
