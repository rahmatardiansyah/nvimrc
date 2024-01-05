return {
	enabled = true,
	'folke/trouble.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local trouble = require('trouble')

		trouble.setup({
			cycle_results = false,
		})

		vim.keymap.set('n', '<leader>xx', function()
			trouble.toggle()
		end)
	end,
}
