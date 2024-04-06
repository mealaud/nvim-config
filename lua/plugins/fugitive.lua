return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>g', ':Git<CR>', { silent = true })
    vim.keymap.set('n', '<leader>p', ':Git push<CR>', { silent = true })
  end,
}

