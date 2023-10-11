return {
	'L3MON4D3/LuaSnip',
	event = 'InsertEnter',
	dependencies = { 'rafamadriz/friendly-snippets' },
	config = function()
		local ls = require('luasnip')

		require('luasnip.loaders.from_vscode').lazy_load()
		require('luasnip.loaders.from_vscode').load({ paths = './my_snippets' })
		require('luasnip.loaders.from_lua').load({ paths = './my_snippets/luasnip' })

		-- load telekasten, then markdown, then all.
		ls.filetype_extend('telekasten', { 'markdown' })
		-- load markdown, then all (no telekasten).
		-- ls.filetype_set('telekasten', { 'markdown' })

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
