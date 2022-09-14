vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- impatient
  use 'lewis6991/impatient.nvim'

  -- colorscheme
  use 'Mofiqul/dracula.nvim'

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  }
  -- use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'arkav/lualine-lsp-progress'

  -- bufferline
  use {
    'akinsho/bufferline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', 'moll/vim-bbye' }
  }

  -- dashboard
  use 'glepnir/dashboard-nvim'

  -- telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  })
  use 'ahmedkhalf/project.nvim'

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
  }
  use 'p00f/nvim-ts-rainbow'

  -- surround
  use 'kylechui/nvim-surround'

  -- whichkey
  use 'folke/which-key.nvim'

  -- autopairs
  use 'windwp/nvim-autopairs'

  -- toggleterm
  use 'akinsho/toggleterm.nvim'

  -- comment
  use 'numToStr/Comment.nvim'

  -- gitsigns
  use 'lewis6991/gitsigns.nvim'
  use {
    'sindrets/diffview.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- -- test
  -- use 'vim-test/vim-test'
  -- use {
  --   'nvim-neotest/neotest',
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-treesitter/nvim-treesitter',
  --     'antoinemadec/FixCursorHold.nvim'
  --   }
  -- }

  -- mason
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  use 'ray-x/lsp_signature.nvim'
  use 'glepnir/lspsaga.nvim'

  -- cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'onsails/lspkind.nvim'

  -- null-ls
  use 'jose-elias-alvarez/null-ls.nvim'

  -- -- other
  -- use 'gpanders/editorconfig.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
