-----------------------------------------------------------
-- Onedark colorscheme configuration file
-----------------------------------------------------------
local status_ok, onedark = pcall(require, 'onedarkpro')
if not status_ok then
  return
end

onedark.setup({
		options = {
		bold = true,
		italic = true,
		underline = true,
		undercurl = true,

		cursorline = true,
		transparency = true,
		terminal_colors = true,
		highlight_inactive_windows = false,
	},
})

vim.cmd("colorscheme onedark")