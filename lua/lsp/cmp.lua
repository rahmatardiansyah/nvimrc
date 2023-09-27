local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

-- Load Snippet
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
	},
	mapping = {
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})

cmp.setup.filetype({ 'markdown', 'tex' }, {
	sources = cmp.config.sources({
		{ name = 'dictionary', keyword_length = 2 },
	}),
})

require('lsp/dictionary')
