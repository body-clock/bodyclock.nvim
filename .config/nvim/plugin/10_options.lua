-- stylua: ignore start
vim.g.mapleader      = ' '
vim.g.maplocalleader = '\\'

-- Disable unused providers to suppress healthcheck warnings
vim.g.loaded_node_provider   = 0
vim.g.loaded_perl_provider   = 0
vim.g.loaded_python3_provider = 0

-- Display
vim.opt.termguicolors  = true
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.signcolumn     = 'yes'
vim.opt.cursorline     = false
vim.opt.scrolloff      = 10
vim.opt.listchars      = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.conceallevel   = 0

-- Editing
vim.opt.clipboard   = 'unnamedplus'
vim.opt.shiftwidth  = 2
vim.opt.tabstop     = 2
vim.opt.ignorecase  = true
vim.opt.smartcase   = true

-- Splits
vim.opt.splitright  = true
vim.opt.splitbelow  = true

-- Wrapping
vim.wo.wrap = true

-- Neovim 0.12: single border on all floating windows (replaces per-plugin border configs)
vim.o.winborder = 'single'

-- Neovim 0.12: fuzzy + nosort improve built-in completion feel
vim.o.completeopt = 'menuone,noselect,fuzzy,nosort'
-- stylua: ignore end

-- Highlight yanked text
Config.new_autocmd('TextYankPost', nil, function()
  vim.highlight.on_yank()
end, 'Highlight on yank')

-- Guard against accidentally opening command-line history with <C-f>
local function escape(keys)
  return vim.api.nvim_replace_termcodes(keys, true, false, true)
end

vim.keymap.set('c', '<C-f>', function()
  vim.g.requested_cmdwin = true
  vim.api.nvim_feedkeys(escape('<C-f>'), 'n', false)
end)

Config.new_autocmd('CmdWinEnter', '*', function()
  if vim.g.requested_cmdwin then
    vim.g.requested_cmdwin = nil
  else
    vim.api.nvim_feedkeys(escape(':q<CR>:'), 'm', false)
  end
end, 'Guard command-line history window')

-- eruby.yaml → use YAML treesitter highlighting
Config.new_autocmd('FileType', 'eruby.yaml', function()
  vim.bo.filetype = 'yaml'
end, 'eruby.yaml → yaml')

-- Per-project .nvim.lua overrides (e.g. DAP configs for Vagrant)
vim.opt.exrc = true

