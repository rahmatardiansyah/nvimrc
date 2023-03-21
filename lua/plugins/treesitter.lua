-----------------------------------------------------------
-- Treesitter configuration file
-----------------------------------------------------------
local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

nvim_treesitter.setup {
  ensure_installed = { 'html', 'css', 'javascript', 'markdown', 'bash', 'c', 'latex', 'lua', 'nix' },
  sync_install = false,
  highlight = {
    disable = { "html" },
    enable = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" },
    extended_mode = true, -- Also highlight html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}
