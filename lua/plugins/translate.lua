local opts = { silent = true }
return {
	'voldikss/vim-translator',
	cmd = { 'TranslateIDtoEN', 'TranslateENtoID' },
	config = function()
		vim.g.translator_default_engines = { 'google' }
		vim.g.translator_source_lang = 'id'
		vim.g.translator_target_lang = 'en'

		vim.api.nvim_create_user_command('TranslateIDtoEN', function()
			vim.cmd("'<,'>TranslateR --engines=google --target_lang=en --source_lang=id")
		end, { desc = 'Edit Custom Snippets', bang = true, range = true })

		vim.api.nvim_create_user_command('TranslateENtoID', function()
			vim.cmd("'<,'>TranslateR --engines=google --target_lang=id --source_lang=en")
		end, { desc = 'Edit Custom Snippets', bang = true, range = true })
	end,
	keys = {
		{
			'<leader>tw',
			':TranslateW<CR>',
			mode = 'n',
			opts,
		},
		{
			'<leader>tw',
			':TranslateW<CR>',
			mode = 'v',
			opts,
		},
		{
			'<leader>tW',
			':TranslateW!<CR>',
			mode = 'n',
			opts,
		},
		{
			'<leader>tW',
			':TranslateW!<CR>',
			mode = 'v',
			opts,
		},
	},
}
