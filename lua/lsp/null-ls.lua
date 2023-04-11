local null_ls = require("null-ls")

require("mason-null-ls").setup({
	ensure_installed = { "prettier", "latexindent" , "rnix-lsp" },
	autocomplete = true,
	automatic_setup = true,
})

require("null-ls").setup({
    sources = {
      null_ls.builtins.formatting.nixfmt,
      null_ls.builtins.formatting.stylua,
    }
})

null_ls.setup({
	debug = true,
})
