return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"debugloop/telescope-undo.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
			defaults = require("telescope.themes").get_ivy(),
			pickers = {
				find_files = {
					hidden = true,
				},
				colorscheme = {
					enable_preview = true,
				},
			},
		})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("undo")
	end,
}
