local dict = require('cmp_dictionary')

dict.setup({
	exact = 2,
	first_case_insensitive = false,
	document = false,
	document_command = 'wn %s -over',
	sqlite = false,
	max_items = -1,
	capacity = 5,
	debug = false,
})

dict.switcher({
	spelllang = {
		en = '~/.local/share/nvim/dictionary/english.dict',
		id = '~/.local/share/nvim/dictionary/indonesian.dict',
	},
})
