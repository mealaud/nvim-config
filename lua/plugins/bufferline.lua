return {
  'akinsho/bufferline.nvim', 
  version = "v3.*", 
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup{
      options = {
        buffer_close_icon = '×',
        close_icon = '×',
        -- color_icons = true,
        -- get_element_icon = function(element)
        --   local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(vim.opt.filetype, { default = true })
        --   return icon, hl
        -- end,
        -- show_buffer_icons = true,
      }
    }
  end,
}
