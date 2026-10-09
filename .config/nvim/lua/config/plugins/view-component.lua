return {
	-- "body-clock/view-component.nvim",
	-- for development
	dir = "~/code/p/view-component.nvim/",
	keys = {
		{ "<leader>vc", function() require("view-component").switch() end, desc = "Switch view component" },
	},
}
