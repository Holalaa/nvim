local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {'rose-pine/neovim'} --, as = 'rose-pine', config = "vim.cmd('colorscheme rose-pine')"}
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate", config = "require('treesitter-config')"}
  use {'windwp/nvim-ts-autotag'}
  use {'p00f/nvim-ts-rainbow'}
  use {'windwp/nvim-autopairs', config = "require('autopairs-config')"}
  use {'folke/which-key.nvim', config = "require('whichkey-config')"}

  -- Telescope 
  use {'nvim-lua/popup.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use 
    {   
      'nvim-telescope/telescope.nvim', --requires = "nvim-lua/plenary.nvim", 
      config = "require('telescope-config')"
    }
  use {'nvim-telescope/telescope-media-files.nvim'}

  use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}, config = "require('lualine-config')"}
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons', config = "require('bufferline-config')"}
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', config = "require('nvimtree-config')"}
	use {'neovim/nvim-lspconfig'} -- config = "require('lsp')"}
  -- lsp
 
  use {"folke/lua-dev.nvim"}
  use {"jose-elias-alvarez/null-ls.nvim"}
  use {"jose-elias-alvarez/nvim-lsp-ts-utils"}
  use {'williamboman/nvim-lsp-installer'}

  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/nvim-compe', config = "require('nvim-compe')"}
  use {'hrsh7th/vim-vsnip'}
  use {'onsails/lspkind-nvim'}
  use {'norcalli/nvim-colorizer.lua'} --, config = "require('colorizer')"}
  use {'lewis6991/gitsigns.nvim', config = "require('gitsigns-config')"}
  use {'glepnir/dashboard-nvim', config = "require('dashboard-config')"}
  use {"lukas-reineke/indent-blankline.nvim", config = "require('blankline-config')"}
  use {'lukas-reineke/format.nvim', config = "require('format-config')"}
  use {"terrortylor/nvim-comment", config = "require('comment-config')"}
  use {"akinsho/toggleterm.nvim", config = "require('toggleterm-config')"}
  use {'nanotee/nvim-lua-guide'}
  -- colorscheme
  use {'folke/tokyonight.nvim'}
  use {'morhetz/gruvbox'}
  use {'altercation/vim-colors-solarized'}


  use {'glepnir/lspsaga.nvim'}
  use {'kosayoda/nvim-lightbulb'}
  --debug  adapter protocol
  use 'mfussenegger/nvim-dap'
  use {'unblevable/quick-scope'}
  use {'airblade/vim-rooter'}
  
--  use {'nvim-treesitter/nvim-treesitter'}
  use {'nvim-treesitter/playground'}
  
  use 'folke/lsp-colors.nvim'  -- color thanh báo lỗi
  -- run  code 
  use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }
  
  use {"SmiteshP/nvim-gps",requires = "nvim-treesitter/nvim-treesitter", config = "require('nvim-gps').setup()"}
 
  use {
    'rlch/github-notifications.nvim',
    config = [[require('config.github-notifications')]],
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
