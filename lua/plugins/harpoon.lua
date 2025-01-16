return {
  'MeanderingProgrammer/harpoon-core.nvim',
  config = function()
    local harpoon = require('harpoon-core')
    local mark = require('harpoon-core.mark')
    local ui = require('harpoon-core.ui')

    harpoon.setup({
      -- Make existing window active rather than creating a new window
      use_existing = true,
      -- Default action when opening a mark, defaults to current window
      -- Example: 'vs' will open in new vertical split, 'tabnew' will open in new tab
      default_action = nil,
      -- Set marks specific to each git branch inside git repository
      mark_branch = false,
      -- Use the previous cursor position of marked files when opened
      use_cursor = true,
      -- Settings for popup window
      menu = { width = 60, height = 10 },
      -- Controls confirmation when deleting mark in telescope
      delete_confirmation = true,
    })

    vim.keymap.set('n', '<leader>a', function()
      mark.add_file()
    end)

    vim.keymap.set('n', '<leader>e', function()
      ui.toggle_quick_menu()
    end)

    vim.keymap.set('n', '<A-h>', function()
      ui.nav_file(1)
    end)
    vim.keymap.set('n', '<A-j>', function()
      ui.nav_file(2)
    end)
    vim.keymap.set('n', '<A-k>', function()
      ui.nav_file(3)
    end)
    vim.keymap.set('n', '<A-l>', function()
      ui.nav_file(4)
    end)
  end,
}
