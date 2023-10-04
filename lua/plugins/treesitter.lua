return {
	'nvim-treesitter/nvim-treesitter',
	cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
	config = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = {
				'lua',
				'vim',
				'nix',
				'bash',
				'html',
				'css',
				'javascript',
				'markdown',
				'c',
				'latex',
				'astro',
			},
			sync_install = false,
			auto_install = true,
			ignore_install = {},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			context_commentstring = {
				enable = true,
			},
		})
	end,
}
