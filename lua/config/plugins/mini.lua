return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.pick").setup({})
			require("mini.pairs").setup({})
			require("mini.sessions").setup({
				autoread = true,
				autowrite = true
			})
		end,
	},
}
