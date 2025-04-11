return {
	"folke/trouble.nvim",
	opts = {
		modes = {
			diagnostics_buffer = {
				mode = "diagnostics", -- inherit from diagnostics mode
				filter = { buf = 0 }, -- filter diagnostics to the current buffer
			},
		},
	}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
}
