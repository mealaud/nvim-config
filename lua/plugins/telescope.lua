return {
  {
    'nvim-telescope/telescope.nvim', 
    version = '*', 
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
       -- Environments
      vim.env.DOTS = '/home/mel/.config/'
      vim.env.NVIM = '/home/mel/.config/nvim/'
      vim.env.MATHC = '/home/mel/math/'
      vim.env.MATHO = '/home/mel/math/old/'
      vim.env.LATEX = '/home/mel/math/tex/'
      vim.env.WEBSITE = '/home/mel/mealaud.github.io/'
      vim.env.PDFS = '/home/mel/'

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

      vim.keymap.set('n', '<leader>n', function()
        require('telescope.builtin').find_files({
          prompt_title = 'NVIM',
          cwd = vim.env.NVIM
        })
      end, { silent = true })

      vim.keymap.set('n', '<leader>c', function()
        require('telescope.builtin').find_files({
          prompt_title = 'NVIM Config',
          cwd = vim.env.NVIM
        })
      end, { silent = true })

      vim.keymap.set('n', '<leader>mc', function()
        require('telescope.builtin').find_files({
          prompt_title = 'Current Math TEXs',
          cwd = vim.env.MATHC,
          file_ignore_patterns = {
             -- Tex temporary files
             "%.out",
             "%.aux",
             -- "%.pdf",
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
             "old/.*",
             "tex/.*",
          }
        })
      end, { silent = true })

      vim.keymap.set('n', '<leader>mo', function()
        require('telescope.builtin').find_files({
          prompt_title = 'Old Math TEXs',
          cwd = vim.env.MATHO,
          file_ignore_patterns = {
             -- Tex temporary files
             "%.out",
             "%.aux",
             -- "%.pdf",
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

      vim.keymap.set('n', '<leader>d', function()
        require('telescope.builtin').find_files({
          prompt_title = 'PDFs',
          cwd = vim.env.PDFS,
          search_file = "*.pdf",
        })
      end, { silent = true })

      vim.keymap.set('n', '<leader>t', function()
        require('telescope.builtin').find_files({
          prompt_title = 'LaTeX',
          cwd = vim.env.LATEX,
          search_file = "*.tex",
        })
      end, { silent = true })

      vim.keymap.set('n', '<leader>h', require('telescope.builtin').help_tags, { silent = true })

      vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { silent = true })

      vim.keymap.set('n', '<leader>.', function()
        require('telescope.builtin').find_files({
          prompt_title = 'Dot Files',
          cwd = vim.env.DOTS,
          hidden = true,
          search_dirs = {
            "newhome",
            "zathura",
            "sxhkd",
            "kitty",
            "polybar",
            "bspwm",
            "dunst",
            ".scripts",
          },
          -- search_file = {
          --   ".fehbg",
          --   ".xinitrc",
          --   ".zshrc",
          -- },
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
