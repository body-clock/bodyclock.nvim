return {
	{
		"craftzdog/solarized-osaka.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd.colorscheme "solarized-osaka"
		end
	},
	{
		"rose-pine/neovim",
		enabled = false,
		name = "rose-pine",
		config = function()
			require("rose-pine").setup {
				variant = "main",
			}
			vim.cmd.colorscheme "rose-pine"
		end
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000 ,
		opts = ...,
		config = function()
			vim.cmd.colorscheme "gruvbox"
		end
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd.colorscheme "tokyonight"
		end
	}
}
