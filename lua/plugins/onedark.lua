return {
  enabled = true,
  'olimorris/onedarkpro.nvim',
  priority = 1000,
  config = function()
    require('onedarkpro').setup({
      options = {
        cursorline = true,
        transparency = true,
        terminal_colors = true,
      },
    })
  end,
}
