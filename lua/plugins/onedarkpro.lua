return {
	'olimorris/onedarkpro.nvim',
	priority = 1000,
	config = function()
		require('onedarkpro').setup({
			highlights = {
				CursorLine = { bg = 'NONE' },
				CursorLineNr = { fg = '#61AFEF' },
			},
			options = {
				cursorline = true,
				transparency = true,
				terminal_colors = true,
			},
		})

		vim.cmd('colorscheme onedark')
	end,
}
