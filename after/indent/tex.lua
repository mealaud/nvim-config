-- local augroup = vim.api.nvim_create_augroup
-- local autocmd = vim.api.nvim_create_autocmd
-- -- Highlight yanked text
-- local compileOnSave = augroup("compileOnSave", {})
-- autocmd("BufWritePost", {
--     callback = function()
--       vim.cmd("VimtexCompileSS")
--     end,
--     group = compileOnSave,
--     buffer = 0,
-- })
-- vim.cmd([[
-- echomsg "blahooboo"
-- ]])

vim.cmd("set indentexpr=")


-- vim.cmd([[
-- echomsg "what the actual fuck is even happening right now this is so insanely bad"
-- ]])
-- vim.cmd.normal(":set indentexpr=<CR>")
