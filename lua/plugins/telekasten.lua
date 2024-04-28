return {
	'renerocksai/telekasten.nvim',
	dependencies = { 'nvim-telescope/telescope.nvim' },
	config = function()
		require('telekasten').setup({
			home = '/home/rahmat/brain-hub/02. Reference Notes/Topics',
			dailies = '/home/rahmat/brain-hub/01. Daily Notes',
			template_new_note = '/home/rahmat/brain-hub/Templates/NewNote.md',
			template_new_daily = '/home/rahmat/brain-hub/Templates/Daily.md',
			new_note_location = 'prefer_home',
		})

		vim.keymap.set('n', '<leader>z', '<cmd>Telekasten panel<CR>')
		vim.keymap.set('n', '<leader>zd', '<cmd>Telekasten goto_today<CR>')
		vim.keymap.set('n', '<leader>zf', '<cmd>Telekasten find_notes<CR>')
		vim.keymap.set('n', '<leader>zg', '<cmd>Telekasten search_notes<CR>')
		vim.keymap.set('n', '<leader>zz', '<cmd>Telekasten follow_link<CR>')
		vim.keymap.set('n', '<leader>zn', '<cmd>Telekasten new_note<CR>')
		vim.keymap.set('n', '<leader>zb', '<cmd>Telekasten show_backlinks<CR>')
	end,
}
