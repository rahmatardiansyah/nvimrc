return {
	enabled = true,
	'L3MON4D3/LuaSnip',
	event = 'InsertEnter',
	config = function()
		local ls = require('luasnip')

		require('luasnip.loaders.from_vscode').load({ paths = './lua/snippets' })

		vim.api.nvim_create_user_command('LuaSnipEdit', function()
			require('luasnip.loaders').edit_snippet_files()
		end, { desc = 'Edit Custom Snippets' })

		vim.keymap.set({ 'i', 's' }, '<C-e>', function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })
	end,
}
