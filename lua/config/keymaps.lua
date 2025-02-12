-- Execute current line, useful for testing out keybinds and other settings
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Mini pick mappings
vim.keymap.set("n", "<leader>sf", function() require('mini.pick').builtin.files() end,
  { desc = "Find File" })
vim.keymap.set("n", "<leader>sg", function() require('mini.pick').builtin.grep_live() end,
  { desc = 'Find String' })
vim.keymap.set("n", "<leader>ls", function() require('mini.pick').builtin.buffers() end,
  { desc = 'Find Buffer' })

-- Quickfix list
vim.keymap.set("n", "<leader>q", ":copen<CR>")
vim.keymap.set("n", "<leader>qq", ":cclose<CR>")

-- Trouble/Diagnostics
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",
  { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  { desc = "Buffer Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",
  { desc = "Symbols (Trouble)" })
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  { desc = "LSP Definitions / references / ... (Trouble)" })
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>",
  { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",
  { desc = "Quickfix List (Trouble)" })

-- LazyGit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>",
	{ desc = "LazyGit"})

-- Harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

-- Tab completion with mini.completion
local imap_expr = function(lhs, rhs)
	vim.keymap.set('i', lhs, rhs, { expr = true })
end
imap_expr('<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

-- Completion selection with enter
local keycode = vim.keycode or function(x)
	return vim.api.nvim_replace_termcodes(x, true, true, true)
end
local keys = {
	['cr']        = keycode('<CR>'),
	['ctrl-y']    = keycode('<C-y>'),
	['ctrl-y_cr'] = keycode('<C-y><CR>'),
}

_G.cr_action = function()
	if vim.fn.pumvisible() ~= 0 then
		-- If popup is visible, confirm selected item or add new line otherwise
		local item_selected = vim.fn.complete_info()['selected'] ~= -1
		return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
	else
		-- If popup is not visible, use plain `<CR>`. You might want to customize
		-- according to other plugins. For example, to use 'mini.pairs', replace
		-- next line with `return require('mini.pairs').cr()`
		return keys['cr']
	end
end

vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action()', { expr = true })
