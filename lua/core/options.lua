-- Variable
local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-- General
opt.mouse = 'a' -- Enable mouse support
opt.clipboard = 'unnamedplus' -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect' -- Autocomplete options

-- Neovim UI
opt.number = true -- Show line number
opt.relativenumber = true -- Set number to relative
opt.showmatch = false -- Highlight matching parenthesis
opt.foldmethod = 'marker' -- Enable folding (default 'foldmarker')
-- opt.colorcolumn = '100' -- Line lenght marker at 100 columns
opt.splitright = true -- Vertical split to the right
opt.splitbelow = true -- Horizontal split to the bottom
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern
opt.linebreak = true -- Wrap on word boundary
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.laststatus = 3 -- Set global statusline
opt.background = 'dark' -- set to dark mode

-- Tabs, indent
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

-- Memory, CPU
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event
opt.undodir = vim.fn.stdpath('data') .. '/undo'
opt.undofile = true
-- opt.shadafile = 'NONE' -- Remove mark 0-9

-- Startup
opt.shortmess:append('sI') -- Disable nvim intro
g.netrw_banner = 1 -- Hide banner (Bug if is off)
g.editorconfig = true -- check .editorconfig file
g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
