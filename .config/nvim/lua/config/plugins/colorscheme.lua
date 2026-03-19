return {
	{
		"tinted-theming/tinted-nvim",
		priority = 1000,
		lazy = false,
		opts = {
			selector = {
				enabled = true,
				mode = "file",
				path = "~/.local/share/tinted-theming/tinty/current_scheme",
				watch = true,
			},
		},
		config = function(_, opts)
			vim.o.termguicolors = true
			require("tinted-nvim").setup(opts)
			-- Re-trigger ColorScheme on focus so plugins (gitsigns, transparent bg, etc.)
			-- stay in sync when tinty switches themes externally.
			vim.api.nvim_create_autocmd("FocusGained", {
				callback = function()
					vim.cmd("silent! doautocmd ColorScheme " .. (vim.g.colors_name or ""))
				end,
			})
		end,
	},
}
