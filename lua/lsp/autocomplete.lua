local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("i", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>")
map("i", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>")
map("s", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>")
map("s", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>")

