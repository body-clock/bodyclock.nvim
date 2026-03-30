local add = vim.pack.add
local now, later, now_if_args = Config.now, Config.later, Config.now_if_args

-- ── Colorscheme ───────────────────────────────────────────────────────────────
-- Must run now() — sets highlight groups used by statusline, gitsigns, etc.
now(function()
  add({ 'https://github.com/tinted-theming/tinted-nvim' })

  require('tinted-nvim').setup({
    selector = {
      enabled = true,
      mode = 'file',
      path = '~/.local/share/tinted-theming/tinty/current_scheme',
      watch = true,
    },
  })

  vim.g.transparent_bg = true

  local function apply_transparent_bg()
    if not vim.g.transparent_bg then return end
    for _, group in ipairs({
      'Normal', 'NormalNC', 'NormalFloat',
      'SignColumn', 'LineNr', 'CursorLineNr', 'EndOfBuffer',
      'StatusLine', 'TabLine', 'TabLineFill',
    }) do
      vim.api.nvim_set_hl(0, group, { bg = 'NONE', ctermbg = 'NONE' })
    end
  end

  Config.new_autocmd('ColorScheme', nil, apply_transparent_bg, 'Transparent background')
  apply_transparent_bg()

  vim.api.nvim_create_user_command('TransparentToggle', function()
    vim.g.transparent_bg = not vim.g.transparent_bg
    vim.cmd('colorscheme ' .. (vim.g.colors_name or ''))
  end, {})

  -- Re-trigger ColorScheme on focus so gitsigns / transparent bg stay in sync
  -- after tinty switches themes externally.
  Config.new_autocmd('FocusGained', nil, function()
    vim.cmd('silent! doautocmd ColorScheme ' .. (vim.g.colors_name or ''))
  end, 'Sync theme on focus')
end)

-- ── Treesitter ────────────────────────────────────────────────────────────────
-- now_if_args: load immediately when Neovim opens a file on launch.
now_if_args(function()
  -- Register :TSUpdate hook BEFORE add() so it fires on first install too
  Config.on_packchanged('nvim-treesitter', { 'update' }, function()
    vim.cmd('TSUpdate')
  end, ':TSUpdate on update')

  add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/RRethy/nvim-treesitter-endwise',
  })

  -- Neovim 0.12 bundles: lua, vim, vimdoc, query, markdown, markdown_inline.
  -- Only install parsers that aren't already present.
  local languages = { 'ruby', 'yaml' }
  local isnt_installed = function(lang)
    return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
  end
  local to_install = vim.tbl_filter(isnt_installed, languages)
  if #to_install > 0 then require('nvim-treesitter').install(to_install) end

  -- nvim-treesitter 1.0 (main): no configs module. Enable highlighting per
  -- filetype via FileType autocmd using neovim's built-in vim.treesitter.start().
  local filetypes = {}
  for _, lang in ipairs(languages) do
    vim.list_extend(filetypes, vim.treesitter.language.get_filetypes(lang))
  end
  Config.new_autocmd('FileType', filetypes, function(ev)
    vim.treesitter.start(ev.buf)
  end, 'Start tree-sitter')
end)

-- ── LSP stack ─────────────────────────────────────────────────────────────────
now_if_args(function()
  add({
    'https://github.com/williamboman/mason.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/folke/lazydev.nvim',
  })

  require('mason').setup()

  -- lazydev: neovim API type annotations for Lua LSP completions
  require('lazydev').setup({
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  })

  -- capabilities are set in 30_mini.lua via MiniCompletion.get_lsp_capabilities()

  Config.new_autocmd('LspAttach', nil, function(args)
    local buf = args.buf
    vim.keymap.set('n', 'K',           vim.lsp.buf.hover,       { buffer = buf, desc = 'Hover LSP information' })
    vim.keymap.set('n', 'gd', function()
      require('mini.extra').pickers.lsp({ scope = 'definition' })
    end, { buffer = buf, desc = '[g]o to [d]efinition' })
    vim.keymap.set('n', 'gr', function()
      require('mini.extra').pickers.lsp({ scope = 'references' })
    end, { buffer = buf, desc = '[g]o to [r]eference' })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = buf, desc = 'Code action' })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,      { buffer = buf, desc = 'Rename under cursor' })
  end, 'LSP keymaps on attach')

  vim.lsp.enable({
    'ruby_lsp', 'stimulus_ls', 'ts_ls', 'marksman', 'lua_ls',
    'harper_ls', 'yamlls', 'emmet_language_server',
    'tailwindcss', 'biome', 'mdx_analyzer', 'herb',
  })
end)

-- ── Deferred plugins ──────────────────────────────────────────────────────────

later(function()
  add({ 'https://github.com/lewis6991/gitsigns.nvim' })
  require('gitsigns').setup()
end)

later(function()
  add({ 'https://github.com/HiPhish/rainbow-delimiters.nvim' })
  require('rainbow-delimiters.setup').setup({
    highlight = {
      'rainbowcol1', 'rainbowcol2', 'rainbowcol3', 'rainbowcol4',
      'rainbowcol5', 'rainbowcol6', 'rainbowcol7',
    },
  })
end)

later(function()
  add({ 'https://github.com/folke/flash.nvim' })
  require('flash').setup({ modes = { char = { enabled = false } } })
end)

later(function()
  add({
    'https://github.com/MunifTanjim/nui.nvim',
    'https://github.com/m4xshen/hardtime.nvim',
  })
  require('hardtime').setup()
end)

later(function()
  add({ 'https://github.com/stevearc/oil.nvim' })
  require('oil').setup({ view_options = { show_hidden = true } })
end)

later(function()
  add({ 'https://github.com/christoomey/vim-tmux-navigator' })
end)

later(function()
  add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/kdheepak/lazygit.nvim',
  })
end)

later(function()
  add({ 'https://github.com/stevearc/conform.nvim' })
  require('conform').setup({
    formatters = {
      erb_lint = {
        stdin = false,
        tmpfile_format = '.conform.$RANDOM.$FILENAME',
        command = 'erb_lint',
        args = { '--autocorrect', '$FILENAME' },
      },
    },
    formatters_by_ft = {
      lua        = { 'stylua' },
      ruby       = { 'rubocop' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      css        = { 'prettier' },
    },
  })
end)

later(function()
  add({ 'https://github.com/folke/trouble.nvim' })
  require('trouble').setup({
    modes = {
      diagnostics_buffer = {
        mode   = 'diagnostics',
        filter = { buf = 0 },
      },
    },
  })
end)

later(function()
  add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/folke/todo-comments.nvim',
  })
  require('todo-comments').setup()
end)

later(function()
  add({ 'https://github.com/toppair/peek.nvim' })
  require('peek').setup()
  vim.api.nvim_create_user_command('PeekOpen',  require('peek').open,  {})
  vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
end)

later(function()
  add({ 'https://github.com/MeanderingProgrammer/render-markdown.nvim' })
  require('render-markdown').setup()
end)

later(function()
  add({
    'https://github.com/vim-ruby/vim-ruby',
    'https://github.com/tpope/vim-rails',
    'https://github.com/AndrewRadev/splitjoin.vim',
  })
end)

later(function()
  -- view-component.nvim: local dev plugin, not managed by vim.pack
  vim.opt.runtimepath:prepend(vim.fn.expand('~/code/p/view-component.nvim'))
end)
