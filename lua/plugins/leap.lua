return {
	'ggandor/leap.nvim',
	config = function()
		require('leap').add_default_mappings()
		require('leap').opts.safe_labels = {}
		vim.keymap.del({ 'x', 'o' }, 'x')
		vim.keymap.del({ 'x', 'o' }, 'X')
	end,
}
