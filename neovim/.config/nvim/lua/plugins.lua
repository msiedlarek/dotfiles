local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local ok, packer = pcall(require, 'packer')
if not ok then
  return
end

local function get_config(config_module)
  return string.format('require("%s")', config_module)
end

return packer.startup({function(use)
  use 'wbthomason/packer.nvim'

  use 'antoinemadec/FixCursorHold.nvim'

  use {
    'kyazdani42/nvim-web-devicons',
    config = get_config('config.neotree'),
    module = 'nvim-web-devicons',
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update()
    end,
    config = get_config('config.treesitter'),
  }

  use {
    'neovim/nvim-lspconfig',
    config = get_config('config.lspconfig'),
    requires = {
      'hrsh7th/cmp-nvim-lsp',
    },
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-path',
      'neovim/nvim-lspconfig',
      'onsails/lspkind.nvim',
      'saadparwaiz1/cmp_luasnip',
    },
    config = get_config('config.cmp'),
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = get_config('config.lualine'),
  }

  use {
    'gfeiyou/command-center.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
    },
    config = get_config('config.command_center'),
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'gfeiyou/command-center.nvim',
      'kyazdani42/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = get_config('config.telescope'),
  }

  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'MunifTanjim/nui.nvim',
      'kyazdani42/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
    },
    setup = function()
      vim.g.neo_tree_remove_legacy_commands = 1
    end,
    config = get_config('config.neotree'),
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = get_config('config.gitsigns'),
  }

  use {
    'metalelf0/jellybeans-nvim',
    requires = {
      'rktjmp/lush.nvim',
    },
    config = get_config('config.jellybeans'),
  }

  use 'tpope/vim-sleuth'

  use {
    'tpope/vim-fugitive',
    config = get_config('config.fugitive'),
  }

  use {
    'numToStr/Comment.nvim',
    config = get_config('config.comment'),
  }

  use {
    'norcalli/nvim-colorizer.lua',
    cond = function()
      return vim.api.nvim_get_option('termguicolors')
    end,
    config = function()
      require('colorizer').setup()
    end,
  }

  if packer_bootstrap then
    packer.sync()
  end
end, config={
    snapshot = 'default',
    snapshot_path = vim.fn.stdpath('config') .. '/packer'
}})
