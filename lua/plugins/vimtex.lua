return {
  'lervag/vimtex',
  version = '*',
  config = function()
    vim.g.tex_flavor = 'latex'
    vim.g.tex_comment_nospell = 1
    vim.g.vimtex_compiler_latexmk = {
      ['options'] = {
        '-file-line-error',
        -- '-interaction = nonstopmode',
        -- '-synctex = 1',
        '-verbose',
      }
    }
    -- vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_compiler_engine = 'lualatex'
    vim.g.vimtex_indent_on_ampersands = 0
    -- vim.g.vimtex_quickfix_enabled = 0
  end,
}
