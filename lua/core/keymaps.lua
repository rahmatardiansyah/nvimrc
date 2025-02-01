-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

map('n', '<esc>', '<cmd>nohlsearch<CR>')

map('v', '<leader>p', '"_dP')

map('n', '<leader>c', [[:%s/<C-r><C-w>//gcI<Left><Left><Left><Left>]])

map('v', '<leader>c', [["hy:%s/<C-r>h/<C-r>h/gcI<Left><Left><Left><left>]])
