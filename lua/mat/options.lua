local api = vim.api

vim.g.t_co = "xterm-256color"
vim.g.background = "dark"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.clipboard = "unnamedplus"

-- keep with block shape cursor
vim.opt.guicursor = "n-v-c:block"

-- Better Netrw
vim.g.netrw_banner = 0 -- Hide banner
vim.g.netrw_lifestyle = 3 -- Hide banner

-- go to last loc when opening a buffer
api.nvim_create_autocmd(
"BufReadPost",
{ command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)

-- api.nvim_create_autocmd(
-- "BufWritePost",
-- { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
-- )

-- apply xresources file on save
vim.cmd [[
    augroup xresources
    autocmd!
    autocmd BufWritePost .Xresources !xrdb -load ~/.Xresources
    augroup end
]]

