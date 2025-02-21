return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({})
			require("mini.surround").setup({})
			require("mini.pairs").setup({})
			require("mini.sessions").setup({
				autoread = true,
				autowrite = true,
			})
		end,
	},
}
