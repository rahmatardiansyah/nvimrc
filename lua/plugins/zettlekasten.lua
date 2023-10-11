return {
	enabled = false,
	'Furkanzmc/zettelkasten.nvim',
	config = function()
		require('zettelkasten').setup({
			notes_path = vim.fn.expand('~') .. '/Documents/zk/notes',
			id_format = '%Y%m%d%H%M%S',
			browseformat = '%f %h %t %d',
			id_inference_location = 0,
			id_pattern = '%d+%d+%d+%d+%d+%d+',
			filename_pattern = '%d+%d+%d+%d+%d+%d.md',
			title_pattern = '# %d+%d+%d+%d+%d+%d+ .+',
		})
	end,
}
