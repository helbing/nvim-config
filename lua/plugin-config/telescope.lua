local telescope = require('telescope')

telescope.setup({
  defaults = {
    initial_mode = 'insert',
    mappings = require('keybindings').telescopeList,
  },
  pickers = {
    find_files = {
      theme = 'dropdown',
    }
  }
})

vim.g.nvim_tree_respect_buf_cwd = 1

require('project_nvim').setup({
  detection_methods = { "pattern" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".sln" },
})

telescope.load_extension('projects')
