return {
	"stevearc/oil.nvim",
	keys = {
		{ "-", "<cmd>Oil<cr>", desc = "Open oil file browser" },
	},
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
		})
	end,
}
