_G.Config = {}

-- Install mini.nvim first — needed for loading helpers used across all plugin/ files
vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

-- Two-phase startup helpers via mini.misc.safely():
--   now()          — run immediately (colorscheme, statusline, notify)
--   later()        — deferred after first screen draw (most plugins)
--   now_if_args()  — now() if Neovim opened a file on the CLI, else later()
local misc = require('mini.misc')
Config.now = function(f)
  misc.safely('now', f)
end
Config.later = function(f)
  misc.safely('later', f)
end
Config.now_if_args = vim.fn.argc(-1) > 0 and Config.now or Config.later

-- Shared autocommand group + helper used throughout plugin/ files
local gr = vim.api.nvim_create_augroup('config', {})
Config.new_autocmd = function(event, pattern, callback, desc)
  vim.api.nvim_create_autocmd(event, { group = gr, pattern = pattern, callback = callback, desc = desc })
end

-- Helper to run a callback when vim.pack installs or updates a specific plugin.
-- Registers the autocmd BEFORE vim.pack.add() so it fires on first install.
Config.on_packchanged = function(plugin_name, kinds, callback, desc)
  local f = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if not (name == plugin_name and vim.tbl_contains(kinds, kind)) then
      return
    end
    if not ev.data.active then
      vim.cmd.packadd(plugin_name)
    end
    callback()
  end
  Config.new_autocmd('PackChanged', '*', f, desc)
end
