return {
  enabled = true,
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'windwp/nvim-ts-autotag',
  },
  cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'lua',
        'vim',
        'nix',
        'bash',
        'html',
        'css',
        'scss',
        'javascript',
        'markdown',
        'markdown_inline',
        'c',
        'astro',
        'jsdoc',
        'typescript',
      },
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'markdown' },
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
        enable_close_on_tag = false,
      },
    })
  end,
  vim.filetype.add({
    extension = {
      mdx = 'markdown.mdx',
      mdoc = 'markdown.mdoc',
    },
    filename = {},
    pattern = {},
  }),
}
