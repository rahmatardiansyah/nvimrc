-----------------------------------------------------------
-- Telescope configuration file
-----------------------------------------------------------
local actions = require('telescope.actions')

require('telescope').setup({
	defaults = {
		file_ignore_patterns = { '%.jpeg', '%.png', '%.jpg', 'node_modules/.*' },
		layout_config = {
			horizontal = {
				width = 0.9,
				preview_cutoff = 0,
			},
		},
		mappings = {
			i = {
				['<esc><esc>'] = actions.close, -- Close telescope fast
			},
		},
	},
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)
