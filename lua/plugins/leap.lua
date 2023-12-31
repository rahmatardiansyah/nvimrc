return {
	enabled = true,
	'ggandor/leap.nvim',
	config = function()
		require('leap').add_default_mappings()
		require('leap').opts.safe_labels = {}

		vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
		vim.keymap.del({ 'x', 'o' }, 'x')
		vim.keymap.del({ 'x', 'o' }, 'X')
	end,
}
