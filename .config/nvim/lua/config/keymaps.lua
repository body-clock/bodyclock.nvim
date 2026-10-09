-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight on search" })

-- Quickfix list
vim.keymap.set("n", "<leader>co", ":copen<CR>", { desc = "Open Quickfix list" })
vim.keymap.set("n", "<leader>cc", ":cclose<CR>", { desc = "Close Quickfix list" })
vim.keymap.set("n", "<leader>cn", ":cnext<CR>", { desc = "Next Quickfix list" })
vim.keymap.set("n", "<leader>cp", ":cprev<CR>", { desc = "Previous Quickfix list" })

-- Center cursor when page navigating
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up half page and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down half page and center" })
