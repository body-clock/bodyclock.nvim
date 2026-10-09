-- .nvim.lua — drop this at the root of a Vagrant+Docker Rails project.
-- Loaded automatically by nvim (requires vim.opt.exrc = true in options.lua).
--
-- SETUP REQUIRED on the container/Vagrant side (one-time per project):
--
-- 1. docker-compose.yml — expose the debug port from the container:
--      ports:
--        - "12345:12345"
--      environment:
--        RUBY_DEBUG_OPEN: "1"
--        RUBY_DEBUG_PORT: "12345"
--        RUBY_DEBUG_HOST: "0.0.0.0"   # must bind to all interfaces, not just loopback
--
-- 2. Vagrantfile — forward the port from the VM to your host:
--      config.vm.network "forwarded_port", guest: 12345, host: 12345
--
-- 3. Start the Rails app inside the container as normal. When execution hits
--    a `binding.b` breakpoint, rdbg will pause and wait for a DAP connection
--    on port 12345 instead of opening a terminal REPL.
--
-- 4. In nvim, press <leader>dc and select "Attach to rdbg (Vagrant+Docker)".

require("dap").configurations.ruby = {
	{
		type = "ruby",
		name = "Attach to rdbg (Vagrant+Docker)",
		request = "attach",
		host = "127.0.0.1", -- Vagrant forwards the VM port to localhost
		port = 12345,
	},
}
