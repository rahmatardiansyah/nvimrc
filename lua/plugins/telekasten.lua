local home = vim.fn.expand('~/brain-hub')

return {
	enabled = true,
	'renerocksai/telekasten.nvim',
	dependencies = {
		'nvim-telescope/telescope.nvim',
		'mzlogin/vim-markdown-toc',
	},
	config = function()
		require('telekasten').setup({
			home = home,
			take_over_my_home = true,
			auto_set_filetype = false,
			dailies = home .. '/' .. '01. Daily Notes',
			image_subdir = 'Attachments',
			extension = '.md',
			follow_creates_nonexisting = true,
			dailies_create_nonexisting = true,
			template_new_note = home .. '/' .. 'Templates/NewNote.md',
			template_new_daily = home .. '/' .. 'Templates/Daily.md',
			plug_into_calendar = false,
			-- close_after_yanking = false,
			-- insert_after_inserting = true,
			sort = 'modified',
			install_syntax = true,
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
		map('n', '<leader>zf', ":lua require('telekasten').find_notes()<CR>")
		map('n', '<leader>zg', ":lua require('telekasten').search_notes()<CR>")
		map('n', '<leader>zz', ":lua require('telekasten').follow_link()<CR>")
		map('n', '<leader>zn', ":lua require('telekasten').new_note()<CR>")
		map('n', '<leader>zt', ":lua require('telekasten').toggle_todo()<CR>")
		map('n', '<leader>zb', ":lua require('telekasten').show_backlinks()<CR>")
		map('n', '<leader>zd', ":lua require('telekasten').goto_today()<CR>")
		map('n', '<leader>zF', ":lua require('telekasten').find_friends()<CR>")
		map('n', '<leader>za', ":lua require('telekasten').show_tags()<CR>")
		map('n', '<leader>zr', ":lua require('telekasten').rename_note()<CR>")
		map('n', '<leader>z[', "<cmd>:lua require('telekasten').insert_link()<CR>")
	end,
}
