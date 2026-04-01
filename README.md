# bodyclock.nvim

A focused Neovim config for Ruby/Rails development. Requires Neovim 0.12+. Uses the built-in `vim.pack` package manager and leans heavily on [mini.nvim](https://github.com/echasnovski/mini.nvim) to keep the plugin count low.

## Theming — tinty + base16 + tinted-nvim

The colour scheme is driven by [tinty](https://github.com/tinted-theming/tinty), a CLI theme manager that applies [base16](https://github.com/tinted-theming/base16) colour schemes system-wide across the terminal, tmux, and any application that supports base16 templates.

**How it hooks into Neovim:**

[tinted-nvim](https://github.com/tinted-theming/tinted-nvim) reads the current theme directly from tinty's state file and applies the 16 base16 colour variables as Neovim highlight groups. It watches the tinty state file for changes, so themes update live without restarting Neovim.

A `FocusGained` autocmd re-fires the `ColorScheme` event whenever Neovim regains focus, keeping plugins like gitsigns and rainbow-delimiters in sync after a theme switch that happened while Neovim was in the background.

**Switching themes:**

```sh
tinty apply base16-gruvbox-dark-hard   # switches everything at once
tinty list                              # browse available themes
```

Neovim picks up the change immediately if it's in the foreground, or on next focus if it's in the background.

---

## Fuzzy finding — mini.pick

`<leader>` is `Space`.

| Key | Action |
|---|---|
| `<leader>sf` | Find file |
| `<leader>sg` | Live grep |
| `<leader>sw` | Grep word under cursor |
| `<leader>ls` | Open buffers |
| `<leader>sh` | Help tags |
| `<leader>sm` | Marks |
| `<leader>sc` | Browse colour schemes |
| `<leader>sr` | Resume last picker |

## LSP

Servers are configured via the native `vim.lsp` API. [mason.nvim](https://github.com/williamboman/mason.nvim) provides a `:Mason` UI for installing and updating most servers, but the Ruby-specific servers are installed as gems so they respect the project's Ruby version and bundler environment.

**Via `:Mason`:** `stimulus_ls`, `ts_ls`, `lua_ls`, `harper_ls`, `yamlls`, `emmet_language_server`, `tailwindcss`, `biome`, `mdx_analyzer`, `marksman`

**As gems** (must be available in PATH from your Ruby version manager, e.g. mise/rbenv):
- `ruby-lsp` → `gem install ruby-lsp`. Run directly (not via `bundle exec`) — ruby-lsp handles bundler integration internally.
- `herb-language-server` → `gem install herb-language-server` (ERB language server)

| Key | Action |
|---|---|
| `K` | Hover docs |
| `gd` | Go to definition |
| `gr` | Go to references |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |

## Completion — mini.completion

Completion is handled by [mini.completion](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-completion.md) via LSP omnifunc. Trigger with `<C-Space>` in insert mode, or let it auto-complete after a short delay.

## Formatting — conform.nvim

Format on demand with `<leader>f` (normal and visual mode). Also runs on `BufWritePre`.

| Filetype | Formatter |
|---|---|
| Ruby | rubocop |
| Lua | stylua |
| JavaScript / JSX | prettier |
| CSS | prettier |
| ERB | erb_lint |

## Diagnostics — Trouble

| Key | Action |
|---|---|
| `<leader>xx` | Workspace diagnostics |
| `<leader>xX` | Buffer diagnostics |
| `<leader>cs` | Symbols |
| `<leader>cl` | LSP references/definitions panel |
| `<leader>xL` | Location list |
| `<leader>xQ` | Quickfix list |

## File browser — oil.nvim

Navigate the filesystem in a buffer. Edit filenames, delete, move — then save to apply.

| Key | Action |
|---|---|
| `-` | Open oil (current file's directory) |

## Git — gitsigns + lazygit

Gitsigns shows per-line git status in the sign column. Lazygit opens a full-screen TUI for staging, committing, and branch management.

| Key | Action |
|---|---|
| `<leader>lg` | Open lazygit |

## Navigation

### Window / tmux

`<C-h/j/k/l>` moves between Neovim splits and tmux panes seamlessly via [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator).

### Flash

[flash.nvim](https://github.com/folke/flash.nvim) for quick cursor jumps.

| Key | Action |
|---|---|
| `gs` | Flash jump |

### Page navigation

| Key | Action |
|---|---|
| `<C-u>` | Half page up, centred |
| `<C-d>` | Half page down, centred |

## Quickfix

| Key | Action |
|---|---|
| `<leader>co` | Open quickfix |
| `<leader>cc` | Close quickfix |
| `<leader>cn` | Next quickfix item |
| `<leader>cp` | Previous quickfix item |

## Ruby / Rails

| Plugin | Purpose |
|---|---|
| [vim-ruby](https://github.com/vim-ruby/vim-ruby) | Ruby syntax and indentation |
| [vim-rails](https://github.com/tpope/vim-rails) | Rails navigation (`:Emodel`, `:Econtroller`, etc.) |
| [nvim-treesitter-endwise](https://github.com/RRethy/nvim-treesitter-endwise) | Auto-insert `end` |
| [splitjoin.vim](https://github.com/AndrewRadev/splitjoin.vim) | Toggle between single/multi-line expressions |
| [view-component.nvim](https://github.com/body-clock/view-component.nvim) | Switch between ViewComponent Ruby and template files |

| Key | Action |
|---|---|
| `<leader>vc` | Switch ViewComponent Ruby ↔ template |

## Markdown — peek.nvim

Live preview rendered in a browser via Deno.

| Key | Action |
|---|---|
| `<leader>po` | Open preview |
| `<leader>pc` | Close preview |

## mini.nvim modules in use

| Module | Purpose |
|---|---|
| Module | Purpose |
|---|---|
| mini.ai | Extended text objects (`daf`, `dif`, etc.) |
| mini.completion | LSP completion via omnifunc |
| mini.hipatterns | Highlight hex colours inline |
| mini.icons | File icons throughout the UI |
| mini.indentscope | Animated indent scope indicator |
| mini.notify | Notification popups |
| mini.pairs | Auto-close brackets/quotes |
| mini.pick | Fuzzy finder (replaces telescope) |
| mini.sessions | Auto-save and restore sessions per directory |
| mini.statusline | Statusline |
| mini.surround | Add/change/delete surrounding characters |
