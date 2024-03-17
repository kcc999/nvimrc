-- Vim remaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Telescope 
local builtin = require("telescope.builtin")
vim.keymap.set("n", "fg", builtin.find_files, {})
vim.keymap.set("n", "hg", builtin.git_files, {})
