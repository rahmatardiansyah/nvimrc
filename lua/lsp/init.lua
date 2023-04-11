local lsp = require("lsp-zero").preset({
	name = "minimal",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

lsp.ensure_installed({
  'tsserver',
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "✘",
		warn = "▲",
		hint = "⚑",
		info = "",
	},
})

lsp.nvim_workspace()

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr }
	local bind = vim.keymap.set

	bind("n", "<leader>w", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
end)

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

require("lspconfig").lua_ls.setup({
	on_attach = function(client, bufnr)
		print("lua_ls running")
	end,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

lsp.setup()

require("lsp/autocomplete")
require("lsp/null-ls")
