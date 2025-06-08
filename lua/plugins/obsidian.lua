return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  cmd = 'ObsidianToday',
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'brain-hub',
        path = '~/brain-hub',
      },
    },

    daily_notes = {
      folder = '01. Daily Notes',
      date_format = '%Y-%m-%d',
      template = '~/brain-hub/Templates/Daily.md',
    },

    templates = {
      folder = 'Templates',
    },

    notes_subdir = '02. Reference Notes/Topics',

    new_notes_location = 'notes_subdir',

    note_id_func = function(title)
      return title
    end,

    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    mappings = {
      ['<cr>'] = {
        action = function()
          return require('obsidian').util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },

    disable_frontmatter = true,
    open_app_foreground = false,

    picker = {
      name = 'telescope.nvim',
      note_mappings = {
        new = '<C-x>',
        insert_link = '<C-l>',
      },
      tag_mappings = {
        tag_note = '<C-x>',
        insert_tag = '<C-l>',
      },
    },
    ui = {
      enable = true,
      update_debounce = 200,
      max_file_length = 5000,
      checkboxes = {
        [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
        ['x'] = { char = '', hl_group = 'ObsidianDone' },
      },
      bullets = { char = '•', hl_group = 'ObsidianBullet' },
      external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' },
      reference_text = { hl_group = 'ObsidianRefText' },
      highlight_text = { hl_group = 'ObsidianHighlightText' },
      tags = { hl_group = 'ObsidianTag' },
      block_ids = { hl_group = 'ObsidianBlockID' },
      hl_groups = {
        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
        ObsidianTodo = { bold = true, fg = '#f78c6c' },
        ObsidianDone = { bold = true, fg = '#89ddff' },
        ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
        ObsidianTilde = { bold = true, fg = '#ff5370' },
        ObsidianImportant = { bold = true, fg = '#d73128' },
        ObsidianBullet = { bold = true, fg = '#89ddff' },
        ObsidianRefText = { underline = true, fg = '#c792ea' },
        ObsidianExtLinkIcon = { fg = '#c792ea' },
        ObsidianTag = { italic = true, fg = '#89ddff' },
        ObsidianBlockID = { italic = true, fg = '#89ddff' },
        ObsidianHighlightText = { bg = '#75662e' },
      },
    },
  },
  keys = {
    {
      '<leader>oo',
      '<cmd>ObsidianOpen<CR>',
      desc = 'Open with Obsidian',
    },
    {
      '<leader>on',
      '<cmd>ObsidianNew<CR>',
      desc = 'New Obsidian Note',
    },
    {
      '<leader>od',
      '<cmd>ObsidianToday<CR>',
      desc = "Open Today's Daily Note",
    },
    {
      '<leader>ot',
      '<cmd>ObsidianTomorrow<CR>',
      desc = "Open Tomorrow's Daily Note",
    },
    {
      '<leader>oy',
      '<cmd>ObsidianYesterday<CR>',
      desc = "Open Yesterday's Daily Note",
    },
    {
      '<leader>oft',
      '<cmd>ObsidianTags<CR>',
      desc = 'Search for tags in notes',
    },
    {
      '<leader>off',
      '<cmd>ObsidianQuickSwitch<CR>',
      desc = 'Quickly switch to a note',
    },
    {
      '<leader>ofs',
      '<cmd>ObsidianSearch<CR>',
      desc = 'Search word in notes',
    },
    {
      '<leader>or',
      '<cmd>ObsidianRename<CR>',
      desc = 'Rename current note',
    },
    {
      '<leader>oh',
      '<cmd>ObsidianTOC<CR>',
      desc = 'Go to Header',
    },
  },
}
