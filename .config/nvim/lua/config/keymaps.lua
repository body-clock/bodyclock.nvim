-- Execute current line/file, useful for testing keybinds and settings
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "Source current line" })
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "Source visual selection" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight on search" })

-- Quickfix list
vim.keymap.set("n", "<leader>co", ":copen<CR>", { desc = "Open Quickfix list" })
vim.keymap.set("n", "<leader>cc", ":cclose<CR>", { desc = "Close Quickfix list" })
vim.keymap.set("n", "<leader>cn", ":cnext<CR>", { desc = "Next Quickfix list" })
vim.keymap.set("n", "<leader>cp", ":cprev<CR>", { desc = "Previous Quickfix list" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { desc = "Previous buffer" })

-- Center cursor when page navigating
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up half page and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down half page and center" })

-- Plenary test runner
vim.keymap.set("n", "<leader>tf", "<cmd>PlenaryBustedFile %<cr>", { desc = "Run current test file with Plenary" })
