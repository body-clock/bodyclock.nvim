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
			{ "vim-ruby/vim-ruby" },
			{ "tpope/vim-rails" },
		},
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

			local lspconfig = require("lspconfig")

			lspconfig.ruby_lsp.setup({
				capabilities = capabilities,
				mason = false,
				-- I'm not really sure whether to use the local ruby-lsp shim or have it
				-- auto detect the version installed in my local ruby installation. I'm keeping
				-- it here so I can make the decision later.
				-- cmd = { "~/.local/share/mise/shims/ruby-lsp" },
			})
			lspconfig.rubocop.setup({
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
			lspconfig.stimulus_ls.setup({
				capabilities = capabilities,
			})
		end,
	},
}
