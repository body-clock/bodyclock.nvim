return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")
			local languages = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"ruby",
				"yaml",
			}

			treesitter.install(languages)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = languages,
				callback = function(args)
					local stats = vim.uv.fs_stat(vim.api.nvim_buf_get_name(args.buf))
					if not stats or stats.size <= 100 * 1024 then
						vim.treesitter.start(args.buf)
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
}
