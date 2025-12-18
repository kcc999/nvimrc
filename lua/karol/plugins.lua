-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specifications
require("lazy").setup({
  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { 'fg', function() require('telescope.builtin').find_files() end },
      { 'fh', function() require('telescope.builtin').live_grep() end },
      { 'hg', function() require('telescope.builtin').git_files() end },
    },
  },

  -- Colorschemes
  {
    'uloco/bluloco.nvim',
    dependencies = { 'rktjmp/lush.nvim' }
  },
  { 'VonHeikemen/little-wonder' },
  { 'ellisonleao/gruvbox.nvim' },
  { 'navarasu/onedark.nvim' },
  { 'folke/tokyonight.nvim' },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup({
        ensure_installed = { 'typescript', 'go', 'c', 'lua', 'vim', 'vimdoc', 'query', 'rust' },
        auto_install = true,
      })
    end,
  },

  -- LSP Zero and dependencies
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      local lsp = require('lsp-zero')
      lsp.preset('recommended')

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = { 'gopls', 'clangd', 'lua_ls', 'ts_ls', 'rust_analyzer', 'zls' },
        handlers = {
          lsp.default_setup,
        },
      })

      lsp.on_attach(function(client, bufnr)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { buffer = bufnr })
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { buffer = bufnr })
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { buffer = bufnr })
      end)

      lsp.setup()
    end
  },

  -- UI
  { 'nvim-tree/nvim-web-devicons' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
      })
    end
  },

  -- Git
  {
    'NeogitOrg/neogit',
    config = function()
      require('neogit').setup({})
    end
  },

  -- Language support
  { 'Olical/conjure' },
  { 'elixir-editors/vim-elixir' },

  -- Editing
  { 'jiangmiao/auto-pairs' },
})
