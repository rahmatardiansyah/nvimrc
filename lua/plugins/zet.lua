return {
	dir = '~/Documents/project/zet.nvim',
	config = function()
		require('zet').setup({
			home = vim.fn.expand('~') .. '/zet',
			notes_directory = vim.fn.expand('~') .. '/zet/notes',
			template_file = vim.fn.expand('~') .. '/zet/templates/new_note.md',
			file_name = 'timestamp',
		})

		-- Keymap
		local function map(mode, lhs, rhs, opts)
			local options = { noremap = true }
			if opts then
				options = vim.tbl_extend('force', options, opts)
			end
			vim.api.nvim_set_keymap(mode, lhs, rhs, options)
		end

		map('n', '<leader>zn', ':ZetAddNote<CR>')
		map('n', '<leader>zb', ':ZetBrowse<CR>', { silent = true })
		map('n', '<leader>zz', ':ZetOpen<CR>')
		map('n', '<leader>zf', ':ZetFindTitle<CR>')
		map('n', '<leader>zs', ':ZetFindWord<CR>')
	end,
}
