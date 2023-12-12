return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		{ 'saadparwaiz1/cmp_luasnip' },
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-path' },
		{ 'uga-rosa/cmp-dictionary' },
		{ 'onsails/lspkind.nvim' },
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
					-- For Debugging - show source lsp client in cmp
					before = function(entry, item)
						if entry.source.name == 'nvim_lsp' then
							item.menu = entry.source.source.client.name
						elseif entry.source.name == 'buffer' then
							item.menu = 'Buffer'
						else
							item.menu = entry.source.name
						end

						return item
					end,
				}),
			},
			experimental = {
				ghost_text = true,
			},
		})

		local dict = require('cmp_dictionary')

		dict.setup({
			exact = 2,
			first_case_insensitive = false,
			document = false,
			document_command = 'wn %s -over',
			sqlite = false,
			max_items = -1,
			capacity = 5,
			debug = true,
		})

		dict.switcher({
			spelllang = {
				en = '~/.local/share/nvim/dictionary/english.dict',
				id = '~/.local/share/nvim/dictionary/indonesian.dict',
			},
		})

		cmp.setup.filetype({ 'markdown', 'tex' }, {
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'buffer' },
				{ name = 'path' },
				{ name = 'dictionary', keyword_length = 2 },
			}),
		})
	end,
}
