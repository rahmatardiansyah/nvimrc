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
				hl.Search = { fg = c.cyan500, reverse = true }
				hl.IncSearch = { fg = c.blue500, standout = true }
				hl.Visual = { fg = c.bg, bg = c.fg, reverse = false }

				hl.TelescopeSelection = { fg = c.base1, bg = c.bg_highlight }
				hl.TelescopePromptTitle = { fg = c.base1 }

				-- markdown
				hl.markdownCode = { bg = nil }
				hl['@text.literal.markdown_inline'] = { fg = c.blue500, bg = nil, bold = false }
				hl['@punctuation.delimiter'] = { fg = c.orange500, bg = nil, bold = true }
				hl.markdownCodeBlock = { bg = nil }
				hl['@text.literal.block'] = { fg = c.blue500 }
				hl.markdownLinkText = { fg = c.blue500, underline = false }
				hl['@text.reference'] = { fg = c.blue500, underline = false }

				hl['@text.title.1.marker'] = { fg = c.orange300, bg = nil, bold = true }
				hl['@text.title.2.marker'] = { fg = c.orange300, bg = nil, bold = true }
				hl['@text.title.3.marker'] = { fg = c.orange500, bg = nil, bold = true }
				hl['@text.title.4.marker'] = { fg = c.orange500, bg = nil, bold = true }
				hl['@text.title.5.marker'] = { fg = c.orange700, bg = nil, bold = false }
				hl['@text.title.6.marker'] = { fg = c.orange700, bg = nil, bold = false }
				hl['@text.title.1'] = { fg = c.blue300, bg = nil, bold = true }
				hl['@text.title.2'] = { fg = c.blue300, bg = nil, bold = true }
				hl['@text.title.3'] = { fg = c.blue500, bg = nil, bold = true }
				hl['@text.title.4'] = { fg = c.blue500, bg = nil, bold = true }
				hl['@text.title.5'] = { fg = c.blue700, bg = nil, bold = false }
				hl['@text.title.6'] = { fg = c.blue700, bg = nil, bold = false }

				hl.DiffAdd = { fg = c.green500, bg = nil, bold = false }
				hl.DiffDelete = { fg = c.red500, bg = nil, bold = false }
			end,
		})
	end,
}
