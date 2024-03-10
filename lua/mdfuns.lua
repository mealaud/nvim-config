local m = {}

function GetSyntaxRegions()
    local line = vim.fn.line('.')
    local col = vim.fn.col('.')
    local synstack_ids = vim.fn.synstack(line, col)
    local regions = vim.tbl_map(function(id)
        return vim.fn.synIDattr(id, "name")
    end, synstack_ids)
    return regions
end

m.in_mathzone = function()
  local regions = GetSyntaxRegions()
  for _, r in ipairs(regions) do
    if r == "mkdMath" then
      return true
    end
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
