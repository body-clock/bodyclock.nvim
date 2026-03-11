return {
	{
		"echasnovski/mini.nvim",
		config = function()
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
			require("mini.pick").setup({
				mappings = {
					-- <C-q> sends all filtered results to quickfix (like telescope's <M-q>)
					to_quickfix = {
						char = "<C-q>",
						func = function()
							local pick = require("mini.pick")
							local matches = pick.get_picker_matches() or {}
							local items = matches.all or {}
							if #items == 0 then
								return
							end
							local qf_items = {}
							for _, item in ipairs(items) do
								if type(item) == "string" then
									-- grep format: "filename:lnum:col:text"
									local filename, lnum, col, text = item:match("^(.-):(%d+):(%d+):(.*)$")
									if filename then
										table.insert(qf_items, {
											filename = filename,
											lnum = tonumber(lnum),
											col = tonumber(col),
											text = vim.trim(text),
										})
									else
										table.insert(qf_items, { filename = item, lnum = 1, text = item })
									end
								end
							end
							if #qf_items == 0 then
								return
							end
							pick.stop()
							vim.fn.setqflist(qf_items, "r")
							vim.cmd("copen")
						end,
					},
				},
			})
			vim.ui.select = require("mini.pick").ui_select
			require("mini.sessions").setup({
				autoload = true,
				autosave = true,
			})
			require("mini.statusline").setup()
			require("mini.surround").setup()
		end,
	},
}
