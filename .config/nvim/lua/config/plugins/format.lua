return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
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
			javascript = { "prettierd", "prettier", stop_after_first = true },
			-- requires a local .erb_lint.yml config file
			eruby = { "erb_lint", "erb_format", stop_after_first = true },
		},
	},
}
