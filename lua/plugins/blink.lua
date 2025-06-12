return {
  { 'L3MON4D3/LuaSnip', keys = {} },
  {
    'saghen/blink.cmp',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    version = '*',
    config = function()
      require('blink.cmp').setup({
        snippets = { preset = 'luasnip' },
        appearance = {
          use_nvim_cmp_as_default = false,
          nerd_font_variant = 'normal',
        },
        sources = {
          default = { 'snippets', 'lsp', 'path', 'buffer' },
        },
        completion = {
          menu = {
            border = 'single',
            draw = {
              columns = {
                { 'kind_icon' },
                { 'label',      'label_description' },
                { 'kind' },
                { 'source_name' },
              },
            },
          },
          documentation = { window = { border = 'single' } },
        },
        signature = { window = { border = 'single' } },
      })
    end,
  },
}
