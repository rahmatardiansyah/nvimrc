local Worktree = require('git-worktree')
Worktree.setup()
require('telescope').load_extension('git_worktree')

Worktree.on_tree_change(function(op, metadata)
	if op == Worktree.Operations.Switch then
		print('Switched from ' .. metadata.prev_path .. ' to ' .. metadata.path)
	end
end)

vim.keymap.set('n', '<leader>ge', '<CMD>lua require("telescope").extensions.git_worktree.git_worktrees()<CR>')
vim.keymap.set('n', '<leader>ga', '<CMD>lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>')
