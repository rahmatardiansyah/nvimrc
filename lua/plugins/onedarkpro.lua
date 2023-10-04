return {
	'olimorris/onedarkpro.nvim',
	priority = 1000,
	config = function()
		require('onedarkpro').setup({
			highlights = {
				CursorLine = { bg = 'NONE' },
				CursorLineNr = { fg = '#61AFEF' },
				IncSearch = { bg = '#61AFEF', fg = '#282c34' },
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
