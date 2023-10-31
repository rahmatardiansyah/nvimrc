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
				'scss',
				'javascript',
				'markdown',
				'markdown_inline',
				'c',
				'latex',
				'astro',
			},
			sync_install = false,
			auto_install = true,
			ignore_install = {},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { 'markdown' },
			},
			context_commentstring = {
				enable = true,
			},
		})
	end,
}
