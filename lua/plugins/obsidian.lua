return {
	enabled = false,
	'epwalsh/obsidian.nvim',
	lazy = true,
	event = {
		'BufReadPre ' .. vim.fn.expand('~') .. '/zet/**.md',
		'BufNewFile ' .. vim.fn.expand('~') .. '/zet/**.md',
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		require('obsidian').setup({
			dir = '~/zet',
			notes_subdir = 'notes',
			log_level = vim.log.levels.DEBUG,
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
		})
	end,
}
