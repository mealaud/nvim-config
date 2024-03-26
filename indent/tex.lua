function never_indent()
  return "0"
end
vim.opt_local.indentexpr = never_indent()
