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

vim.diagnostic.config({
	virtual_text = false,
})

local lsp_zero = require('lsp-zero')
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {},
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	},
})

lsp.setup_servers({ 'tsserver', 'eslint', 'emmet_ls', 'cssls' })

lsp.setup()

require('lsp/cmp')
require('lsp/formatter')
