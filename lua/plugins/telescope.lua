return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.3',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		defaults = {
			file_ignore_patterns = { '%.jpeg', '%.png', '%.jpg', 'node_modules/.*' },
			layout_config = {
				horizontal = {
					width = 0.9,
					preview_cutoff = 0,
				},
			},
		},
	},
	keys = {
		{
			'<leader>ff',
			function()
				require('telescope.builtin').find_files()
			end,
		},
		{
			'<leader>fs',
			function()
				require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') })
			end,
		},
	},
}
