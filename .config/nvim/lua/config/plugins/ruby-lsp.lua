return {
	-- "adam12/ruby-lsp.nvim",
	dir = "~/code/p/ruby-lsp.nvim",
	enabled = false,
	-- branch = "ruby-lsp-logs",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
	},
	config = true,
	opts = {
		lspconfig = {
			formatter = "rubocop",
			linters = { "rubocop" },
		},
	},
}
