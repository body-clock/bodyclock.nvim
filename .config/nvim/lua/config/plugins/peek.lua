return {
	"toppair/peek.nvim",
	event = { "VeryLazy" },
	build = "deno task --quiet build:fast",
	keys = {
		{ "<leader>po", function() require("peek").open() end, desc = "Open markdown preview" },
		{ "<leader>pc", function() require("peek").close() end, desc = "Close markdown preview" },
	},
	config = function()
		require("peek").setup()
		vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
		vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
	end,
}
