return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function() require("conform").format({ async = true, lsp_format = "fallback" }) end,
			mode = { "n", "v" },
			desc = "Format current file",
		},
	},
	opts = {
		formatters = {
			erb_lint = {
				stdin = false,
				tmpfile_format = ".conform.$RANDOM.$FILENAME",
				command = "erb_lint",
				args = { "--autocorrect", "$FILENAME" },
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			ruby = { "rubocop" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			css = { "prettier" },
		},
	},
}
