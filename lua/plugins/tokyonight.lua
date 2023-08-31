require('tokyonight').setup({
	style = 'storm',
	light_style = 'day',
	transparent = false,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = 'dark',
		floats = 'dark',
	},
	sidebars = { 'qf', 'help' },
	day_brightness = 0.3,
	hide_inactive_statusline = false,
	dim_inactive = false,
	lualine_bold = false,

	on_highlights = function(hl, c)
		hl.CursorLine = {
			bg = '#24283b',
		}
		hl.CursorLineNr = {
			fg = '#ff9e64',
		}
		hl.LineNr = {
			fg = '#a9b1d6',
		}
	end,
})

vim.cmd([[colorscheme tokyonight]])
