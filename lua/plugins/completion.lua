return {
  enabled = true,
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'uga-rosa/cmp-dictionary' },
  },
  config = function()
    local lspconfig_defaults = require('lspconfig').util.default_config
    lspconfig_defaults.capabilities =
        vim.tbl_deep_extend('force', lspconfig_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())

    local cmp = require('cmp')

    cmp.setup({
      sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        fields = { 'abbr', 'menu', 'kind' },
      },
      experimental = {
        ghost_text = false,
      },
    })

    cmp.setup.filetype({ 'markdown', 'text' }, {
      sources = cmp.config.sources({
        { name = 'dictionary' },
      }),
    })

    require('cmp_dictionary').setup({
      paths = {
        '/home/rahmat/.local/share/nvim/dictionary/english.dict',
        '/home/rahmat/.local/share/nvim/dictionary/indonesian.dict',
      },
    })
  end,
}
