return {
	enabled = true,
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		require('nvim-web-devicons').setup({
			override_by_filename = {
				['.gitignore'] = {
					icon = '',
					color = '#db5761',
					name = 'Gitignore',
				},
			},
		})

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		local function my_on_attach(bufnr)
			local api = require('nvim-tree.api')

			local function opts(desc)
				return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set('n', 'd', api.fs.trash, opts('Trash'))
			vim.keymap.set('n', 'D', api.fs.remove, opts('Delete'))
			vim.keymap.set('n', '<esc><esc>', api.tree.close, opts('Delete'))
		end

		require('nvim-tree').setup({
			view = {
				adaptive_size = true,
				width = '100%',
				number = true,
				relativenumber = true,
				float = {
					enable = true,
					quit_on_focus_loss = false,
					open_win_config = {
						relative = 'editor',
						border = 'rounded',
					},
				},
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			renderer = {
				icons = {
					show = {
						git = false,
					},
				},
			},
			trash = {
				cmd = 'trash',
			},
			on_attach = my_on_attach,
		})

		vim.api.nvim_set_keymap('n', '<space>s', ':NvimTreeFindFileToggle<CR>', { noremap = true })
	end,
}
