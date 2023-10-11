local opts = { silent = true }
return {
	{
		'ThePrimeagen/harpoon',
		config = function()
			vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#5C6370')
			vim.cmd('highlight! HarpoonActive guibg=NONE guifg=#ABB2BF')
			vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#61AFEF')
			vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#ABB2BF')
			vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

			require('harpoon').setup({
				tabline = true,
				enter_on_sendcmd = true,
				menu = {
					width = vim.api.nvim_win_get_width(0) - 20,
				},
			})
		end,
		keys = {
			{
				'<leader>a',
				function()
					require('harpoon.mark').add_file()
				end,
				desc = 'Add harpoon mark',
				opts,
			},
			{
				'<leader>e',
				function()
					require('harpoon.ui').toggle_quick_menu()
				end,
				desc = 'Harpoon toogle quick menu',
				opts,
			},
			{
				'<A-h>',
				function()
					require('harpoon.ui').nav_file(1)
				end,
				opts,
			},
			{
				'<A-j>',
				function()
					require('harpoon.ui').nav_file(2)
				end,
				opts,
			},
			{
				'<A-k>',
				function()
					require('harpoon.ui').nav_file(3)
				end,
				opts,
			},
			{
				'<A-l>',
				function()
					require('harpoon.ui').nav_file(4)
				end,
				opts,
			},
			{
				'<A-H>',
				function()
					require('harpoon.ui').nav_file(5)
				end,
				opts,
			},
			{
				'<A-J>',
				function()
					require('harpoon.ui').nav_file(6)
				end,
				opts,
			},
			{
				'<A-K>',
				function()
					require('harpoon.ui').nav_file(7)
				end,
				opts,
			},
			{
				'<A-L>',
				function()
					require('harpoon.ui').nav_file(8)
				end,
				opts,
			},
			{
				'<A-f>',
				function()
					require('harpoon.tmux').gotoTerminal(1)
					require('harpoon.tmux').sendCommand(1, 'tmux-sessionizer.sh\n')
				end,
				opts,
			},
		},
	},
}
