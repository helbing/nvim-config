local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local status2, project = pcall(require, 'project_nvim')
if (not status2) then return end

telescope.setup({
  defaults = {
    initial_mode = 'insert',
    mappings = require('core.keymaps').telescope(),
  },
  pickers = {
    find_files = {
      theme = 'dropdown',
    }
  }
})

vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
  detection_methods = { 'pattern' },
  patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', '.sln' },
})

telescope.load_extension('projects')
