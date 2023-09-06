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

require('harpoon').setup({
	tabline = true,
	menu = {
		width = vim.api.nvim_win_get_width(0) - 20,
	},
})

vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#a9b1d6')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#ff9e64')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

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
