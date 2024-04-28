return {
	enabled = true,
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-path' },
		{ 'saadparwaiz1/cmp_luasnip' },
		{ 'onsails/lspkind.nvim' },
		{ 'zbirenbaum/copilot-cmp' },
		{ 'roobert/tailwindcss-colorizer-cmp.nvim' },
	},
	config = function()
		local lsp_zero = require('lsp-zero')
		lsp_zero.extend_cmp()

		local cmp = require('cmp')
		local cmp_action = lsp_zero.cmp_action()

		cmp.setup({
			sources = {
				{ name = 'luasnip' },
				{ name = 'nvim_lsp' },
				{ name = 'copilot' },
				{ name = 'buffer' },
				{ name = 'path' },
			},
			mapping = cmp.mapping.preset.insert({
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				['<C-e>'] = cmp.mapping.abort(),
				['<C-u>'] = cmp.mapping.scroll_docs(-4),
				['<C-d>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-f>'] = cmp_action.luasnip_jump_forward(),
				['<C-b>'] = cmp_action.luasnip_jump_backward(),
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			formatting = {
				fields = { 'abbr', 'menu', 'kind' },
				format = require('lspkind').cmp_format({
					symbol_map = {
						Copilot = '',
					},
					mode = 'symbol_text',
					maxwidth = 50,
					ellipsis_char = '...',
					before = function(entry, item)
						if item.kind == 'Color' and entry.completion_item.documentation then
							local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
							if r then
								local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
								local group = 'Tw_' .. color
								if vim.fn.hlID(group) < 1 then
									vim.api.nvim_set_hl(0, group, { fg = '#' .. color })
								end
								item.kind = '■'
								item.kind_hl_group = group
								return item
							end
						end

						-- For Debugging - show source lsp client in cmp
						-- if entry.source.name == 'nvim_lsp' then
						-- 	item.menu = entry.source.source.client.name
						-- elseif entry.source.name == 'buffer' then
						-- 	item.menu = 'Buffer'
						-- else
						-- 	item.menu = entry.source.name
						-- end

						return item
					end,
				}),
			},
			experimental = {
				ghost_text = false,
			},
		})

		require('copilot_cmp').setup()

		require('tailwindcss-colorizer-cmp').setup({
			color_square_width = 1,
		})
	end,
}
