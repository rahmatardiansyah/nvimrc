return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		{ 'L3MON4D3/LuaSnip' },
		{ 'saadparwaiz1/cmp_luasnip' },
		{ 'rafamadriz/friendly-snippets' },
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-path' },
		{ 'uga-rosa/cmp-dictionary' },
	},
	config = function()
		local lsp_zero = require('lsp-zero')
		lsp_zero.extend_cmp()

		-- Load Snippet
		require('luasnip.loaders.from_vscode').lazy_load()

		local cmp = require('cmp')
		local cmp_action = lsp_zero.cmp_action()

		cmp.setup({
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
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
			-- (Optional) Show source name in completion menu
			formatting = lsp_zero.cmp_format(),
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
			debug = false,
		})

		dict.switcher({
			spelllang = {
				en = '~/.local/share/nvim/dictionary/english.dict',
				id = '~/.local/share/nvim/dictionary/indonesian.dict',
			},
		})

		cmp.setup.filetype({ 'markdown', 'tex' }, {
			sources = cmp.config.sources({
				{ name = 'dictionary', keyword_length = 2 },
			}),
		})
	end,
}
