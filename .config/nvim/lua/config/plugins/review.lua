return {
	"georgeguimaraes/review.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		"esmuellert/codediff.nvim",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>rr", "<cmd>Review<cr>", desc = "Review working tree" },
		{ "<leader>rb", "<cmd>Review branch<cr>", desc = "Review branch vs base" },
		{ "<leader>rB", ":Review branch ", desc = "Review branch (type TARGET [BASE])" },
		{ "<leader>rl", "<cmd>Review commits<cr>", desc = "Review commits" },
		{ "<leader>ra", ":Review note<cr>", mode = { "n", "v" }, desc = "Review: comment here" },
		{ "<leader>ro", "<cmd>Review edit<cr>", desc = "Review: edit comment" },
		{ "<leader>rD", "<cmd>Review delete<cr>", desc = "Review: delete comment" },
		{ "<leader>rx", "<cmd>Review export<cr>", desc = "Review: export markdown" },
	},
	opts = {
		branch = {
			-- base for :Review branch. nil resolves origin/HEAD, then main, then master.
			-- put a ref here to pin it globally, or pass BASE per invocation.
			base = nil,
		},
		-- hand the exported markdown to an agent without touching the clipboard
		export = {
			on_export = function(markdown)
				vim.fn.writefile(vim.split(markdown, "\n"), "/tmp/nvim-review.md")
			end,
		},
	},
}
