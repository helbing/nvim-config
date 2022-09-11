require("nvim-tree").setup({
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
    custom = { "node_modules" },
  },
  view = {
    width = 30,
    side = "left",
    hide_root_folder = false,
    mappings = {
      custom_only = false,
      list = require("keybindings").nvimTreeList,
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  system_open = {
    cmd = "open",
  },
})
