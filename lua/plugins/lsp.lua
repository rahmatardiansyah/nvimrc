return {
	enabled = true,
	'neovim/nvim-lspconfig',
	cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		{
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v3.x',
			lazy = true,
		},
		{
			'williamboman/mason.nvim',
			lazy = false,
			config = true,
		},
		{ 'williamboman/mason-lspconfig.nvim' },
	},
	config = function()
		local lsp_zero = require('lsp-zero')

		lsp_zero.extend_lspconfig()

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		lsp_zero.set_sign_icons({
			error = '✘',
			warn = '▲',
			hint = '⚑',
			info = '»',
		})

		vim.diagnostic.config({
			virtual_text = false,
		})

		lsp_zero.setup_servers({})

		require('mason-lspconfig').setup({
			ensure_installed = { 'lua_ls' },
			handlers = {
				lsp_zero.default_setup,
				lua_ls = function()
					local lua_opts = lsp_zero.nvim_lua_ls()
					require('lspconfig').lua_ls.setup(lua_opts)
				end,
			},
		})

		local lspconfig = require('lspconfig')

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = {
							'vim',
						},
					},
				},
			},
		})

		lspconfig.tsserver.setup({})
		lspconfig.emmet_language_server.setup({})
		lspconfig.cssls.setup({
			settings = {
				css = { validate = true, lint = {
					unknownAtRules = 'ignore',
				} },
				scss = { validate = true, lint = {
					unknownAtRules = 'ignore',
				} },
				less = { validate = true, lint = {
					unknownAtRules = 'ignore',
				} },
			},
		})
		lspconfig.astro.setup({})
		lspconfig.tailwindcss.setup({})
	end,
}
