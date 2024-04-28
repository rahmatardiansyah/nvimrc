return {
  'polarmutex/git-worktree.nvim',
  config = function()
    require('telescope').load_extension('git_worktree')

    vim.keymap.set('n', '<leader>ga', function()
      require('telescope').extensions.git_worktree.create_git_worktree()
    end)
    vim.keymap.set('n', '<leader>ge', function()
      require('telescope').extensions.git_worktree.git_worktrees()
    end)
  end,
}
