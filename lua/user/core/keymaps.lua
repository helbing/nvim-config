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
map('n', '<F12>', ':NvimTreeToggle<CR>', opt)
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

-- bufferline
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- close
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<Leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<Leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<Leader>bc", ":BufferLinePickClose<CR>", opt)

-- telescope
map('n', '<Leader>fr', ':Telescope oldfiles<CR>', opt)
map('n', '<Leader>fp', ':Telescope projects<CR>', opt)
map('n', '<Leader>ff', ':Telescope find_files<CR>', opt)
map('n', '<Leader>fg', ':Telescope live_grep<CR>', opt)
map('n', '<Leader>fb', ':Telescope buffers<CR>', opt)
map('n', '<Leader>fh', ':Telescope help_tags<CR>', opt)

function M.telescope()
  return {
    i = {
      ['<C-j>'] = 'move_selection_next',
      ['<C-k>'] = 'move_selection_previous',
      ['<Down>'] = 'move_selection_next',
      ['<Up>'] = 'move_selection_previous',
      ['<C-n>'] = 'cycle_history_next',
      ['<C-p>'] = 'cycle_history_prev',
      ['<Esc>'] = 'close',
      ['<C-u>'] = 'preview_scrolling_up',
      ['<C-d>'] = 'preview_scrolling_down',
    }
  }
end

-- gitsigns
map('n', '<Leader>hn', ':Gitsigns next_hunk<CR>', opt)
map('n', '<Leader>hp', ':Gitsigns preview_hunk<CR>', opt)
map('n', '<Leader>hs', ':Gitsigns stage_hunk<CR>', opt)
map('n', '<Leader>hu', ':Gitsigns undo_stage_hunk<CR>', opt)
map('n', '<Leader>hr', ':Gitsigns reset_hunk<CR>', opt)
map('n', '<Leader>hR', ':Gitsigns reset_buffer<CR>', opt)
map('n', '<Leader>hs', ':<C-U>Gitsigns select_hunk<CR>', opt)
map('n', '<Leader>hb', ':Gitsigns blame_line<CR>', opt)
map('n', '<Leader>hB', '<cmd>lua require("gitsigns").blame_line{full=true}<CR>', opt)
map('n', '<Leader>hd', ':Gitsigns diffthis<CR>', opt)
map('n', '<Leader>hD', '<cmd>lua require("gitsigns").diffthis("~")<CR>', opt)

-- test
map('n', '<Leader>Tn', ':TestNearest<CR>', opt)
map('n', '<Leader>Tf', ':TestFile<CR>', opt)
map('n', '<Leader>Ts', ':TestSuite<CR>', opt)
map('n', '<Leader>Tl', ':TestLast<CR>', opt)
map('n', '<Leader>Tv', ':TestVisit<CR>', opt)

-- lspconfig
map('n', '<Leader>do', '<cmd>lua vim.diagnostic.open_float<CR>', opt)
map('n', '<Leader>dj', '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opt)
map('n', '<Leader>dk', '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opt)
map('n', '<Leader>dq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration<CR>', opt)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition<CR>', opt)
map('n', 'gh', '<cmd>lua vim.lsp.buf.hover<CR>', opt)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation<CR>', opt)
map('n', 'gtd', '<cmd>lua vim.lsp.buf.type_definition<CR>', opt)
map('n', 'gca', '<cmd>lua vim.lsp.buf.code_action<CR>', opt)
map('n', 'grf', '<cmd>lua vim.lsp.buf.references<CR>', opt)
map('n', 'grn', '<cmd>lua vim.lsp.buf.rename<CR>', opt)

return M
