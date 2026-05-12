vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true
require('onedark').setup {
    style = 'darker'
}
vim.o.background = "dark" -- or "light" for light mode
vim.keymap.set('n', '<leader>ai', vim.lsp.buf.code_action, { desc = 'Perform Code Action (Autoimport)' })

-- Format current buffer with LSP
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end, { desc = "Format file" })

-- vim-slime config (Elixir REPL)
vim.g.slime_target = "neovim"
vim.g.slime_no_mappings = 1
vim.g.slime_bracketed_paste = 1

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "fff_input", "fff_list", "fff_preview", "fff_file_info" },
  callback = function(args)
    vim.b[args.buf].autopairs_loaded = 1
    vim.b[args.buf].autopairs_enabled = 0
  end,
})

-- Visual mode copy (Ctrl-C) and cut (Ctrl-X)
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("v", "<C-x>", '"+d')

-- Normal mode paste
vim.keymap.set("n", "<C-v>", '"+p')

-- Insert and command-line mode paste
vim.keymap.set("i", "<C-v>", '<C-r>+')
vim.keymap.set("c", "<C-v>", '<C-r>+')

vim.cmd([[colorscheme gruvbox]])
