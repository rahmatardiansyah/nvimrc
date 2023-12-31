return {
  enabled = false,
	'mhartington/formatter.nvim',
	event = 'BufWritePost',
	config = function()
		local defaults = require('formatter.defaults')
		local util = require('formatter.util')

		require('formatter').setup({
			logging = true,
			log_level = vim.log.levels.WARN, -- WARN / DEBUG
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
					require('formatter.filetypes.typescript').prettier,
				},
				typescriptreact = {
					require('formatter.filetypes.typescriptreact').prettier,
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
				sh = {
					require('formatter.filetypes.sh').shfmt,
				},
				['scss'] = {
					function(parser)
						if not parser then
							return {
								exe = 'prettier',
								args = {
									'--stdin-filepath',
									util.escape_path(util.get_current_buffer_file_path()),
								},
								stdin = true,
								try_node_modules = true,
							}
						end

						return {
							exe = 'prettier',
							args = {
								'--stdin-filepath',
								util.escape_path(util.get_current_buffer_file_path()),
								'--parser',
								parser,
							},
							stdin = true,
							try_node_modules = true,
						}
					end,
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
				markdown = {
					require('formatter.filetypes.markdown').prettier,
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
