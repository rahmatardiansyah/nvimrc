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
map('c', '<Left>', '<ESC>:echoerr "Use h"<CR>')
map('c', '<Down>', '<ESC>:echoerr "Use j"<CR>')
map('c', '<Up>', '<ESC>:echoerr "Use k"<CR>')
map('c', '<Right>', '<ESC>:echoerr "Use l"<CR>')

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

map('n', '<leader>s', ':Ex<CR>')
map('n', '<leader>S', ':Vex!<CR>')

map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

map('n', '<esc><esc>', ':nohl<cr>')

map('v', '<leader>p', '"_dP')

map('n', '<leader>fm', ':marks abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ<CR>:normal! `')
map('n', '<leader>dm', ':delm! | delm A-Z0-9<CR>')
