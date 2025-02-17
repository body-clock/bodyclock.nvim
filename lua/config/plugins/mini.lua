return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.pick').setup { }
      require('mini.pairs').setup { }
    end
  }
}
