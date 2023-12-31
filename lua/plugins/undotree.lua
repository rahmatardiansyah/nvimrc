local opts = { silent = true }
return {
	enabled = true,
	'mbbill/undotree',
	config = function()
		vim.g.undotree_WindowLayout = 3
		vim.g.undotree_HelpLine = 0
	end,
	keys = {
		{
			'<leader>u',
			':UndotreeToggle<CR>',
			opts,
		},
	},
}
