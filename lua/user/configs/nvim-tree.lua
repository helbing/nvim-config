local status, tree = pcall(require, 'nvim-tree')
if (not status) then return end

tree.setup({
  git = {
    enable = false,
  },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  filters = {
    dotfiles = false,
    custom = { 'node_modules' },
  },
  view = {
    width = 30,
    side = 'left',
    hide_root_folder = false,
    mappings = {
      custom_only = false,
      list = require('user.core.keymaps').nvimTree(),
    },
    number = false,
    relativenumber = false,
    signcolumn = 'yes',
  },
  system_open = {
    cmd = 'open',
  },
})
