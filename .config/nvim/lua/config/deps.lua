-- Bootstrap mini.nvim
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.uv.fs_stat(mini_path) then
	vim.cmd('echo "Installing mini.nvim..." | redraw')
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/echasnovski/mini.nvim",
		mini_path,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone mini.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
	vim.cmd("packadd mini.nvim | helptags ALL")
end

require("mini.deps").setup({ path = { package = path_package } })

-- Auto-discover and load all plugin files
for _, file in ipairs(vim.fn.glob(
	vim.fn.stdpath("config") .. "/lua/config/plugins/*.lua",
	false,
	true
)) do
	local mod = file:match(".*/lua/(.-)%.lua$"):gsub("/", ".")
	require(mod)
end
