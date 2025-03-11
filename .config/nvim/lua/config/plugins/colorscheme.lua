---@diagnostic disable: missing-fields
return {
	{
		"tinted-theming/tinted-vim",
		config = function()
			vim.cmd.colorscheme("base16-tarot")
			-- vim.cmd.colorscheme('base16-black-metal')
		end,
	},
}
