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
			local servers = {
				-- BUNDLE_IGNORE_CONFIG prevents ruby-lsp from being confused by
				-- .bundle/config in vagrant projects (e.g. vendor/bundle paths).
				-- Safe for normal projects which don't have a .bundle/config.
				ruby_lsp = {
					cmd = { "env", "BUNDLE_IGNORE_CONFIG=1", "ruby-lsp" },
				},
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
				mdx_analyzer = {},
				herb = {},
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
