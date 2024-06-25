return {
  'ziontee113/color-picker.nvim',
  config = function()
    require('color-picker').setup({
      ['icons'] = { '•', '•' },
    })

    vim.keymap.set('n', '<C-c>', '<cmd>PickColor<cr>', { noremap = true, silent = true })
    vim.keymap.set('i', '<C-c>', '<cmd>PickColorInsert<cr>', { noremap = true, silent = true })
  end,
}
