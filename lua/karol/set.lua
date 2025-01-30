vim.cmd("set number relativenumber")
vim.cmd("set termguicolors")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set smarttab")
vim.cmd("set expandtab")
require('onedark').setup {
    style = 'darker'
}
vim.cmd("colorscheme onedark")
vim.keymap.set('n', '<leader>ai', vim.lsp.buf.code_action, { desc = 'Perform Code Action (Autoimport)' })
