return {
	enabled = true,
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		local telescope = require('telescope')
		telescope.setup({
			defaults = {
				file_ignore_patterns = { '%.jpeg', '%.png', '%.jpg', 'node_modules/.*' },
				layout_config = {
					horizontal = {
						width = 0.9,
						preview_cutoff = 0,
					},
				},
			},
		})
	end,
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
				require('telescope.builtin').live_grep()
			end,
		},
	},
}
