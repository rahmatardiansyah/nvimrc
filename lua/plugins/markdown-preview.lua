local opts = { silent = true }
return {
	'iamcco/markdown-preview.nvim',
	cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
	build = 'cd app && npm install',
	ft = { 'markdown' },
	config = function()
		vim.keymap.set('n', '<leader>zp', ':MarkdownPreviewToggle<CR>')
	end,
}
