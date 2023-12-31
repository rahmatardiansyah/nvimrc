return {
	enabled = true,
	'zbirenbaum/copilot-cmp',
	event = 'InsertEnter',
	config = function()
		require('copilot_cmp').setup()
	end,
}
