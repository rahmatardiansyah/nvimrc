vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Disable arrow keys
vim.keymap.set("n", "<Left>", '<ESC>:echo "Use h"<CR>')
vim.keymap.set("n", "<Down>", '<ESC>:echo "Use j"<CR>')
vim.keymap.set("n", "<Up>", '<ESC>:echo "Use k"<CR>')
vim.keymap.set("n", "<Right>", '<ESC>:echo "Use l"<CR>')

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("v", "<leader>p", [["_dp]])
