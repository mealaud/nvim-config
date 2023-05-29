local m = {}

local ts_utils = require("nvim-treesitter.ts_utils")

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

return m
