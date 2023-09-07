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
		nix = {
			require('formatter.filetypes.nix').nixfmt,
		},
		tex = {
			require('formatter.filetypes.latex').latexindent,
		},
		['scss'] = {
			require('formatter.filetypes.css').prettier,
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
