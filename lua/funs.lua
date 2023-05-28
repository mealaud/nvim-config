local m = {}
  m.in_comment = function()
    return vim.fn["vimtex#syntax#in_comment"]() == 1
end

m.in_mathzone = function()
    return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

m.in_text = function()
    return not m.in_mathzone() and not m.in_comment()
end

m.begins_line = function()
    local cur_line = vim.api.nvim_get_current_line()
    return #cur_line == #string.match(cur_line, "%s*[^%s]+")
end

-- m.get_env = function(name)
--     return {
--         t({ "\\begin{" .. name .. "}", "\t" }),
--         i(0),
--         t({ "", "\\end{" .. name .. "}" }),
--     }
-- end


return m
