return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			-- Ruby adapter.
			--
			-- "attach" mode: connect to an already-running rdbg TCP server.
			--   Used for Rails server (started externally with RUBY_DEBUG_OPEN=1)
			--   and for Vagrant+Docker (port forwarded to localhost).
			--
			-- "launch" mode: rdbg starts the process as a child.
			--   rdbg opens a TCP server, pauses before running any code, and waits
			--   for nvim-dap to connect and register breakpoints. Once that handshake
			--   completes, the "entry" stopped event fires — we auto-continue past it
			--   (see listener below) so execution runs straight to your breakpoint.
			--   cwd is resolved by finding the Gemfile so bundle exec works from any
			--   subdirectory.
			dap.adapters.ruby = function(callback, config)
				if config.request == "attach" then
					callback({
						type = "server",
						host = config.host or "127.0.0.1",
						port = config.port or 12345,
					})
				else
					local gemfile = vim.fn.findfile("Gemfile", ".;")
					local cwd = gemfile ~= "" and vim.fn.fnamemodify(gemfile, ":p:h") or vim.fn.getcwd()
					callback({
						type = "server",
						host = "127.0.0.1",
						port = config.port or 12345,
						executable = {
							command = "bundle",
							args = {
								"exec", "rdbg",
								"--open", "--port", tostring(config.port or 12345),
								"-c", "--", config.command or "ruby",
								unpack(config.args or {}),
							},
							cwd = cwd,
						},
					})
				end
			end

			-- For a running Rails server, start it with:
			--   RUBY_DEBUG_OPEN=1 RUBY_DEBUG_PORT=12345 RUBY_DEBUG_HOST=127.0.0.1 bundle exec rails s
			-- then <leader>dc → "Attach". For Vagrant projects, override in .nvim.lua.
			-- For RSpec use <leader>ds (file) or <leader>dl (line) — skips this picker.
			dap.configurations.ruby = {
				{
					type = "ruby",
					name = "Attach",
					request = "attach",
					port = 12345,
				},
			}

			-- Auto-open dap-ui when a session initialises.
			-- dap-ui stays open after the session ends so you can inspect the final
			-- state — close it manually with <leader>du.
			dap.listeners.after.event_initialized["dapui"] = dapui.open

			-- In launch mode rdbg pauses at the program entry point before running
			-- any code, ensuring nvim-dap has registered all breakpoints first. This
			-- listener auto-continues past that initial pause so <leader>ds is one
			-- keypress — execution runs straight to your first breakpoint.
			dap.listeners.after.event_stopped["ruby_skip_entry"] = function(_, body)
				if body.reason == "entry" then
					dap.continue()
				end
			end
		end,
	},
}
