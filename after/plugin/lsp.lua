local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp.on_attach(function(client, brfnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

require("lspconfig").ts_ls.setup({
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "usr/local/lib/node_modules/@vue/typescript-plugin",
				languages = { "javascript", "typescript", "vue" },
			},
		},
	},
	filetypes = {
		"javascript",
		"typescript",
		"vue",
		"javascriptreact",
		"javascript.jsx",
		"typescriptreact",
		"typescript.tsx",
	},
})

require("lspconfig").cssls.setup({
	filetypes = { "css", "scss", "less", "vue" },
})

require("lspconfig").csharp_ls.setup({
	cmd = { "csharp-ls" },
	filetypes = {
		"cs",
		"razor",
		"csproj",
		"fs",
		"fsproj",
	},
})

require("lspconfig").bashls.setup({
	filetypes = { "sh", "smarty" },
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"eslint",
		"volar",
		"cssmodules_ls",
		"cssls",
		"lua_ls",
		"tailwindcss",
		"emmet_ls",
		"svelte",
		"html",
		"terraformls",
		"yamlls",
	},
	handlers = {
		lsp.default_setup,
	},
})

lsp.setup()
