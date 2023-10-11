return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.3',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		require('telescope').setup({
			defaults = {
				file_ignore_patterns = { '%.jpeg', '%.png', '%.jpg', 'node_modules/.*' },
				layout_config = {
					horizontal = {
						width = 0.9,
						preview_cutoff = 0,
					},
				},
			},
			extensions = {
				bibtex = {
					depth = 1,
					custom_formats = {},
					format = '',
					global_files = {
						vim.fn.expand('~') .. '/Documents/bib/daftar-pustaka.bib',
					},
					search_keys = { 'author', 'year', 'title' },
					citation_format = '{{author}} ({{year}}), {{title}}.',
					citation_trim_firstname = true,
					citation_max_auth = 2,
					context = false,
					context_fallback = true,
					wrap = false,
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
				require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') })
			end,
		},
	},
}
