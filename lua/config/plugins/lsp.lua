return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				-- this sets up some basic stuff, like letting the lsp know about 'vim' globals
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local set = require("lspconfig")
			set.lua_ls.setup {}
			set.ruby_lsp.setup {}
			set.rubocop.setup {}
		end,
	}
}

