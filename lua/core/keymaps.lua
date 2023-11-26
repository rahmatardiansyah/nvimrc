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

-- Disable arrow keys
map('n', '<Left>', '<ESC>:echoerr "Use h"<CR>')
map('n', '<Down>', '<ESC>:echoerr "Use j"<CR>')
map('n', '<Up>', '<ESC>:echoerr "Use k"<CR>')
map('n', '<Right>', '<ESC>:echoerr "Use l"<CR>')

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map('n', '<leader>s', ':Ex<CR>')

map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

map('n', '<esc><esc>', ':nohl<CR>')

map('v', '<leader>p', '"_dP')

-- Disipline
require('utils.init').cowboy()
