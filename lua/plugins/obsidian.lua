return {
	enabled = false,
	'epwalsh/obsidian.nvim',
	lazy = true,
	event = {
		'BufReadPre ' .. vim.fn.expand('~') .. '/brain-hub/**.md',
		'BufNewFile ' .. vim.fn.expand('~') .. '/brain-hub/**.md',
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	opts = {
		workspaces = {
			{
				name = 'brain-hub',
				path = '~/brain-hub',
			},
		},
		detect_cwd = false,
		-- notes_subdir = 'notes',
		log_level = vim.log.levels.DEBUG,
		daily_notes = {
			folder = '01. Daily Notes',
			date_format = '%Y-%m-%d',
			-- alias_format = '%B %-d, %Y',
			template = 'Daily.md',
		},
		completion = {
			nvim_cmp = true,
			min_chars = 2,
			new_notes_location = 'notes_subdir',
			prepend_note_id = true,
		},
		mappings = {
			['gf'] = {
				action = function()
					return require('obsidian').util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
		},
		overwrite_mappings = false,
		disable_frontmatter = true,
		templates = {
			subdir = 'Templates',
			date_format = '%Y-%m-%d',
			time_format = '%H:%M',
			substitutions = {},
		},
		backlinks = {
			height = 10,
			wrap = true,
		},
		follow_url_func = function(url)
			vim.fn.jobstart({ 'xdg-open', url })
		end,
		use_advanced_uri = true,
		open_app_foreground = false,
		finder = 'telescope.nvim',
		sort_by = 'modified',
		sort_reversed = true,
		open_notes_in = 'current',
		yaml_parser = 'native',
	},
}
