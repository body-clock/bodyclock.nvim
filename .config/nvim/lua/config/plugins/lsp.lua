require("mason").setup()

-- lazydev provides neovim API type annotations for Lua LSP completions
require("lazydev").setup({
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

vim.lsp.config("*", { capabilities = capabilities })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local buf = args.buf
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "Hover LSP information" })
		vim.keymap.set("n", "gd", function()
			require("mini.extra").pickers.lsp({ scope = "definition" })
		end, { buffer = buf, desc = "[g]o to [d]efinition" })
		vim.keymap.set("n", "gr", function()
			require("mini.extra").pickers.lsp({ scope = "references" })
		end, { buffer = buf, desc = "[g]o to [r]eference" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, desc = "Code action" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf, desc = "Rename under cursor" })
	end,
})

vim.lsp.enable({
	"ruby_lsp",
	"stimulus_ls",
	"ts_ls",
	"marksman",
	"lua_ls",
	"harper_ls",
	"yamlls",
	"emmet_language_server",
	"tailwindcss",
	"biome",
	"mdx_analyzer",
	"herb",
})
