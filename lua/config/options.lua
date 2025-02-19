vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.termguicolors = true -- Enables 24-bit RGB color in the TUI
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.shiftwidth = 2 -- Governs how >> and friends work
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.signcolumn = "yes" -- Always show sign column, display numbers
vim.opt.conceallevel = 1 -- Determine how text with the "conceal" syntax attribute is shown, turned on for markdown
vim.opt.splitright = true -- Open new vertical splits to the right
vim.opt.splitbelow = true -- Open new horizontal splits to the bottom
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- How certain characters are displayed
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.ignorecase = true -- Ignore case when searching, etc...
vim.opt.smartcase = true -- Ignore case until one or more capital letters is detected
