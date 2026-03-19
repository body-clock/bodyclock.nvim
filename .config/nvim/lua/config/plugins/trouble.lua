MiniDeps.later(function()
	MiniDeps.add("folke/trouble.nvim")
	require("trouble").setup({
		modes = {
			diagnostics_buffer = {
				mode = "diagnostics",
				filter = { buf = 0 },
			},
		},
	})
end)
