return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown" },
	cmd = { "RenderMarkdown" },
	keys = {
		{ "<leader>md", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle Markdown rendering" },
	},
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
	opts = {},
}
