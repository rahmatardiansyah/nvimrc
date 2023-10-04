return {
	enabled = false,
	'hiphish/rainbow-delimiters.nvim',
	config = function()
		local rainbow_delimiters = require('rainbow-delimiters')
		vim.g.rainbow_delimiters = {
			strategy = {
				[''] = rainbow_delimiters.strategy['global'],
				vim = rainbow_delimiters.strategy['local'],
			},
			query = {
				[''] = 'rainbow-delimiters',
				lua = 'rainbow-blocks',
				javascriptreact = 'rainbow-parens',
			},
			highlight = {
				'RainbowDelimiterBlue',
				'RainbowDelimiterYellow',
				'RainbowDelimiterRed',
				'RainbowDelimiterOrange',
				'RainbowDelimiterGreen',
				'RainbowDelimiterViolet',
				'RainbowDelimiterCyan',
			},
		}

		vim.cmd('highlight! RainbowDelimiterRed guibg=NONE guifg=#e06c75')
		vim.cmd('highlight! RainbowDelimiterYellow guibg=NONE guifg=#e5c07b')
		vim.cmd('highlight! RainbowDelimiterBlue guibg=NONE guifg=#61afef')
		vim.cmd('highlight! RainbowDelimiterOrange guibg=NONE guifg=#d19a66')
		vim.cmd('highlight! RainbowDelimiterGreen guibg=NONE guifg=#98c379')
		vim.cmd('highlight! RainbowDelimiterViolet guibg=NONE guifg=#c678dd')
		vim.cmd('highlight! RainbowDelimiterCyan guibg=NONE guifg=#56b6c2')
	end,
}
