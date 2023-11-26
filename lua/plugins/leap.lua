return {
	'ggandor/leap.nvim',
	config = function()
		require('leap').add_default_mappings()
		require('leap').opts.safe_labels = {}
		vim.keymap.del({ 'x', 'o' }, 'x')
		vim.keymap.del({ 'x', 'o' }, 'X')

		vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
			fg = '#DC322F',
			bold = true,
			nocombine = true,
		})

		vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
			fg = '#268BD2',
			bold = true,
			nocombine = true,
		})
	end,
}
