local M = {}

function M.config()
  require('nvim-treesitter').setup({
    ensure_installed = {
      'json', 'yaml', 'toml',
      'go', 'gomod', 'gowork',
      'vim', 'lua'
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
        scope_incremental = "<TAB>",
      },
    },
    indent = {
      enable = true,
    },
    -- p00f/nvim-ts-rainbow
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil
    }
  })

  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  -- https://stackoverflow.com/qustions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
  vim.opt.foldlevel = 99
end

return M
