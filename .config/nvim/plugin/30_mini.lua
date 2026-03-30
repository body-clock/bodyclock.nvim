local now, later = Config.now, Config.later

-- Immediately needed for first screen draw
now(function() require('mini.icons').setup() end)

now(function()
  local notify = require('mini.notify')
  notify.setup()
  vim.notify = notify.make_notify()
end)

now(function() require('mini.statusline').setup() end)

now(function()
  require('mini.sessions').setup({
    autoload = true,
    autosave = true,
  })
end)

-- Deferred — load after first draw
later(function() require('mini.ai').setup() end)

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

later(function() require('mini.pairs').setup() end)

later(function()
  require('mini.pick').setup()
  require('mini.extra').setup()
  vim.ui.select = require('mini.pick').ui_select
end)

later(function() require('mini.surround').setup() end)
