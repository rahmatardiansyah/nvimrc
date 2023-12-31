return {
	enabled = true,
	'kylechui/nvim-surround',
	version = '*',
	event = 'VeryLazy',
	config = function()
		require('nvim-surround').setup({})
	end,
}
