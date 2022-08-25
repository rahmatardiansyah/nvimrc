if vim.fn.has("nvim-0.7.2") == 0 then
	error("Need Neovim v0.7.2 in order to run this config!")
end

-- Basic Neovim Configuration
require("options")

-- Autocmds
require("autocmds")

-- Plugins
require("plugins.plugins")

-- Colorscheme
-- require("plugins.onedarkpro")
require("plugins.catppuccin")

-- Keymaps
require("keymaps")
