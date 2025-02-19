-- Execute current line, useful for testing out keybinds and other settings
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Telescope mappings
local ivy = require("telescope.themes").get_ivy({})
vim.keymap.set("n", "<leader>sf", function()
	require("telescope.builtin").find_files(ivy)
end, { desc = "Find File" })
vim.keymap.set("n", "<leader>sg", function()
	require("telescope.builtin").live_grep(ivy)
end, { desc = "Find String" })
vim.keymap.set("n", "<leader>ls", function()
	require("telescope.builtin").buffers(ivy)
end, { desc = "Find Buffer" })
vim.keymap.set("n", "<leader>sh", function()
	require("telescope.builtin").help_tags(ivy)
end, { desc = "Find Help tags" })
vim.keymap.set("n", "<leader>sm", function()
	require("telescope.builtin").marks(ivy)
end, { desc = "Find Marks" })

-- LSP (Some telescope)
vim.keymap.set("n", "gd", function()
	require("telescope.builtin").lsp_definitions(ivy)
end, { desc = "[g]o to [d]efinition" })
vim.keymap.set("n", "gr", function()
	require("telescope.builtin").lsp_references(ivy)
end, { desc = "[g]o to [r]eference" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

-- Quickfix list
vim.keymap.set("n", "<leader>co", ":copen<CR>")
vim.keymap.set("n", "<leader>cc", ":cclose<CR>")

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
end)
vim.keymap.set("n", "<leader>h", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<leader>1", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>2", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>3", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>4", function()
	harpoon:list():select(4)
end)

-- vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions(ivy), { desc = "[g]o to [d]efinition" })
-- vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references(ivy), { desc = "[g]o to [r]eference" })
-- vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations(ivy), { desc = "[g]o to [I]mplementation" })
-- vim.keymap.set("n", "<leader>D", require("telescope.builtin").lsp_type_definitions(ivy), { desc = "type [D]efinitions" })
-- vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols(ivy), { desc = "[d]ocument [s]ymbols" })
-- vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols(ivy), { desc = "[w]orkspace [s]ymbols" })
-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[r]e[n]ame under cursor" })
-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })
-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[g]o to [D]eclaration" })

-- Format
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end)

-- Smoother window movement
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Center cursor in screen when page navigating
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up by half a page and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down by half a page and center" })
