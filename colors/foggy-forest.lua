vim.cmd.highlight("clear")

vim.opt.termguicolors = true
vim.g.colors_name = "foggy-forest"

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local colors = {
  bg0="#1c1f2e",
  bg1="#1f2735",
  bg2="#222e3b",
  bg3="#2a3d45",
  bg4="#2f444a",
  fg0="#ece6da",
  fg1="#c7c7b9",
  fg2="#a2a89b",
  fg3="#6d7c72",
  fg4="#4e615b",
  yellow0="#ddca22",
  yellow1="#e6cf57",
  yellow2="#ecd57f",
  yellow3="#efdba4",
}

-- Normal vim stuff
hi("Normal", { fg = colors.fg0, bg = colors.bg0 })
hi("Conceal", { fg = colors.fg0 })
hi("LineNr", { fg = colors.fg2, bg = colors.bg1 })
hi("CursorLineNr", { fg = colors.fg1, bg = colors.bg1 })
hi("Comment", { fg = colors.fg3, italic = true })
hi("CursorLine", { bg = colors.bg2 })


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
hi("lualine_b_command", { link = "lualine_a_normal" })
hi("lualine_c_command", { link = "lualine_a_normal" })
hi("lualine_x_command", { link = "lualine_c_normal" })
hi("lualine_y_command", { link = "lualine_b_normal" })
hi("lualine_z_command", { link = "lualine_a_normal" })
hi("lualine_transitional_lualine_a_command_to_lualine_c_command", { link = "lualine_transitional_lualine_a_normal_to_lualine_c_normal" })
-- Lualine insert
hi("lualine_a_insert", { link = "lualine_a_normal" })
hi("lualine_b_insert", { link = "lualine_a_normal" })
hi("lualine_c_insert", { link = "lualine_a_normal" })
hi("lualine_x_insert", { link = "lualine_c_normal" })
hi("lualine_y_insert", { link = "lualine_b_normal" })
hi("lualine_z_insert", { link = "lualine_a_normal" })
hi("lualine_transitional_lualine_a_insert_to_lualine_c_insert", { link = "lualine_transitional_lualine_a_normal_to_lualine_c_normal" })
-- Lualine visual
hi("lualine_a_visual", { link = "lualine_a_normal" })
hi("lualine_b_visual", { link = "lualine_a_normal" })
hi("lualine_c_visual", { link = "lualine_a_normal" })
hi("lualine_x_visual", { link = "lualine_c_normal" })
hi("lualine_y_visual", { link = "lualine_b_normal" })
hi("lualine_z_visual", { link = "lualine_a_normal" })
hi("lualine_transitional_lualine_a_visual_to_lualine_c_visual", { link = "lualine_transitional_lualine_a_normal_to_lualine_c_normal" })
        -- theme = {
        --   normal = {
        --     a = { bg = '#2f444a', fg = '#c7c7b9', gui = 'bold' },
        --     b = { bg = '#2f444a', fg = '#c7c7b9', gui = 'bold' },
        --     c = { bg = '#2f444a', fg = '#c7c7b9', gui = 'bold' },
        --   }
        -- },
-- " hi Error guifg=#e6cf57
-- " hi ErrorMsg guifg=#ecd57f
