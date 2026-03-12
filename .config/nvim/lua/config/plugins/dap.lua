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
			-- "attach" connects to a running rdbg TCP server (local or remote).
			-- "launch" starts rdbg as a child process.
			--   Without --nonstop, rdbg pauses at the first line and waits for DAP
			--   to finish setup (setBreakpoints, configurationDone) before running.
			--   This avoids a race where the test completes before breakpoints are set.
			--   Press <leader>dc once after launch to start execution.
			-- For Vagrant+Docker, use "attach" with the port forwarded to localhost.
			dap.adapters.ruby = function(callback, config)
				if config.request == "attach" then
					callback({
						type = "server",
						host = config.host or "127.0.0.1",
						port = config.port or 12345,
					})
				else
					-- Find the project root by locating the Gemfile upward from the
					-- current file, so bundle exec runs in the right directory.
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

			-- Picker configurations (<leader>dc to select).
			-- For RSpec, prefer the direct keymaps (<leader>ds / <leader>dl) which
			-- skip the picker and pass the current file/line automatically.
			--
			-- For a running Rails server, start it with:
			--   RUBY_DEBUG_OPEN=1 RUBY_DEBUG_PORT=12345 RUBY_DEBUG_HOST=127.0.0.1 bundle exec rails s
			-- then use "Attach" below. When the browser hits a binding.b, dap-ui opens.
			-- For Vagrant projects, override in a .nvim.lua at the project root.
			dap.configurations.ruby = {
				{
					type = "ruby",
					name = "Attach",
					request = "attach",
					port = 12345,
				},
			}

			-- Auto-open dap-ui when a session starts. Not auto-closing on exit so
			-- the last state stays visible — close manually with <leader>du.
			dap.listeners.after.event_initialized["dapui"] = dapui.open
		end,
	},
}
