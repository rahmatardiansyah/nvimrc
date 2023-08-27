local ft = require('guard.filetype')

ft('typescript,javascript,typescriptreact,javascriptreact'):fmt('prettier')
ft('lua'):fmt('stylua')

-- LAST!
require('guard').setup({
	fmt_on_save = true,
	lsp_as_default_formatter = false,
})
