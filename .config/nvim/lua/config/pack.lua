vim.loader.enable()

-- vim.pack manages Git-based plugins (neovim 0.12+).
-- Stored at: ~/.local/share/nvim/site/pack/core/opt/
-- Lockfile:  ~/.config/nvim/nvim-pack-lock.json  (commit this file)
--
-- load = true: packadd all plugins immediately so require("x").setup() works
-- in the same startup pass.
vim.pack.add({
	-- Colorscheme — listed first so highlight groups are available to everything else
	{ src = "https://github.com/tinted-theming/tinted-nvim", name = "tinted-nvim" },

	-- Core editing / UI
	{ src = "https://github.com/echasnovski/mini.nvim", name = "mini.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim", name = "gitsigns.nvim" },
	{ src = "https://github.com/HiPhish/rainbow-delimiters.nvim", name = "rainbow-delimiters.nvim" },
	{ src = "https://github.com/folke/flash.nvim", name = "flash.nvim" },
	{ src = "https://github.com/m4xshen/hardtime.nvim", name = "hardtime.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim", name = "nui.nvim" }, -- hardtime dependency

	-- File navigation
	{ src = "https://github.com/stevearc/oil.nvim", name = "oil.nvim" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator", name = "vim-tmux-navigator" },

	-- Git
	{ src = "https://github.com/kdheepak/lazygit.nvim", name = "lazygit.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim", name = "plenary.nvim" }, -- lazygit/todo dependency

	-- LSP / Completion
	{ src = "https://github.com/williamboman/mason.nvim", name = "mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig", name = "nvim-lspconfig" },
	{ src = "https://github.com/folke/lazydev.nvim", name = "lazydev.nvim" },
	{ src = "https://github.com/saghen/blink.cmp", name = "blink.cmp" },
	{ src = "https://github.com/rafamadriz/friendly-snippets", name = "friendly-snippets" }, -- blink dependency

	-- Formatting / Diagnostics
	{ src = "https://github.com/stevearc/conform.nvim", name = "conform.nvim" },
	{ src = "https://github.com/folke/trouble.nvim", name = "trouble.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim", name = "todo-comments.nvim" },

	-- Treesitter — version = "main" forces the 1.0 rewrite branch
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "nvim-treesitter", version = "main" },
	{ src = "https://github.com/RRethy/nvim-treesitter-endwise", name = "nvim-treesitter-endwise" },

	-- Markdown
	{ src = "https://github.com/toppair/peek.nvim", name = "peek.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim", name = "render-markdown.nvim" },

	-- Ruby / Rails (no setup needed; load via packadd, ftplugins fire automatically)
	{ src = "https://github.com/vim-ruby/vim-ruby", name = "vim-ruby" },
	{ src = "https://github.com/tpope/vim-rails", name = "vim-rails" },
	{ src = "https://github.com/AndrewRadev/splitjoin.vim", name = "splitjoin.vim" },
}, { load = true })

-- view-component.nvim is a local dev plugin — add to runtimepath directly
vim.opt.runtimepath:prepend(vim.fn.expand("~/code/p/view-component.nvim"))

-- Load plugin configurations.
-- completion before lsp — blink capabilities must be ready before LSP attaches.
-- colorscheme before everything else — sets highlight groups used by other plugins.
require("config.plugins.colorscheme")
require("config.plugins.mini")
require("config.plugins.gitsigns")
require("config.plugins.rainbow-delimiters")
require("config.plugins.flash")
require("config.plugins.hardtime")
require("config.plugins.oil")
require("config.plugins.vim-tmux-navigator")
require("config.plugins.lazygit")
require("config.plugins.completion")
require("config.plugins.lsp")
require("config.plugins.conform")
require("config.plugins.trouble")
require("config.plugins.todo")
require("config.plugins.treesitter")
require("config.plugins.peek")
require("config.plugins.render-markdown")
require("config.plugins.view-component")
