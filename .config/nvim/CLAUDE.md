# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A Neovim configuration for Ruby/Rails development, built on lazy.nvim with heavy use of mini.nvim. Lives at `~/dotfiles/bodyclock.nvim/.config/nvim`, symlinked to `~/.config/nvim`.

## Architecture

**init.lua** is 4 lines — it loads in order:
1. `lua/config/options.lua` — core vim options
2. `lua/config/lazy.lua` — lazy.nvim bootstrap + plugin discovery
3. `lua/config/keymaps.lua` — all keybindings
4. `lua/config/autocmds.lua` — autocommands

**Plugin declarations** live in `lua/config/plugins/` (one file per plugin/group). lazy.nvim auto-discovers them via `{ import = "config.plugins" }`.

**LSP server options** live in `lsp/` (one file per server, e.g. `lsp/ruby_lsp.lua`). These are loaded automatically by `vim.lsp` when a server is enabled. Servers are enabled explicitly via `vim.lsp.enable()` in `lua/config/plugins/lsp.lua` — there is no mason-lspconfig.

## Key conventions

- **No mason-lspconfig** — servers enabled explicitly via `vim.lsp.enable()` for clarity
- **ruby-lsp and herb installed as gems**, not via Mason — so they respect project Ruby version
- `ruby-lsp` runs with `BUNDLE_IGNORE_CONFIG=1 bundle exec ruby-lsp` for Vagrant compatibility
- **No LuaSnip** — blink.cmp handles snippets natively via friendly-snippets
- **No transparent.nvim** — transparency handled by ~10 lines in autocmds.lua
- **mini.pick over telescope** — keymaps use `MiniPick` and `MiniExtra.pickers`
- `vim.opt.exrc = true` enables per-project `.nvim.lua` files (used to override DAP configs)

## Theming (tinty + tinted-nvim)

tinted-nvim reads tinty's state file and applies base16 colors. fwatch.nvim watches that file for live reloads. A `FocusGained` autocmd re-fires `ColorScheme` to keep gitsigns/rainbow-delimiters in sync after background theme switches.

The rainbow-delimiters plugin uses highlight groups `rainbowcol1`–`rainbowcol7`, which are defined by tinted-nvim.

## LSP servers

Enabled in `lua/config/plugins/lsp.lua`. Ruby-related servers (`ruby_lsp`, `herb`) are installed as gems; all others via `:Mason`.

When adding a new LSP server:
1. Add `vim.lsp.enable("server_name")` in `lsp.lua`
2. Create `lsp/server_name.lua` if the server needs custom options (root_dir, cmd, init_options, settings, etc.)

## DAP (debugging)

Configured in `lua/config/plugins/dap.lua`. Ruby uses rdbg and supports both local launch and TCP attach (for Vagrant).

Per-project DAP config goes in `.nvim.lua` at the project root (enabled by `exrc`). A Vagrant template is at `templates/vagrant-project.nvim.lua`.

Key DAP keymaps: `<leader>db` breakpoint, `<leader>dc` continue, `<leader>dn/i/o` step next/in/out, `<leader>dq` terminate, `<leader>du` UI toggle.
