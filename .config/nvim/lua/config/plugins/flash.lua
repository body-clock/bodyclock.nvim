require("flash").setup({
	modes = {
		char = { enabled = false },
	},
})

vim.keymap.set({ "n", "x", "o" }, "gs", function() require("flash").jump() end, { desc = "Flash" })
