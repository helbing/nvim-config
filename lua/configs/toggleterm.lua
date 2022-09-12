local M = {}

function M.config()
  require('toggleterm').setup({
    size = 50,
    open_mapping = '<Leader>t',
    direction = 'float',
    close_on_exit = true,
		shell = vim.o.shell,
    winbar = {
			enabled = false,
			name_formatter = function(term)
				return term.name
			end
		},
  })
end

return M
