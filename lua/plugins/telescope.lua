return {
  {
    'nvim-telescope/telescope.nvim', 
    version = '*', 
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
       -- Environments
      vim.env.CONFIG = '/home/mel/.config/nvim/'
      vim.env.MATH = '/home/mel/math/'
      vim.env.LATEX = '/home/mel/tex/'
      vim.env.WEBSITE = '/home/mel/mealaud.github.io'

      -- Telescope keymaps
      vim.keymap.set('n', '<leader>rg', require('telescope.builtin').live_grep)

      vim.keymap.set('n', '<leader>me', function()
        require('telescope.builtin').find_files({
          prompt_title = 'Website',
          cwd = vim.env.WEBSITE,
          file_ignore_patterns = {
            "themes/.*",
            "public/.*",
            "static/svgs/.*",
            "static/fonts/.*",
            "static/logo/.*",
            "static/images/.*",
            "%.PNG",
            "%.png",
            "%.JPG",
            "%.jpg",
            "%.JPEG",
            "%.jpeg",
            "%.woff",
            "%.woff2",
            "%.ttf",
            "%.eot",
            "%.svg",
          }
        })
      end, { silent = true })

      vim.keymap.set('n', '<leader>c', function()
        require('telescope.builtin').find_files({
          prompt_title = 'Config',
          cwd = vim.env.CONFIG
        })
      end, { silent = true })

      vim.keymap.set('n', '<leader>mt', function()
        require('telescope.builtin').find_files({
          prompt_title = 'Math TEXs',
          cwd = vim.env.MATH,
          file_ignore_patterns = {
             -- Tex temporary files
             "%.out",
             "%.aux",
             "%.pdf",
             "%.bbl",
             "%.bcf",
             "%.blg",
             "%.fdb_latexmk",
             "%.fls",
             "%.log",
             "%.pdf_tex",
             "%.synctex.gz",
             "%.ttf",
             "%.xdv",
             "%.toc",
          }
        })
      end, { silent = true })

      vim.keymap.set('n', '<leader>t', function()
        require('telescope.builtin').find_files({
          prompt_title = 'LaTeX',
          cwd = vim.env.LATEX,
          search_file = "*.tex"
        })
      end, { silent = true })

      vim.keymap.set('n', '<leader>h', require('telescope.builtin').help_tags, { silent = true })

      -- vim.keymap.set('n', '<leader>fi', function()
      --   require('telescope.builtin').find_files({
      --     prompt_title = 'i3',
      --     cwd = '~/.config/i3/'
      --   })
      -- end, { silent = true })

      vim.keymap.set('n', '<leader>f.', function()
        require('telescope.builtin').find_files({
          prompt_title = 'Dot Files',
          cwd = '~/.config/',
          file_ignore_patterns = {
            "discord",
            "nvim",
            "spotify",
          }
        })
      end, { silent = true })

       -- beautification
      local actions = require('telescope.actions')
      require('telescope').setup({
        defaults = {
          prompt_prefix = ' 🔭 ',
          selection_caret = ' 🔍 ',
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.6,
            }
          }
        }
      })
    end, -- end for the config function
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },
  {
    'olacin/telescope-cc.nvim',
  },
}
