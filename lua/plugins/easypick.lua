return {
	enabled = false,
	'axkirillov/easypick.nvim',
	config = function()
		local easypick = require('easypick')
		local telescope = require('telescope')
		easypick.setup({
			pickers = {
				{
					name = 'Search Title',
					command = 'grep -m 1 "^#" ~/Documents/zet/notes/* -d skip -I',
				},
			},
		})

		vim.keymap.set('n', '<leader>zf', ':Easypick Search Title<CR>')
	end,
}
