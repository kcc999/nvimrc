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
  -- FFF
  {
    'dmtrKovalenko/fff.nvim',
    build = function()
      require('fff.download').download_or_build_binary()
    end,
    lazy = false,
    opts = {},
    keys = {
      { 'fg', function() require('fff').find_files() end, desc = 'Find files' },
      { 'fh', function() require('fff').live_grep() end, desc = 'Live grep' },
      { 'hg', function() require('fff').find_files() end, desc = 'Find repo files' },
    },
  },
  { 'nvim-lua/plenary.nvim' },
  {'akinsho/git-conflict.nvim', version = "*", config = true},

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
        ensure_installed = { 'typescript', 'go', 'c', 'lua', 'vim', 'vimdoc', 'query', 'rust', 'elixir', 'heex' },
        auto_install = true,
      })
    end,
  },
  {
    "kdheepak/monochrome.nvim"
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },

  {
    "pebeto/dookie.nvim",
  },

  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {},
    config = function(_, opts)
      vim.o.termguicolors = true
      vim.o.background = 'light'
      require('solarized').setup(opts)
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
        ensure_installed = { 'gopls', 'clangd', 'lua_ls', 'ts_ls', 'rust_analyzer', 'zls', 'elixirls' },
        handlers = {
          lsp.default_setup,
        },
      })

      lsp.on_attach(function(client, bufnr)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { buffer = bufnr })
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { buffer = bufnr })
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { buffer = bufnr })
      end)

      local cmp = require('cmp')
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
      })

      lsp.setup()
    end
  },

  {
    "vague-theme/vague.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.

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
  {
    "https://github.com/RRethy/base16-nvim",
    config = function()
      local bg = "#0F1919"
      local accent = "#102121"
      local accent2 = "#0D2525"      -- highlight

      local text = "#abb2bf"
      local dark_text = "#3E4451"      -- comments, line numbers

      local keyword = "#8F939A"
      local func = "#B6AB8B"
      local types = "#65838E"
      local constant = "#A06057"

      local for_tesing = "#FF0000"

      require("base16-colorscheme").setup({
        base00 = bg,
        base01 = accent,
        base02 = accent2,
        base03 = dark_text,
        base04 = dark_text,
        base05 = text,
        base06 = for_tesing,
        base07 = for_tesing,
        base08 = text,
        base09 = constant,
        base0A = types,
        base0B = constant,
        base0C = text,
        base0D = func,
        base0E = keyword,
        base0F = text,
      })
    end,
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
  {
    'jpalardy/vim-slime',
    ft = { 'elixir' },
    config = function()
      -- Mimic Conjure keybindings for Elixir using vim-slime
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "elixir",
        callback = function(ev)
          local opts = { buffer = ev.buf }

          -- ,ee — eval current line
          vim.keymap.set("n", "<localleader>ee", function()
            vim.cmd("SlimeSendCurrentLine")
          end, opts)

          -- ,er — eval visual selection
          vim.keymap.set("v", "<localleader>er", "<Plug>SlimeRegionSend", opts)

          -- ,eb — eval entire buffer
          vim.keymap.set("n", "<localleader>eb", function()
            vim.cmd("%SlimeSend")
          end, opts)

          -- ,ef — eval paragraph (like Conjure's eval form)
          vim.keymap.set("n", "<localleader>ef", "<Plug>SlimeParagraphSend", opts)

          -- ,ls — open iex in a vertical split
          vim.keymap.set("n", "<localleader>ls", function()
            vim.cmd("vsplit | terminal iex -S mix")
            local job_id = vim.b.terminal_job_id
            vim.cmd("wincmd p") -- go back to code window
            vim.b.slime_config = { jobid = job_id }
          end, opts)
        end,
      })
    end,
  },

  -- Editing
  { 'jiangmiao/auto-pairs' },
})
