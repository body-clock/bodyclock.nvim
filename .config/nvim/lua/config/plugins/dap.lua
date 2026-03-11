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
			-- "launch" starts rdbg locally and attaches immediately.
			-- For Vagrant+Docker, always use "attach" with port forwarded to host.
			dap.adapters.ruby = function(callback, config)
				if config.request == "attach" then
					callback({
						type = "server",
						host = config.host or "127.0.0.1",
						port = config.port or 12345,
					})
				else
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
						},
					})
				end
			end

			-- Default configurations for local development.
			-- For Vagrant projects, override these in a .nvim.lua at the project root
			-- (requires vim.opt.exrc = true in options.lua).
			dap.configurations.ruby = {
				{
					type = "ruby",
					name = "Attach to rdbg (local)",
					request = "attach",
					port = 12345,
				},
				{
					type = "ruby",
					name = "Run current file",
					request = "launch",
					command = "ruby",
					args = { "${file}" },
				},
				{
					type = "ruby",
					name = "Run RSpec (current file)",
					request = "launch",
					command = "rspec",
					args = { "${file}" },
				},
			}

			-- Auto open/close dap-ui with sessions
			dap.listeners.after.event_initialized["dapui"] = dapui.open
			dap.listeners.before.event_terminated["dapui"] = dapui.close
			dap.listeners.before.event_exited["dapui"] = dapui.close
		end,
	},
}
