-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------
local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
	group = 'YankHighlight',
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
	end,
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
	pattern = '',
	command = 'set fo-=c fo-=r fo-=o',
})

-- Disable line length marker
augroup('setLineLength', { clear = true })
autocmd('Filetype', {
	group = 'setLineLength',
	pattern = { 'text', 'markdown', 'html', 'tex' },
	command = 'setlocal cc=0',
})

-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
	group = 'setIndent',
	pattern = { 'html', 'css', 'lua' },
	command = 'setlocal shiftwidth=2 tabstop=2',
})

vim.cmd([[
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction

vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
]])
