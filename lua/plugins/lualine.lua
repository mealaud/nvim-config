
return {
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        -- theme = "foggy-forest",
        -- theme = {
        --   normal = {
        --     a = { bg = '#2f444a', fg = '#c7c7b9', gui = 'bold' },
        --     b = { bg = '#2f444a', fg = '#c7c7b9', gui = 'bold' },
        --     c = { bg = '#2f444a', fg = '#c7c7b9', gui = 'bold' },
        --   }
        -- },
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        component_separators = '',
        section_separators = '',
      },

      sections = {
        lualine_a = {'mode'},
        lualine_b = {'searchcount'},
        lualine_c = {''},
        lualine_x = {''},
        lualine_y = {'diff'},
        lualine_z = {'filename'}
  	  },
    }
}
