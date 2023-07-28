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
    disable = { },
    enable = true,
  },
}
