MiniDeps.later(function()
	MiniDeps.add("stevearc/conform.nvim")
	require("conform").setup({
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
	})
end)
