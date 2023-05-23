return {
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'gruvbox',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
      },

      sections = {
        lualine_a = {'mode'},
        lualine_b = {''},
        lualine_c = {''},
        lualine_x = {''},
        lualine_y = {'diff'},
        lualine_z = {'filename'}
  	  },
    }
}
