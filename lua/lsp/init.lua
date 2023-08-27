local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

lsp.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»',
})

lsp.setup_servers({ 'tsserver', 'eslint' })

lsp.setup()

require('lsp/cmp')
require('lsp/guard')
