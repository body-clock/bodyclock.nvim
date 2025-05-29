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
					},
				},
			},
		},
		config = function()
			local servers = {
				ruby_lsp = {},
				stimulus_ls = {},
				ts_ls = {},
				marksman = {},
				lua_ls = {},
				harper_ls = {
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
				},
				yamlls = {},
				emmet_language_server = {},
				tailwindcss = {},
				biome = {},
			}

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

			for server, opts in pairs(servers) do
				vim.lsp.enable(server)
				opts.capabilities = capabilities
				vim.lsp.config(server, opts)
			end
		end,
	},
}
