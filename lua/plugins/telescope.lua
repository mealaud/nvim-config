return {
  {
    'nvim-telescope/telescope.nvim', 
    version = '*', 
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
       -- Environments
      vim.env.CONFIG = '~/.config/nvim/'
      vim.env.MATH = '~/math/'
      vim.env.LATEX = '~/latex/'
      vim.env.WEBSITE = '~/websites/mealaud.github.io'
      vim.env.TESTTHEME = '~/websites/mealaud.github.io/themes/hugo-starter-theme'

      -- Telescope keymaps
      vim.keymap.set('n', '<leader>rg', require('telescope.builtin').live_grep)

      vim.keymap.set('n', '<leader>me', function()
        require('telescope.builtin').find_files({
          prompt_title = 'Website',
          cwd = vim.env.WEBSITE,
          file_ignore_patterns = {
            "themes/.*",
          }
        })
      end, { silent = true })

      vim.keymap.set('n', '<leader>th', function()
        require('telescope.builtin').find_files({
          prompt_title = 'Website Theme',
          cwd = vim.env.TESTTHEME,
          file_ignore_patterns = {
            "static/font/.*",
          }
        })
      end, { silent = true })

      vim.keymap.set('n', '<leader>c', function()
        require('telescope.builtin').find_files({
          prompt_title = 'Config',
          cwd = vim.env.CONFIG
        })
      end, { silent = true })

      vim.keymap.set('n', '<leader>mp', function()
        require('telescope.builtin').find_files({
          prompt_title = 'Math PDFs',
          cwd = vim.env.MATH,
          file_ignore_patterns = {
             -- Tex temporary files
             "%.out",
             "%.aux",
             "%.tex",
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
}
