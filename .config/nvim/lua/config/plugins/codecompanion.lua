return {
	"olimorris/codecompanion.nvim",
	config = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		adapters = {
			copilot = function()
				return require("codecompanion.adapters").extend("copilot", {
					schema = {
						model = { default = "claude-3.7-sonnet" },
					},
				})
			end,
		},
		prompt_library = {
			["Generate a Commit Message"] = {
				strategy = "chat",
				description = "Generate a commit message",
				opts = {
					index = 10,
					is_default = true,
					is_slash_cmd = true,
					short_name = "commit",
					auto_submit = true,
				},
				prompts = {
					{
						role = "user",
						content = function()
							return string.format(
								[[You are an expert at generating concise commit messages. They should be one or two sentences, but descriptive enough that they are informative. Given the git diff listed below, please generate a commit message for me:

```diff
%s
```
]],
								vim.fn.system("git diff --no-ext-diff --staged")
							)
						end,
						opts = {
							contains_code = true,
						},
					},
				},
			},
		},
	},
}
