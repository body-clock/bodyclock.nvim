return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

			vim.lsp.config("*", { capabilities = capabilities })

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
		end,
	},
}
