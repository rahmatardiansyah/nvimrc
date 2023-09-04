-----------------------------------------------------------
-- Treesitter configuration file
-----------------------------------------------------------
require('nvim-treesitter.configs').setup({
	ensure_installed = { 'lua', 'vim', 'nix', 'bash', 'html', 'css', 'javascript', 'markdown', 'c', 'latex' },
	sync_install = false,
	auto_install = true,
	ignore_install = { 'yaml' },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	-- Need 'JoosepAlviste/nvim-ts-context-commentstring'
	context_commentstring = {
		enable = true,
	},
})
