return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
						{ "nvim-dap-ui" },
					},
				},
			},
		},
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

			local lspconfig = require("lspconfig")

			-- lspconfig.ruby_lsp.setup({
			-- 	capabilities = capabilities,
			-- 	init_options = {
			-- 		formatter = "rubocop",
			-- 		linters = { "rubocop" },
			-- 	},
			-- })
			lspconfig.stimulus_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.harper_ls.setup({
				capabilities = capabilities,
				settings = {
					["harper-ls"] = {
						linters = {
							SpellCheck = true,
							SentenceCapitalization = false,
							LongSentences = false,
							ToDoHyphen = false,
						},
					},
				},
			})
			lspconfig.yamlls.setup({
				capabilities = capabilities,
			})
			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
		end,
	},
}
