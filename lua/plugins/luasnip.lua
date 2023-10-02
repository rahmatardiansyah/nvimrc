return {
	'L3MON4D3/LuaSnip',
	dependencies = { 'rafamadriz/friendly-snippets' },
	config = function()
		local ls = require('luasnip')

		require('luasnip.loaders.from_vscode').lazy_load()
		require('luasnip.loaders.from_vscode').load({ paths = './my_snippets' })
		require('luasnip.loaders.from_lua').load({ paths = './my_snippets/snippets' })

		vim.api.nvim_create_user_command('LuaSnipEdit', function()
			require('luasnip.loaders').edit_snippet_files()
		end, { desc = 'Edit Custom Snippets' })

		vim.keymap.set({ 'i', 's' }, '<C-E>', function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })
	end,
}
