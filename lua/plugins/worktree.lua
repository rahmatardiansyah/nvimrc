return {
	'ThePrimeagen/git-worktree.nvim',
	config = function()
		local Worktree = require('git-worktree')
		Worktree.setup()
		require('telescope').load_extension('git_worktree')

		Worktree.on_tree_change(function(op, metadata)
			if op == Worktree.Operations.Switch then
				local path_segments = {}
				for segment in metadata.path:gmatch('[^/]+') do
					table.insert(path_segments, segment)
				end
				local last_segment = path_segments[#path_segments]
				print('Switched to ' .. last_segment)
			end
		end)
	end,

	keys = {
		{
			'<leader>ga',
			function()
				require('telescope').extensions.git_worktree.create_git_worktree()
			end,
			desc = 'Create git worktree',
		},
		{
			'<leader>ge',
			function()
				require('telescope').extensions.git_worktree.git_worktrees()
			end,
			desc = 'List, change branch, delete git worktree',
		},
	},
}
