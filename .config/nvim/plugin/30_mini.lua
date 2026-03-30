local now, later, now_if_args = Config.now, Config.later, Config.now_if_args

-- Immediately needed for first screen draw
now(function()
  require('mini.icons').setup()
end)

now(function()
  local notify = require('mini.notify')
  notify.setup()
  vim.notify = notify.make_notify()
end)

now(function()
  require('mini.statusline').setup()
end)

now(function()
  require('mini.sessions').setup({
    autoload = true,
    autosave = true,
  })
end)

-- Completion (load when files are open — must be before LSP so capabilities are ready)
now_if_args(function()
  require('mini.completion').setup({
    lsp_completion = {
      source_func = 'omnifunc',
      auto_setup = false,
    },
  })
  -- Set omnifunc per-buffer when LSP attaches
  Config.new_autocmd('LspAttach', nil, function(args)
    vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
  end, 'Set omnifunc for LSP')
  -- Advertise completion capabilities to all LSP servers
  vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })
end)

-- Deferred — load after first draw
later(function()
  require('mini.ai').setup()
end)

later(function()
  local hipatterns = require('mini.hipatterns')
  hipatterns.setup({
    highlighters = {
      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })
end)

later(function()
  require('mini.indentscope').setup({
    draw = {
      delay = 0,
      animation = require('mini.indentscope').gen_animation.none(),
    },
  })
end)

later(function()
  require('mini.pairs').setup()
end)

later(function()
  require('mini.pick').setup()
  require('mini.extra').setup()
  vim.ui.select = require('mini.pick').ui_select
end)

later(function()
  require('mini.surround').setup()
end)
