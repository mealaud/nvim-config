return {
  'preservim/vim-markdown',
  init = function() 
    vim.g.vim_markdown_folding_disabled = 1
    vim.g.vim_markdown_math = 1
  end,
}
