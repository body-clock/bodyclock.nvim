require("mini.ai").setup()

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})

require("mini.icons").setup()

require("mini.indentscope").setup({
	draw = {
		delay = 0,
		animation = require("mini.indentscope").gen_animation.none(),
	},
})

local notify = require("mini.notify")
notify.setup()
vim.notify = notify.make_notify()

require("mini.pairs").setup()
require("mini.pick").setup()
require("mini.extra").setup()
vim.ui.select = require("mini.pick").ui_select

require("mini.sessions").setup({
	autoload = true,
	autosave = true,
})

require("mini.statusline").setup()
require("mini.surround").setup()

-- Keymaps
vim.keymap.set("n", "<leader>sf", function() require("mini.pick").builtin.files() end, { desc = "Find file" })
vim.keymap.set("n", "<leader>sg", function() require("mini.pick").builtin.grep_live() end, { desc = "Find string live" })
vim.keymap.set("n", "<leader>sw", function()
	require("mini.pick").builtin.grep({ pattern = vim.fn.expand("<cword>") })
end, { desc = "Find word under cursor" })
vim.keymap.set("n", "<leader>ls", function() require("mini.pick").builtin.buffers() end, { desc = "Find buffer" })
vim.keymap.set("n", "<leader>sh", function() require("mini.pick").builtin.help() end, { desc = "Find help tags" })
vim.keymap.set("n", "<leader>sm", function() require("mini.extra").pickers.marks() end, { desc = "Find marks" })
vim.keymap.set("n", "<leader>sc", function()
	require("mini.pick").start({
		source = {
			items = vim.fn.getcompletion("", "color"),
			choose = function(item) vim.cmd("colorscheme " .. item) end,
		},
	})
end, { desc = "Find colorschemes" })
vim.keymap.set("n", "<leader>sr", function() require("mini.pick").builtin.resume() end, { desc = "Resume last picker" })
