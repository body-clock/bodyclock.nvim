return {
	{
		"rose-pine/neovim",
		-- enabled = false,
		name = "rose-pine",
		config = function()
			require("rose-pine").setup {
				variant = "main",
			}
			vim.cmd.colorscheme "rose-pine"
		end
	},
}
