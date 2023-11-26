return {
	'craftzdog/solarized-osaka.nvim',
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require('solarized-osaka').setup({
			transparent = true,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				sidebars = 'transparent',
				floats = 'transparent',
			},
			sidebars = { 'qf', 'help' },
			day_brightness = 0.3,
			hide_inactive_statusline = false,
			dim_inactive = false,
			lualine_bold = false,

			---@param colors ColorScheme
			on_colors = function(colors) end,

			---@param highlights Highlights
			---@param colors ColorScheme
			on_highlights = function(hl, c)
				hl.TelescopeSelection = { bg = '#002B36', fg = '#9EACAD' }
				hl.TelescopePromptTitle = {
					fg = '#9EACAD',
				}
				hl.Search = { fg = '#2AA198', reverse = true }
				hl.IncSearch = { fg = '#268BD2', standout = true }
				hl.Visual = { fg = c.bg, bg = c.fg, reverse = false }
			end,
		})

		vim.cmd([[colorscheme solarized-osaka]])
	end,
}
