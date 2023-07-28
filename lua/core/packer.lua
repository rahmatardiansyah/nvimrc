local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			'git',
			'clone',
			'--depth',
			'1',
			'https://github.com/wbthomason/packer.nvim',
			install_path,
		})
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use('wbthomason/packer.nvim')

	-- Main Colorscheme
	use('olimorris/onedarkpro.nvim')

	-- Treesitter
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	})
	use({
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup({})
		end,
	})
	-- Telescope
	use({
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		requires = { { 'nvim-lua/plenary.nvim' } },
	})
	-- Harpoon
	use({
		'ThePrimeagen/harpoon',
		requires = { { 'nvim-lua/plenary.nvim' } },
	})

	use({
		'lewis6991/gitsigns.nvim',
	})

	use({
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{ 'williamboman/mason.nvim' }, -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' }, -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		},
	})

	-- formatting
	use({
		'jose-elias-alvarez/null-ls.nvim',
		'jay-babu/mason-null-ls.nvim',
	})

	use({
		'kylechui/nvim-surround',
		tag = '*',
		config = function()
			require('nvim-surround').setup({})
		end,
	})

	use({
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
	})

	use({ 'lervag/vimtex' })

	use('NvChad/nvim-colorizer.lua')

	if packer_bootstrap then
		require('packer').sync()
	end
end)
