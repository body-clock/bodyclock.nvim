MiniDeps.later(function()
	MiniDeps.add("folke/flash.nvim")
	require("flash").setup({
		modes = {
			char = { enabled = false },
		},
	})
end)
