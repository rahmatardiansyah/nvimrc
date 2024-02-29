return {
	enabled = true,
	'L3MON4D3/LuaSnip',
	event = 'InsertEnter',
	dependencies = { 'rafamadriz/friendly-snippets' },
	config = function()
		local ls = require('luasnip')
		local s = ls.snippet
		local sn = ls.snippet_node
		local isn = ls.indent_snippet_node
		local t = ls.text_node
		local i = ls.insert_node
		local f = ls.function_node
		local c = ls.choice_node
		local d = ls.dynamic_node
		local r = ls.restore_node
		local events = require('luasnip.util.events')
		local ai = require('luasnip.nodes.absolute_indexer')
		local extras = require('luasnip.extras')
		local l = extras.lambda
		local rep = extras.rep
		local p = extras.partial
		local m = extras.match
		local n = extras.nonempty
		local dl = extras.dynamic_lambda
		local fmt = require('luasnip.extras.fmt').fmt
		local fmta = require('luasnip.extras.fmt').fmta
		local conds = require('luasnip.extras.expand_conditions')
		local postfix = require('luasnip.extras.postfix').postfix
		local types = require('luasnip.util.types')
		local parse = require('luasnip.util.parser').parse_snippet
		local ms = ls.multi_snippet
		local k = require('luasnip.nodes.key_indexer').new_key

		require('luasnip.loaders.from_vscode').lazy_load()

		vim.api.nvim_create_user_command('LuaSnipEdit', function()
			require('luasnip.loaders').edit_snippet_files()
		end, { desc = 'Edit Custom Snippets' })

		vim.keymap.set({ 'i', 's' }, '<C-e>', function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })

		ls.filetype_extend('javascriptreact', { 'javascript' })
		ls.filetype_extend('typescript', { 'javascript' })
		ls.filetype_extend('typescriptreact', { 'javascript' })
	end,
}
