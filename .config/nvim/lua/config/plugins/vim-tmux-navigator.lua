return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
		"TmuxNavigatorProcessList",
	},
	keys = {
		{ "<c-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Move left (tmux/vim)" },
		{ "<c-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Move down (tmux/vim)" },
		{ "<c-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Move up (tmux/vim)" },
		{ "<c-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Move right (tmux/vim)" },
		{ "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Move to previous (tmux/vim)" },
	},
}
