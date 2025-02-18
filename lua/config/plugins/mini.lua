return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.pairs").setup({})
			require("mini.sessions").setup({
				autoread = true,
				autowrite = true,
			})
		end,
	},
}
