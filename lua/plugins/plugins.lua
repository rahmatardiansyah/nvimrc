local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Install your plugins here
return packer.startup(function(use)
	use({ "wbthomason/packer.nvim", commit = "213ed031490ab5318e7996a594b52131e5c1c06f" })
	use({ "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" })
	-- Ui
	use({ "olimorris/onedarkpro.nvim", commit = "2c439754e1a60d42197e79461bf04e358213a654" })
	use({ "catppuccin/nvim", as = "catppuccin", commit = "5ed078f980c454b1357d156cb577016c00ee918f" })
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = 'require("plugins.treesitter")',
		commit = "22824614163c54ef5d366b15c8685e24d33763db",
	})
	use({ "p00f/nvim-ts-rainbow", commit = "9dd019e84dc3b470dfdb5b05e3bb26158fef8a0c" })
	use({
		"windwp/nvim-autopairs",
		config = 'require("plugins.autopairs")',
		commit = "972a7977e759733dd6721af7bcda7a67e40c010e",
	})
	use({ "windwp/nvim-ts-autotag", commit = "044a05c4c51051326900a53ba98fddacd15fea22" })
	use({
		"nvim-telescope/telescope.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = 'require("plugins.telescope")',
		commit = "b5833a682c511885887373aad76272ad70f7b3c2",
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = 'require("plugins.lualine")',
		commit = "c880c8cfedd461c3bc93540f5aab4e8447bfcb2f",
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = 'require("plugins.nvim-tree")',
		commit = "451901ca9c4a0d97d7b7cb93276be7ed5588b3ab",
	})
	use({
		"ThePrimeagen/harpoon",
		requires = "nvim-lua/plenary.nvim",
		commit = "d3d3d22b6207f46f8ca64946f4d781e975aec0fc",
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = 'require("plugins.colorizer")',
		commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6",
	})
	use({
		"lewis6991/gitsigns.nvim",
		config = 'require("plugins.gitsigns")',
		commit = "8b817e76b6399634f3f49e682d6e409844241858",
	})
	use({
		"terrortylor/nvim-comment",
		config = 'require("nvim_comment").setup()',
		commit = "861921706a39144ea528a6200a059a549b02d8f0",
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = 'require("plugins.blankline")',
		commit = "c15bbe9f23d88b5c0b4ca45a446e01a0a3913707",
	})

	-- Lsp and auto complete
	use({
		"neovim/nvim-lspconfig",
		config = 'require("plugins.lsp")',
		commit = "df3be5006530ff73b57d6c302b4da7ed2b0e159d",
	})
	use({ "hrsh7th/nvim-cmp", commit = "706371f1300e7c0acb98b346f80dad2dd9b5f679" }) -- Autocompletion plugin
	use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }) -- LSP source for nvim-cmp
	use({ "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }) -- LSP source for nvim-cmp
	use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" })
	use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- Snippets source for nvim-cmp
	use({ "L3MON4D3/LuaSnip", commit = "d8cacf83a214b7dd80986a8a24e4adf3fdd4f069" }) -- Snippets plugin
	use({ "rafamadriz/friendly-snippets", commit = "8880d7257e6f25e177a8192ef35d4ba8874b004d" })
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "9b66c33191598d56c705e87016d48d46f57f98fb" }) -- formatting
	use({ "ray-x/lsp_signature.nvim", commit = "4665921ff8e30601c7c1328625b3abc1427a6143" })
	use({ "aca/emmet-ls" })
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
