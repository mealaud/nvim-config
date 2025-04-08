-- vim.cmd.highlight("clear")

vim.opt.termguicolors = true

vim.g.colors_name = "perfect-day"

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local colors = {
  clear= "",
  white= "#FFFFFF",
  bg0= "#f9f5d7",
  bg1= "#fbf1c7",
  bg2= "#ebdbb2",
  bg3= "#d5c4a1",
  fg0="#282828",
  fg1="#32302f",
  fg2="#504945",
  fg3="#427b58",
  fg4="#689d6a",
  yellow0="#ebdbb2",
  yellow1="#f2e50b",
  yellow2="#fabd2f",
  yellow3="#d79921",
}

-- Bufferline
hi("BufferLineBufferSelected", { fg = colors.bg0, bg = colors.yellow3 })
-- hi("BufferLineDevIconDefaultSelected", { fg = colors.bg0, bg = colors.yellow3 })

-- NORMAL VIM STUFF
hi("Normal", { fg = colors.white, bg = colors.clear })
hi("Conceal", { fg = colors.white })
hi("LineNr", { fg = colors.bg2, bg = colors.clear })
hi("CursorLineNr", { fg = colors.bg0, bg = colors.clear })
hi("Visual", { fg = colors.clear, bg = colors.yellow3 })
hi("Comment", { fg = colors.bg3, italic = true })
hi("CursorLine", { bg = colors.clear })
hi("NonText", { fg = colors.bg1, bg = colors.clear })


--- FLOATING POPUPS
hi("NormalFloat", { fg = colors.white, bg = colors.bg3 })


--- MARKDOWN SYNTAX HIGHLIGHTING
-- hi("markdownItalic", { link = "Normal" })
-- hi("markdownBold", )
hi("markdownH1", { fg = colors.yellow0, bold = true })
hi("markdownH2", { link = "markdownH1" })
hi("markdownH3", { fg = colors.yellow1, bold = true })
hi("markdownH4", { link = "markdownH3" })
hi("markdownH5", { fg = colors.yellow2, bold = true })
hi("markdownH6", { link = "markdownH5" })



--
-- LUALINE CUSTOMIZATION
--
-- Lualine normal
hi("lualine_a_normal", { fg = colors.fg1, bg = colors.clear, bold = true })
hi("lualine_b_normal", { link = "lualine_a_normal" })
hi("lualine_c_normal", { link = "lualine_a_normal" })
hi("lualine_x_normal", { link = "lualine_c_normal" })
hi("lualine_y_normal", { link = "lualine_b_normal" })
hi("lualine_z_normal", { link = "lualine_a_normal" })
hi("lualine_transitional_lualine_a_normal_to_lualine_c_normal", { bg = colors.clear })
-- Lualine command
hi("lualine_a_command", { link = "lualine_a_normal" })
hi("lualine_b_command", { link = "lualine_a_command" })
hi("lualine_c_command", { link = "lualine_a_command" })
hi("lualine_x_command", { link = "lualine_c_command" })
hi("lualine_y_command", { link = "lualine_b_command" })
hi("lualine_z_command", { link = "lualine_a_command" })
hi("lualine_transitional_lualine_a_command_to_lualine_c_command", { link = "lualine_transitional_lualine_a_normal_to_lualine_c_normal" })
-- Lualine insert
hi("lualine_a_insert", { link = "lualine_a_normal" })
hi("lualine_b_insert", { link = "lualine_a_insert" })
hi("lualine_c_insert", { link = "lualine_a_insert" })
hi("lualine_x_insert", { link = "lualine_c_insert" })
hi("lualine_y_insert", { link = "lualine_b_insert" })
hi("lualine_z_insert", { link = "lualine_a_insert" })
hi("lualine_transitional_lualine_a_insert_to_lualine_c_insert", { link = "lualine_transitional_lualine_a_normal_to_lualine_c_normal" })
-- Lualine visual
hi("lualine_a_visual", { link = "lualine_a_normal" })
hi("lualine_b_visual", { link = "lualine_a_visual" })
hi("lualine_c_visual", { link = "lualine_a_visual" })
hi("lualine_x_visual", { link = "lualine_c_visual" })
hi("lualine_y_visual", { link = "lualine_b_visual" })
hi("lualine_z_visual", { link = "lualine_a_visual" })
hi("lualine_transitional_lualine_a_visual_to_lualine_c_visual", { link = "lualine_transitional_lualine_a_normal_to_lualine_c_normal" })
-- File Diffs/edits
hi("lualine_y_diff_added_normal", { link = "lualine_a_normal" })
hi("lualine_y_diff_modified_normal", { link = "lualine_y_diff_added_normal" })
hi("lualine_y_diff_removed_normal", { link = "lualine_y_diff_added_normal" })
hi("lualine_y_diff_added_command", { link = "lualine_a_normal" })
hi("lualine_y_diff_modified_command", { link = "lualine_y_diff_added_command" })
hi("lualine_y_diff_removed_command", { link = "lualine_y_diff_added_command" })
hi("lualine_y_diff_added_visual", { link = "lualine_a_normal" })
hi("lualine_y_diff_modified_visual", { link = "lualine_y_diff_added_visual" })
hi("lualine_y_diff_removed_visual", { link = "lualine_y_diff_added_visual" })
hi("lualine_y_diff_added_insert", { link = "lualine_a_normal" })
hi("lualine_y_diff_modified_insert", { link = "lualine_y_diff_added_insert" })
hi("lualine_y_diff_removed_insert", { link = "lualine_y_diff_added_insert" })
