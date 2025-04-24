return {
	"HiPhish/rainbow-delimiters.nvim",
	config = function()
		require("rainbow-delimiters.setup").setup({
			highlight = {
				-- tinted_colors (with tinted-nvim):
				-- "rainbowcol1",
				-- "rainbowcol2",
				-- "rainbowcol3",
				-- "rainbowcol4",
				-- "rainbowcol5",
				-- "rainbowcol6",
				-- "rainbowcol7",
				-- tinted_colors (with tinted-vim):
				"tinted_gui08", -- bright red
				"tinted_gui0A", -- bright yellow
				"tinted_gui0D", -- bright blue
				"tinted_gui09", -- orange
				"tinted_gui0B", -- bright green
				"tinted_gui0E", -- bright purple
				"tinted_gui0C", -- bright cyan
			},
		})
	end,
}
