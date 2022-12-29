require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "html", "css", "javascript", "lua", "c", "diff"},
  sync_install = false,
  auto_install = true,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, 
    extended_mode = true,
    max_file_lines = nil,
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
