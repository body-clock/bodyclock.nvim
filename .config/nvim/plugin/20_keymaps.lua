local nmap = function(lhs, rhs, desc)
  vim.keymap.set('n', lhs, rhs, { desc = desc })
end

-- Search
nmap('<Esc>', '<cmd>nohlsearch<CR>', 'Clear highlight on search')

-- Quickfix list
nmap('<leader>co', ':copen<CR>', 'Open Quickfix list')
nmap('<leader>cc', ':cclose<CR>', 'Close Quickfix list')
nmap('<leader>cn', ':cnext<CR>', 'Next Quickfix list')
nmap('<leader>cp', ':cprev<CR>', 'Previous Quickfix list')

-- Navigation
nmap('<C-u>', '<C-u>zz', 'Move up half page and center')
nmap('<C-d>', '<C-d>zz', 'Move down half page and center')

-- Colorscheme / theme
nmap('<leader>tt', '<cmd>TransparentToggle<CR>', 'Toggle transparency')

-- mini.pick pickers
nmap('<leader>sf', function()
  require('mini.pick').builtin.files()
end, 'Find file')
nmap('<leader>sg', function()
  require('mini.pick').builtin.grep_live()
end, 'Find string live')
nmap('<leader>sw', function()
  require('mini.pick').builtin.grep({ pattern = vim.fn.expand('<cword>') })
end, 'Find word under cursor')
nmap('<leader>ls', function()
  require('mini.pick').builtin.buffers()
end, 'Find buffer')
nmap('<leader>sh', function()
  require('mini.pick').builtin.help()
end, 'Find help tags')
nmap('<leader>sm', function()
  require('mini.extra').pickers.marks()
end, 'Find marks')
nmap('<leader>sc', function()
  require('mini.pick').start({
    source = {
      items = vim.fn.getcompletion('', 'color'),
      choose = function(item)
        vim.cmd('colorscheme ' .. item)
      end,
    },
  })
end, 'Find colorschemes')
nmap('<leader>sr', function()
  require('mini.pick').builtin.resume()
end, 'Resume last picker')

-- Flash (jump)
vim.keymap.set({ 'n', 'x', 'o' }, 'gs', function()
  require('flash').jump()
end, { desc = 'Flash' })

-- Oil (file browser)
nmap('-', '<cmd>Oil<CR>', 'Open oil file browser')

-- Tmux/vim navigation
nmap('<c-h>', '<cmd>TmuxNavigateLeft<CR>', 'Move left (tmux/vim)')
nmap('<c-j>', '<cmd>TmuxNavigateDown<CR>', 'Move down (tmux/vim)')
nmap('<c-k>', '<cmd>TmuxNavigateUp<CR>', 'Move up (tmux/vim)')
nmap('<c-l>', '<cmd>TmuxNavigateRight<CR>', 'Move right (tmux/vim)')
nmap('<c-\\>', '<cmd>TmuxNavigatePrevious<CR>', 'Move to previous (tmux/vim)')

-- LazyGit
nmap('<leader>lg', '<cmd>LazyGit<CR>', 'LazyGit')

-- Formatting
vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
  require('conform').format({ async = true, lsp_format = 'fallback' })
end, { desc = 'Format current file' })

-- Trouble (diagnostics)
nmap('<leader>xx', '<cmd>Trouble diagnostics toggle<CR>', 'Diagnostics (Trouble)')
nmap('<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', 'Buffer Diagnostics (Trouble)')
nmap('<leader>cs', '<cmd>Trouble symbols toggle focus=false<CR>', 'Symbols (Trouble)')
nmap(
  '<leader>cl',
  '<cmd>Trouble lsp toggle focus=false win.position=right<CR>',
  'LSP Definitions / references (Trouble)'
)
nmap('<leader>xL', '<cmd>Trouble loclist toggle<CR>', 'Location List (Trouble)')
nmap('<leader>xQ', '<cmd>Trouble qflist toggle<CR>', 'Quickfix List (Trouble)')

-- Markdown preview (peek)
nmap('<leader>po', function()
  require('peek').open()
end, 'Open markdown preview')
nmap('<leader>pc', function()
  require('peek').close()
end, 'Close markdown preview')

-- View component (local dev plugin)
nmap('<leader>vc', function()
  require('view-component').switch()
end, 'Switch view component')
