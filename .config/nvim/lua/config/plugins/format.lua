return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			ruby = { "rubocop" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			eruby = { "erb_format" }
		},
	},
}
