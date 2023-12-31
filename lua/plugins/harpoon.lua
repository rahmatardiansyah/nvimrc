return {
	{
		enabled = true,
		'ThePrimeagen/harpoon',
		branch = 'harpoon2',
		config = function()
			local harpoon = require('harpoon')
			harpoon:setup({ settings = {
				key = function()
					return vim.loop.cwd()
				end,
			} })

			vim.keymap.set('n', '<leader>a', function()
				harpoon:list():append()
			end)

			vim.keymap.set('n', '<leader>e', function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set('n', '<A-h>', function()
				harpoon:list():select(1)
			end)
			vim.keymap.set('n', '<A-j>', function()
				harpoon:list():select(2)
			end)
			vim.keymap.set('n', '<A-k>', function()
				harpoon:list():select(3)
			end)
			vim.keymap.set('n', '<A-l>', function()
				harpoon:list():select(4)
			end)

			harpoon:extend({
				UI_CREATE = function(cx)
					vim.keymap.set('n', '<C-v>', function()
						harpoon.ui:select_menu_item({ vsplit = true })
					end, { buffer = cx.bufnr })

					vim.keymap.set('n', '<C-x>', function()
						harpoon.ui:select_menu_item({ split = true })
					end, { buffer = cx.bufnr })
				end,
			})
		end,
	},
}
