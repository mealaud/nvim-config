local m = {}

m.in_mathzone = function()
    local current_node = vim.treesitter.get_node({ ignore_injections = false })
    while current_node do
        vim.print(current_node:type())
        if current_node:type() == "source_file" then
            return true
        end
        current_node = current_node:parent()
    end
    return false
end

m.in_text = function()
    return not m.in_mathzone()
end

m.begins_line = function()
    local cur_line = vim.api.nvim_get_current_line()
    return #cur_line == #string.match(cur_line, "%s*[^%s]+")
end

return m
