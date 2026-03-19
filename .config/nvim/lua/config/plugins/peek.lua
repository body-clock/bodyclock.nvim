MiniDeps.later(function()
	MiniDeps.add({
		source = "toppair/peek.nvim",
		hooks = {
			post_install = function(params)
				vim.fn.system({ "deno", "task", "--quiet", "build:fast" })
			end,
			post_checkout = function(params)
				vim.fn.system({ "deno", "task", "--quiet", "build:fast" })
			end,
		},
	})
	require("peek").setup()
	vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
	vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
end)
