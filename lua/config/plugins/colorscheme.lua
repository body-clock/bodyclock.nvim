---@diagnostic disable: missing-fields
return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = ...,
		config = function()
			require("gruvbox").setup({
				overrides = {
					-- Overriding some default Telescope colors to avoid boring white borders, yay purple!
					-- TelescopeNormal = { link = "GruvboxFg1" },
					TelescopeSelection = { link = "GruvboxPurple" }, -- Default GruvboxOrangeBold
					-- TelescopeSelectionCaret = { link = "GruvboxRed" },
					-- TelescopeMultiSelection = { link = "GruvboxGray" },
					TelescopeBorder = { link = "GruvboxPurple" }, -- default TelescopeNormal
					TelescopePromptBorder = { link = "GruvboxPurple" }, -- default TelescopeNormal
					TelescopeResultsBorder = { link = "GruvboxPurple" }, -- default TelescopeNormal
					TelescopePreviewBorder = { link = "GruvboxPurple" }, -- default TelescopeNormal
					-- TelescopeMatching = { link = "GruvboxBlue" }, -- default GruvboxBlue
				},
			})
			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
