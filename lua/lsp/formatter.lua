local defaults = require('formatter.defaults')
local util = require('formatter.util')

require('formatter').setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require('formatter.filetypes.lua').stylua,
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
		['*'] = {
			require('formatter.filetypes.any').remove_trailing_whitespace,
		},
	},
})

vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]])
