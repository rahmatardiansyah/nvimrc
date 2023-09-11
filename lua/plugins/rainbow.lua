local rainbow_delimiters = require('rainbow-delimiters')

vim.g.rainbow_delimiters = {
	highlight = {
		'RainbowDelimiterRed',
		'RainbowDelimiterYellow',
		'RainbowDelimiterBlue',
		'RainbowDelimiterOrange',
		'RainbowDelimiterGreen',
		'RainbowDelimiterViolet',
		'RainbowDelimiterCyan',
	},
}

vim.cmd('highlight! RainbowDelimiterRed guibg=NONE guifg=#E06C75')
vim.cmd('highlight! RainbowDelimiterYellow guibg=NONE guifg=#EDD4A6')
vim.cmd('highlight! RainbowDelimiterBlue guibg=NONE guifg=#61AFEF')
vim.cmd('highlight! RainbowDelimiterOrange guibg=NONE guifg=#E5C07B')
vim.cmd('highlight! RainbowDelimiterGreen guibg=NONE guifg=#98C379')
vim.cmd('highlight! RainbowDelimiterViolet guibg=NONE guifg=#C678DD')
vim.cmd('highlight! RainbowDelimiterCyan guibg=NONE guifg=#56B6C2')
