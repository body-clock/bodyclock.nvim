return {
	{
		"tinted-theming/tinted-nvim",
		priority = 1000,
		lazy = false,
		opts = {
			selector = {
				enabled = true,
				mode = "file",
				path = "~/.local/share/tinted-theming/tinty/current_scheme",
				watch = true,
			},
		},
		config = function(_, opts)
			vim.o.termguicolors = true
			require("tinted-nvim").setup(opts)

			-- Transparent background (works with Ghostty background-opacity + blur)
			vim.g.transparent_bg = true

			local function apply_transparent_bg()
				if not vim.g.transparent_bg then return end
				local groups = {
					"Normal", "NormalNC", "NormalFloat",
					"SignColumn", "LineNr", "CursorLineNr", "EndOfBuffer",
					"StatusLine", "TabLine", "TabLineFill",
				}
				for _, group in ipairs(groups) do
					vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
				end
			end
			vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_transparent_bg })
			apply_transparent_bg()

			vim.api.nvim_create_user_command("TransparentToggle", function()
				vim.g.transparent_bg = not vim.g.transparent_bg
				-- re-applying the colorscheme restores original backgrounds when off,
				-- and the ColorScheme autocmd above will re-apply transparency when on
				vim.cmd("colorscheme " .. (vim.g.colors_name or ""))
			end, {})

			-- Re-trigger ColorScheme on focus so plugins (gitsigns, transparent bg, etc.)
			-- stay in sync when tinty switches themes externally.
			vim.api.nvim_create_autocmd("FocusGained", {
				callback = function()
					vim.cmd("silent! doautocmd ColorScheme " .. (vim.g.colors_name or ""))
				end,
			})
		end,
	},
}
