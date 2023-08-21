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
map('n', '<Left>', '<ESC>:echo "Use h"<CR>')
map('n', '<Down>', '<ESC>:echo "Use j"<CR>')
map('n', '<Up>', '<ESC>:echo "Use k"<CR>')
map('n', '<Right>', '<ESC>:echo "Use l"<CR>')

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

map('n', '<leader>w', '<cmd>lua vim.lsp.buf.format()<cr>')

-- greatest remap ever
-- vim.keymap.set("v", "<leader>p", [["_dp]])
