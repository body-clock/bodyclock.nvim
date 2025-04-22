return {
	"HiPhish/rainbow-delimiters.nvim",
	config = function()
		require("rainbow-delimiters.setup").setup({
			highlight = {
				-- tinted_colors:
				"rainbowcol1",
				"rainbowcol2",
				"rainbowcol3",
				"rainbowcol4",
				"rainbowcol5",
				"rainbowcol6",
				"rainbowcol7",
			},
		})
	end,
}
