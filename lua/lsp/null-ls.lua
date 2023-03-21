local null_ls = require("null-ls")

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "prettier", "latexindent" },
	autocomplete = true,
	automatic_setup = true,
})

require("null-ls").setup({
    sources = {
      null_ls.builtins.formatting.nixfmt,
    }
})

require("mason-null-ls").setup_handlers()

null_ls.setup({
	debug = true,
})
