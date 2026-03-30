-- nvim-treesitter 1.0 (main branch) — the configs module is gone.
-- Neovim 0.12 bundles parsers for c, lua, vim, vimdoc, query, markdown, markdown_inline.
-- This only installs parsers not already bundled.
-- Highlighting and indent are handled by neovim's built-in treesitter integration.
require("nvim-treesitter").setup({
	ensure_installed = { "ruby", "yaml" },
	auto_install = true,
})
