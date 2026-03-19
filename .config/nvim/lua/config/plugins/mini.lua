-- mini.nvim is already installed as the bootstrap dependency — no add() needed.
MiniDeps.now(function()
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
	vim.ui.select = require("mini.pick").ui_select

	require("mini.sessions").setup({
		autoload = true,
		autosave = true,
	})

	require("mini.statusline").setup()
	require("mini.surround").setup()

	-- mini.extra is used in keymaps (pickers.lsp, pickers.marks)
	require("mini.extra").setup()
end)
