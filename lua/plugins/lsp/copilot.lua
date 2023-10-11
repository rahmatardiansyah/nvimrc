return {
	'zbirenbaum/copilot.lua',
	cmd = 'Copilot',
	event = 'InsertEnter',
	config = function()
		require('copilot').setup({
			panel = {
				enabled = false,
				auto_refresh = false,
				keymap = {
					jump_prev = '[[',
					jump_next = ']]',
					accept = '<CR>',
					refresh = 'gr',
					open = '<M-CR>',
				},
				layout = {
					position = 'bottom',
					ratio = 0.4,
				},
			},
			suggestion = {
				enabled = false,
				auto_trigger = false,
				debounce = 75,
				keymap = {
					accept = '<M-l>',
					accept_word = false,
					accept_line = false,
					next = '<M-]>',
					prev = '<M-[>',
					dismiss = '<C-]>',
				},
			},
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				['.'] = false,
			},
			copilot_node_command = 'node',
			server_opts_overrides = {},
		})
	end,
}
