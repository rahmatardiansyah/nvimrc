return {
	enabled = true,
	'olimorris/onedarkpro.nvim',
	priority = 1000,
	config = function()
		local iod = {
			bg = '#111216',
			fg = '#BCBEC0',
			red = '#C74F58',
			orange = '#BE8C5D',
			yellow = '#C99D49',
			green = '#72A34E',
			cyan = '#388F9A',
			blue = '#2E8AD5',
			purple = '#A549C0',
			white = '#C8CBCF',
			black = '#24282F',
			gray = '#9C9EA2',
			highlight = '#C99D49',
			comment = '#797B7D',
		}
		require('onedarkpro').setup({
			options = {
				cursorline = true,
				transparency = true,
				terminal_colors = true,
			},
			colors = {
				bg = iod.bg,
				fg = iod.fg,
				red = iod.red,
				orange = iod.orange,
				yellow = iod.yellow,
				green = iod.green,
				cyan = iod.cyan,
				blue = iod.blue,
				purple = iod.purple,
				white = iod.white,
				black = iod.black,
				gray = iod.gray,
				highlight = iod.highlight,
				comment = iod.comment,
			},
			highlights = {
				CursorLine = { bg = 'none' },
				CursorLineNr = { bg = 'none', fg = iod.orange },
				TelescopeSelection = {
					bg = iod.black,
					fg = '#C9CBCF',
				},
				TelescopeMatching = { fg = iod.highlight },
			},
		})
	end,
}
