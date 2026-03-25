return {
	"folke/flash.nvim",
	event = "VeryLazy",
	keys = {
		{ "gs", function() require("flash").jump() end, mode = { "n", "x", "o" }, desc = "Flash" },
	},
	opts = {
		modes = {
			char = {
				enabled = false,
			},
		},
	},
}
