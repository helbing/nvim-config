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
function M.nvimTree()
  map('n', '<F12>', ':NvimTreeToggle<CR>', opt)

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
M.bufferline = function()
  map('n', '<C-h>', ':BufferLineCyclePrev<CR>', opt)
  map('n', '<C-l>', ':BufferLineCycleNext<CR>', opt)
  -- close
  map('n', '<C-w>', ':Bdelete!<CR>', opt)
  map('n', '<Leader>bl', ':BufferLineCloseRight<CR>', opt)
  map('n', '<Leader>bh', ':BufferLineCloseLeft<CR>', opt)
  map('n', '<Leader>bc', ':BufferLinePickClose<CR>', opt)
end

-- telescope
function M.telescope()
  map('n', '<Leader>fr', ':Telescope oldfiles<CR>', opt)
  map('n', '<Leader>fp', ':Telescope projects<CR>', opt)
  map('n', '<Leader>ff', ':Telescope find_files<CR>', opt)
  map('n', '<Leader>fg', ':Telescope live_grep<CR>', opt)
  map('n', '<Leader>fb', ':Telescope buffers<CR>', opt)
  map('n', '<Leader>fh', ':Telescope help_tags<CR>', opt)

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
M.gitsigns = function()
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
end

-- -- test
-- map('n', '<Leader>Tn', ':TestNearest<CR>', opt)
-- map('n', '<Leader>Tf', ':TestFile<CR>', opt)
-- map('n', '<Leader>Ts', ':TestSuite<CR>', opt)
-- map('n', '<Leader>Tl', ':TestLast<CR>', opt)
-- map('n', '<Leader>Tv', ':TestVisit<CR>', opt)

-- lspsage
M.lspsage = function()
  map('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', opt)
  map('n', 'gc', '<cmd>Lspsaga code_action<CR>', opt)
  map('n', 'gr', '<cmd>Lspsaga rename<CR>', opt)
  map('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opt)

  map('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opt)
  map('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', opt)

  -- only jump to error
  map('n', '[E', '<cmd>lua require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>',
    opt)
  map('n', ']E', '<cmd>lua require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>',
    opt)

  map('n', '<Leader>o', '<cmd>LSoutlineToggle<CR>', opt)
  map('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opt)
  map('i', '<C-k>', '<cmd>Lspsaga signature_help<CR>', opt)
end

-- cmp
M.cmp = function(cmp)
  local select_opt = { behavior = cmp.SelectBehavior.Select }
  return {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opt),
    ['<Down>'] = cmp.mapping.select_next_item(select_opt),
    ['<C-k>'] = cmp.mapping.select_prev_item(select_opt),
    ['<C-j>'] = cmp.mapping.select_next_item(select_opt),
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<Esc>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opt)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opt)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }
end

return M
