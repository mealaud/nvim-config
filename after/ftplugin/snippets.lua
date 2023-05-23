local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
-- Highlight yanked text
local highlightYank = augroup("highlightYank", {})
autocmd("BufWritePost", {
    callback = function()
      vim.cmd("call UltiSnips#RefreshSnippets()")
    end,
    group = highlightYank,
})
