local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'JoosepAlviste/nvim-ts-context-commentstring',
		},
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		'ThePrimeagen/harpoon',
		event = { 'BufReadPre', 'BufNewFile' },
	},
	{ 'lewis6991/gitsigns.nvim' },
	{
		'numToStr/Comment.nvim',
		event = { 'BufReadPre', 'BufNewFile' },
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			{ 'neovim/nvim-lspconfig' },
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{
				'L3MON4D3/LuaSnip',
				dependencies = {
					{ 'rafamadriz/friendly-snippets' },
					{ 'saadparwaiz1/cmp_luasnip' },
				},
			},
		},
	},
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		opts = {},
	},
	{ 'mhartington/formatter.nvim' },
	-- { 'nvimdev/guard.nvim' },
	{ 'lervag/vimtex' },
	{ 'hiphish/rainbow-delimiters.nvim' },
}, {
	install = {
		colorscheme = { 'tokyonight' },
	},
})
