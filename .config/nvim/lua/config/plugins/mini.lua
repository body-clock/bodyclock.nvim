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
			require("mini.indentscope").setup({
				draw = {
					delay = 0,
					animation = require("mini.indentscope").gen_animation.none(),
				},
			})
			require("mini.notify").setup({})
			require("mini.icons").setup({})
			require("mini.statusline").setup({})
		end,
	},
}
