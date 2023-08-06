-----------------------------------------------------------
-- Treesitter configuration file
-----------------------------------------------------------
local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	return
end

nvim_treesitter.setup({
	ensure_installed = { 'html', 'css', 'javascript', 'markdown', 'bash', 'c', 'latex', 'lua', 'nix' },
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
