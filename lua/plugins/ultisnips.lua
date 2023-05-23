return {
  'SirVer/ultisnips',
  event = "InsertEnter",
  config = function()
    vim.g.UltiSnipsExpandTrigger = "<tab>"
    vim.g.UltiSnipsJumpForwardTrigger = "<c-i>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
    vim.g.UltiSnipsEditSplit = "vertical"
  end,
}
