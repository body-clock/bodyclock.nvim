-- Execute current line, useful for testing out keybinds and other settings
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "Source current line" })
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "Source visual selection" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight on search" })

-- Open Oil
vim.keymap.set("n", "-", require("oil").open, { desc = "Open oil file browser" })

-- Telescope mappings
vim.keymap.set("n", "<leader>sf", function()
	require("telescope.builtin").find_files()
end, { desc = "Find File" })
vim.keymap.set("n", "<leader>sg", function()
	require("telescope.builtin").live_grep()
end, { desc = "Find String" })
vim.keymap.set("n", "<leader>ls", function()
	require("telescope.builtin").buffers()
end, { desc = "Find Buffer" })
vim.keymap.set("n", "<leader>sh", function()
	require("telescope.builtin").help_tags()
end, { desc = "Find Help tags" })
vim.keymap.set("n", "<leader>sm", function()
	require("telescope.builtin").marks()
end, { desc = "Find Marks" })
vim.keymap.set("n", "<leader>sc", function()
	require("telescope.builtin").colorscheme()
end, { desc = "Find colorschemes" })

-- LSP (Some telescope)
vim.keymap.set("n", "gd", function()
	require("telescope.builtin").lsp_definitions()
end, { desc = "[g]o to [d]efinition" })
vim.keymap.set("n", "gr", function()
	require("telescope.builtin").lsp_references()
end, { desc = "[g]o to [r]eference" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover LSP information" })

-- Quickfix list
vim.keymap.set("n", "<leader>co", ":copen<CR>", { desc = "Open Quickfix list" })
vim.keymap.set("n", "<leader>cc", ":cclose<CR>", { desc = "Close Quickfix list" })
vim.keymap.set("n", "<leader>cn", ":cnext<CR>", { desc = "Next Quickfix list" })
vim.keymap.set("n", "<leader>cp", ":cprev<CR>", { desc = "Previous Quickfix list" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { desc = "Previous buffer" })

-- Trouble/Diagnostics
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>xX",
	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	{ desc = "Buffer Diagnostics (Trouble)" }
)
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
vim.keymap.set(
	"n",
	"<leader>cl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- LazyGit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- Harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "Add current file to Harpoon" })
vim.keymap.set("n", "<leader>h", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle Harpoon quick menu" })
vim.keymap.set("n", "<leader>1", function()
	harpoon:list():select(1)
end, { desc = "Select Harpoon 1" })
vim.keymap.set("n", "<leader>2", function()
	harpoon:list():select(2)
end, { desc = "Select Harpoon 2" })
vim.keymap.set("n", "<leader>3", function()
	harpoon:list():select(3)
end, { desc = "Select Harpoon 3" })
vim.keymap.set("n", "<leader>4", function()
	harpoon:list():select(4)
end, { desc = "Select Harpoon 4" })

-- Format
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format current file" })

-- Smoother window movement
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Center cursor in screen when page navigating
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up by half a page and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down by half a page and center" })
