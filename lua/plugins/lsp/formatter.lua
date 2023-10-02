return {
	'mhartington/formatter.nvim',
	event = 'BufWritePost',
	config = function()
		local defaults = require('formatter.defaults')
		local util = require('formatter.util')

		require('formatter').setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = {
					require('formatter.filetypes.lua').stylua,
				},
				html = {
					require('formatter.filetypes.html').prettier,
				},
				css = {
					require('formatter.filetypes.css').prettier,
				},
				javascript = {
					require('formatter.filetypes.javascript').prettier,
				},
				javascriptreact = {
					require('formatter.filetypes.javascriptreact').prettier,
				},
				typescript = {
					require('formatter.filetypes.javascript').prettier,
				},
				typescriptreact = {
					require('formatter.filetypes.javascriptreact').prettier,
				},
				json = {
					require('formatter.filetypes.json').prettier,
				},
				nix = {
					require('formatter.filetypes.nix').nixfmt,
				},
				tex = {
					require('formatter.filetypes.latex').latexindent,
				},
				['scss'] = {
					require('formatter.filetypes.css').prettier,
				},
				['astro'] = {
					function()
						return {
							exe = 'prettier',
							args = {
								'--stdin-filepath',
								util.escape_path(util.get_current_buffer_file_path()),
								'--plugin',
								'prettier-plugin-astro',
							},
							stdin = true,
							try_node_modules = true,
						}
					end,
				},
				['*'] = {
					require('formatter.filetypes.any').remove_trailing_whitespace,
				},
			},
		})

		-- Format after save
		vim.cmd([[
      augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost * FormatWrite
      augroup END
    ]])
	end,
}
