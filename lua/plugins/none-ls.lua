return {
  enabled = true,
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require('null-ls')
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    local excluded_folders = {}

    local function is_excluded_folder()
      local current_dir = vim.fn.getcwd()
      for _, folder in ipairs(excluded_folders) do
        if current_dir == folder then
          return true
        end
      end
      return false
    end

    local sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.nixfmt,
    }

    if not is_excluded_folder() then
      table.insert(
        sources,
        null_ls.builtins.formatting.prettierd.with({
          extra_filetypes = { 'astro' },
        })
      )
    end

    null_ls.setup({
      sources = sources,
      on_attach = function(client, bufnr) -- format on save
        if client.supports_method('textDocument/formatting') then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end
      end,
    })
  end,
}
