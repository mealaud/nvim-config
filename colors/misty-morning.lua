-- vim.cmd.highlight("clear")

vim.opt.termguicolors = true

vim.g.colors_name = "misty-morning"

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local colors = {
  bg0="#e1f6fb",
  bg1="#b4e9f5",
  bg2="#9ee2f2",
  bg3="#71d5ec",
  bg4="#65bfd4",
  fg0="#1c1f2e",
  fg1="#1f2735",
  fg2="#222e3b",
  fg3="#2a3d45",
  fg4="#2f444a",
  yellow0="#ddca22",
  yellow1="#e6cf57",
  yellow2="#ecd57f",
  yellow3="#efdba4",
}

-- Bufferline
hi("BufferLineBufferSelected", { fg = colors.bg0, bg = colors.yellow3 })
-- hi("BufferLineDevIconDefaultSelected", { fg = colors.bg0, bg = colors.yellow3 })

-- NORMAL VIM STUFF
hi("Normal", { fg = colors.fg0, bg = colors.bg0 })
hi("Conceal", { fg = colors.fg0 })
hi("LineNr", { fg = colors.fg2, bg = colors.bg1 })
hi("CursorLineNr", { fg = colors.fg1, bg = colors.bg1 })
hi("Visual", { fg = colors.bg0, bg = colors.yellow3 })
hi("Comment", { fg = colors.fg3, italic = true })
hi("CursorLine", { bg = colors.bg2 })
hi("NonText", { fg = colors.fg3, bg = colors.bg2 })


--- FLOATING POPUPS
hi("NormalFloat", { fg = colors.fg0, bg = colors.bg0 })


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
hi("lualine_a_normal", { fg = colors.fg1, bg = colors.bg4, bold = true })
hi("lualine_b_normal", { link = "lualine_a_normal" })
hi("lualine_c_normal", { link = "lualine_a_normal" })
hi("lualine_x_normal", { link = "lualine_c_normal" })
hi("lualine_y_normal", { link = "lualine_b_normal" })
hi("lualine_z_normal", { link = "lualine_a_normal" })
hi("lualine_transitional_lualine_a_normal_to_lualine_c_normal", { bg = colors.bg4 })
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
