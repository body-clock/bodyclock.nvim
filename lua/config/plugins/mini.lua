return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.pick').setup { }
      require('mini.pairs').setup { }
      require('mini.icons').setup { }
      require('mini.completion').setup { }
    end
  }
}
