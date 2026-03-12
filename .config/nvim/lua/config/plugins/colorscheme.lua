return {
	{
		"tinted-theming/tinted-nvim",
		dependencies = { "rktjmp/fwatch.nvim" },
		config = function()
			vim.o.termguicolors = true
			vim.g.tinted_colorspace = 256
			require("tinted-colorscheme").setup(nil, {
				supports = { live_reload = true },
			})
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
