---@diagnostic disable: missing-fields
MiniDeps.now(function()
	MiniDeps.add({
		source = "saghen/blink.cmp",
		depends = { "rafamadriz/friendly-snippets" },
	})
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	require("blink.cmp").setup({
		keymap = { preset = "default" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	})
end)
