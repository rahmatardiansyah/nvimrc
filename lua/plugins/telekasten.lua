local home = vim.fn.expand('~/zet')

return {
	enabled = false,
	'renerocksai/telekasten.nvim',
	dependencies = {
		'nvim-telescope/telescope.nvim',
		'mzlogin/vim-markdown-toc',
	},
	config = function()
		require('telekasten').setup({
			home = home .. '/' .. 'notes',
			take_over_my_home = true,
			auto_set_filetype = true,
			dailies = home .. '/' .. 'daily',
			weeklies = home .. '/' .. 'weekly',
			templates = home .. '/' .. 'templates',
			image_subdir = 'images',
			extension = '.md',
			follow_creates_nonexisting = true,
			dailies_create_nonexisting = true,
			weeklies_create_nonexisting = true,
			template_new_note = home .. '/' .. 'templates/new_note.md',
			template_new_daily = home .. '/' .. 'templates/daily.md',
			template_new_weekly = home .. '/' .. 'templates/weekly.md',
			template_handling = 'always_ask',
			image_link_style = 'markdown',
			plug_into_calendar = false,
			-- close_after_yanking = false,
			-- insert_after_inserting = true,
			new_note_filename = 'uuid',
			uuid_type = '%Y%m%d%H%M%S',
			uuid_sep = '-',
			sort = 'modified',
			install_syntax = true,
			tag_notation = 'yaml-bare',
			command_palette_theme = 'dropdown',
			show_tags_theme = 'dropdown',
			media_previewer = 'viu-previewer',
		})

		-- Keymap
		-- Mapping helper
		local function map(mode, lhs, rhs, opts)
			local options = { noremap = true }
			if opts then
				options = vim.tbl_extend('force', options, opts)
			end
			vim.api.nvim_set_keymap(mode, lhs, rhs, options)
		end

		map('n', '<leader>z', ":lua require('telekasten').panel()<CR>")
		-- map('n', '<leader>zf', ":lua require('telekasten').find_notes({ with_live_grep = true })<CR>")
		map('n', '<leader>zg', ":lua require('telekasten').search_notes()<CR>")
		map('n', '<leader>zz', ":lua require('telekasten').follow_link()<CR>")
		map('n', '<leader>zn', ":lua require('telekasten').new_note()<CR>")
		map('n', '<leader>zi', ":lua require('telekasten').paste_img_and_link()<CR>")
		map('n', '<leader>zt', ":lua require('telekasten').toggle_todo()<CR>")
		map('n', '<leader>zb', ":lua require('telekasten').show_backlinks()<CR>")
		map('n', '<leader>zF', ":lua require('telekasten').find_friends()<CR>")
		-- map('n', '<leader>zI', ":lua require('telekasten').insert_img_link({ i=true })<CR>")
		-- map('n', '<leader>zm', ":lua require('telekasten').browse_media()<CR>")
		map('n', '<leader>za', ":lua require('telekasten').show_tags()<CR>")
		map('n', '<leader>zr', ":lua require('telekasten').rename_note()<CR>")
		map('n', '<leader>z[', "<cmd>:lua require('telekasten').insert_link()<CR>")

		local t = require('telescope')
		local tb = require('telescope.builtin')

		vim.keymap.set('n', '<leader>zI', function()
			t.setup({
				defaults = {
					file_ignore_patterns = {},
				},
			})
			require('telekasten').insert_img_link({ i = true })
		end)

		vim.keymap.set('n', '<leader>zm', function()
			t.setup({
				defaults = {
					file_ignore_patterns = {},
				},
			})
			require('telekasten').browse_media()
		end)

		vim.keymap.set('n', '<leader>zf', function()
			tb.grep_string({
				search = '^# ',
				prompt_title = 'Grep Title',
				cwd = home .. '/' .. 'notes',
				use_regex = true,
				additional_args = { '-m1' },
			})
		end)
	end,
}
