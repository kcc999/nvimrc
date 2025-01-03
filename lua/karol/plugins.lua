-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.6', requires = { {'nvim-lua/plenary.nvim'} }}
  use {
	  'uloco/bluloco.nvim',
	  requires = { 'rktjmp/lush.nvim' }
  }
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
     {'williamboman/mason.nvim'},
     {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  },
  use 'nvim-tree/nvim-web-devicons',
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  use {'nyoom-engineering/oxocarbon.nvim'},
  use {'folke/tokyonight.nvim'},
  use {'NeogitOrg/neogit'},
  use { "ellisonleao/gruvbox.nvim" },
  use 'kvrohit/rasmus.nvim',
  use "n1ghtmare/noirblaze-vim",
  use 'axvr/photon.vim',
  use {"xero/miasma.nvim"},
  use 'ribru17/bamboo.nvim',
  use {'VonHeikemen/little-wonder'},
  use "rebelot/kanagawa.nvim",
  use "blazkowolf/gruber-darker.nvim",
  use 'Olical/conjure'

}
end)
