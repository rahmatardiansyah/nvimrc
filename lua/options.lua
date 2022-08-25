-- Ui
vim.opt.encoding = "utf-8"
vim.opt.errorbells = false
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8"
vim.opt.hidden = true
vim.opt.mouse = "a"
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.number = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.background = "dark"
vim.wo.colorcolumn = "100"
vim.opt.wrap = false

-- Search
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Indent
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.clipboard = "unnamedplus"
vim.opt.autoindent = true
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.visualbell = false
vim.opt.writebackup = false

-- disable distribution plugins
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_matchit = 1
-- vim.g.loaded_matchparen = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwfilehandlers = 1
