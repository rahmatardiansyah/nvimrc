-----------------------------------------------------------
-- Harpoon configuration file
-----------------------------------------------------------
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<leader>e', ui.toggle_quick_menu)

vim.keymap.set('n', '<A-h>', function()
	ui.nav_file(1)
end)
vim.keymap.set('n', '<A-j>', function()
	ui.nav_file(2)
end)
vim.keymap.set('n', '<A-k>', function()
	ui.nav_file(3)
end)
vim.keymap.set('n', '<A-l>', function()
	ui.nav_file(4)
end)
vim.keymap.set('n', '<A-H>', function()
	ui.nav_file(5)
end)
vim.keymap.set('n', '<A-J>', function()
	ui.nav_file(6)
end)
vim.keymap.set('n', '<A-K>', function()
	ui.nav_file(7)
end)
vim.keymap.set('n', '<A-L>', function()
	ui.nav_file(8)
end)
