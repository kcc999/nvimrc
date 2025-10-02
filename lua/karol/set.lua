vim.cmd("set number relativenumber")
vim.cmd("set termguicolors")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set smarttab")
vim.cmd("set expandtab")
require('onedark').setup {
    style = 'darker'
}
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.keymap.set('n', '<leader>ai', vim.lsp.buf.code_action, { desc = 'Perform Code Action (Autoimport)' })

-- Format current buffer with LSP
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end, { desc = "Format file" })

-- init.lua
vim.g["conjure#client#elixir#stdio#command"] = "iex -S mix"
vim.g["conjure#client#elixir#stdio#prompt_pattern"] = "iex(%d+)>"

-- Visual mode copy (Ctrl-C) and cut (Ctrl-X)
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("v", "<C-x>", '"+d')

-- Normal mode paste
vim.keymap.set("n", "<C-v>", '"+p')

-- Insert and command-line mode paste
vim.keymap.set("i", "<C-v>", '<C-r>+')
vim.keymap.set("c", "<C-v>", '<C-r>+')

