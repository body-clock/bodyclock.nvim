require("peek").setup()

vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

vim.keymap.set("n", "<leader>po", function() require("peek").open() end, { desc = "Open markdown preview" })
vim.keymap.set("n", "<leader>pc", function() require("peek").close() end, { desc = "Close markdown preview" })
