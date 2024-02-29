return {
	enabled = true,
	'stevearc/conform.nvim',
	event = { 'BufWritePre' },
	cmd = { 'ConformInfo' },
	config = function()
		require('conform').setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { 'stylua' },
				sh = { 'shfmt' },
				tex = { 'latexindent' },
				markdown = { 'prettier' },
				html = { 'prettier' },
				css = { 'prettier' },
				scss = { 'prettier' },
				javascript = { 'prettier' },
				json = { 'prettier' },
				jsonc = { 'prettier' },
				typescript = { 'prettier' },
				javascriptreact = { 'prettier' },
				typescriptreact = { 'prettier' },
				['markdown.mdx'] = { 'prettier' },
				['_'] = { 'trim_whitespace' },
			},
			formatters = {
				['astro'] = {
					command = 'prettier',
					args = { '--stdin-filepath', '$FILENAME', '--plugin', 'prettier-plugin-astro' },
				},
			},
		})
	end,
}
