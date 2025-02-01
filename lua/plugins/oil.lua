return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local oil = require('oil')

    local function get_open_cmd(path)
      if vim.fn.has('mac') == 1 then
        return { 'open', path }
      elseif vim.fn.has('win32') == 1 then
        if vim.fn.executable('rundll32') == 1 then
          return { 'rundll32', 'url.dll,FileProtocolHandler', path }
        else
          return nil, 'rundll32 not found'
        end
      elseif vim.fn.executable('explorer.exe') == 1 then
        return { 'explorer.exe', path }
      elseif vim.fn.executable('xdg-open') == 1 then
        return { 'xdg-open', path }
      else
        return nil, 'no handler found'
      end
    end

    oil.setup({
      default_file_explorer = true,
      columns = {
        'icon',
      },
      buf_options = {
        buflisted = false,
        bufhidden = 'hide',
      },
      win_options = {
        wrap = false,
        signcolumn = 'no',
        cursorcolumn = false,
        foldcolumn = '0',
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = 'nvic',
      },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = false,
      prompt_save_on_select_new_entry = true,
      cleanup_delay_ms = 2000,
      lsp_file_methods = {
        timeout_ms = 1000,
        autosave_changes = false,
      },
      constrain_cursor = 'editable',
      experimental_watch_for_changes = false,
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = {
          callback = function()
            local ignored_mime = { 'image/png', 'image/jpg', 'image/jpeg', 'image/gif', 'image/webp', 'video/*' }
            local entry = oil.get_cursor_entry()
            local file = vim.system({ 'file', '--mime-type', '-b', entry.name }, { text = true }):wait()

            local dir = oil.get_current_dir()

            local path = dir .. entry.name
            for _, mime in ipairs(ignored_mime) do
              if file.stdout:match(mime) then
                if vim.ui.open then
                  vim.ui.open(path)
                  return
                end

                local cmd, err = get_open_cmd(path)
                if not cmd then
                  vim.notify(string.format('Could not open %s: %s', path, err), vim.log.levels.ERROR)
                  return
                end
              end
            end

            oil.select()
          end,
        },
        ['<C-s>'] = 'actions.select_vsplit',
        ['<C-h>'] = 'actions.select_split',
        ['<C-t>'] = 'actions.select_tab',
        ['<C-p>'] = 'actions.preview',
        ['q'] = 'actions.close',
        ['<C-l>'] = 'actions.refresh',
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        ['`'] = 'actions.cd',
        ['~'] = 'actions.tcd',
        ['gs'] = 'actions.change_sort',
        ['gx'] = 'actions.open_external',
        ['g.'] = 'actions.toggle_hidden',
        ['g\\'] = 'actions.toggle_trash',
      },
      keymaps_help = {
        border = 'rounded',
      },
      use_default_keymaps = true,
      view_options = {
        show_hidden = true,
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, '.')
        end,
        is_always_hidden = function(name, bufnr)
          return false
        end,
        natural_order = true,
        sort = {
          { 'type', 'asc' },
          { 'name', 'asc' },
        },
      },
      float = {
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = 'rounded',
        win_options = {
          winblend = 0,
        },
        override = function(conf)
          return conf
        end,
      },
      preview = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = 0.9,
        min_height = { 5, 0.1 },
        height = nil,
        border = 'rounded',
        win_options = {
          winblend = 0,
        },
        update_on_cursor_moved = true,
      },
      progress = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = { 10, 0.9 },
        min_height = { 5, 0.1 },
        height = nil,
        border = 'rounded',
        minimized_border = 'none',
        win_options = {
          winblend = 0,
        },
      },
      ssh = {
        border = 'rounded',
      },
    })

    vim.keymap.set('n', '<leader>s', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
}
