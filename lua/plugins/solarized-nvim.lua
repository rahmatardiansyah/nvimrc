return {
	'maxmx03/solarized.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		require('solarized').setup({
			transparent = true,
			styles = {
				comments = {},
				functions = {},
				variables = {},
				numbers = {},
				constants = {},
				parameters = {},
				keywords = {},
				types = {},
			},
			enables = {
				bufferline = true,
				cmp = true,
				diagnostic = true,
				dashboard = true,
				editor = true,
				gitsign = true,
				hop = true,
				indentblankline = true,
				lsp = true,
				lspsaga = true,
				navic = true,
				neogit = true,
				neotree = true,
				notify = true,
				semantic = true,
				syntax = true,
				telescope = false,
				tree = true,
				treesitter = true,
				whichkey = true,
				mini = true,
			},
			highlights = function(c, ch)
				local darken = ch.darken
				local lighten = ch.lighten
				local blend = ch.blend

				return {
					LineNr = { fg = c.base1, bg = c.base02 },
				}
			end,
			colors = {},
			theme = 'default',
		})
	end,
}
