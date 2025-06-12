return {
  enabled = false,
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        file_ignore_patterns = { '%.jpeg', '%.png', '%.jpg', 'node_modules/.*', '%.mp4', '%.mkv', '%.avi', '%.webm' },
        layout_config = {
          horizontal = {
            width = 0.9,
            preview_cutoff = 0,
          },
        },
        mappings = {
          i = {
            ['<C-k>'] = actions.cycle_history_prev,
            ['<C-j>'] = actions.cycle_history_next,
          },
        },
      },
    })
  end,
  keys = {
    {
      '<leader>ff',
      function()
        require('telescope.builtin').find_files()
      end,
    },
    {
      '<leader>fs',
      function()
        require('telescope.builtin').live_grep()
      end,
    },
  },
}
