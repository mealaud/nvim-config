-- thingy for autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- I'm lazy
local opt = vim.opt
local g = vim.g

-- indentation nonsense
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2

-- Set cursor line settings
opt.wrap = true
opt.cursorline = true
opt.breakindent = true
opt.linebreak = true

-- Force vertical splits to always open on the right
opt.splitright = true

-- clipboard shared across system
opt.clipboard = "unnamedplus"

-- line number stuf-- Setup smarter search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Setting up line numbering
opt.number = true
opt.relativenumber = true
opt.scrolloff = 20

-- set up basic keymaps
local map = vim.keymap.set

-- Access init.lua and plugins.lua
map('n', '<Space>s', ':edit $MYVIMRC<CR>', { silent = true })
-- Go to beginning and end of line
map('n', 'H', '^', {})
map('n', 'L', '$', {})
-- Update/save a file (normal and insert modes different bc think about it)
-- function to update website map if in teh correct directory!
local dataFiles = {["mealaud.github.io/content/map/allpagesgraphdata.json"] = true}
local function update_map_data()
  if string.find(vim.fn.getcwd(), "mealaud.github.io") ~= nil then
    if dataFiles[vim.cmd("file!")] == nil then
      os.execute("~/mealaud.github.io/updatemap.sh")
    end
  end
  vim.cmd("write!")
end
vim.keymap.set('n', '<C-s>', update_map_data, { silent = true })
map({'i', 'x'}, '<C-s>', update_map_data, { silent = true })
-- Buffer navigatin'
map('n', '<C-h>', '<C-w>h', { silent = true })
map('n', '<C-j>', '<C-w>j', { silent = true })
map('n', '<C-k>', '<C-w>k', { silent = true })
map('n', '<C-l>', '<C-w>l', { silent = true })

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
g.mapleader = ' '
g.maplocalleader = ' '

-- Highlight yanked text
local highlightYank = augroup("highlightYank", {})
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 300 })
    end,
    group = highlightYank,
})

-- Opens PDF files in Zathura instead of viewing the binary in Neovim
local openPDF = augroup("openPDF", {})
autocmd("BufReadPost", {
    pattern = {
        "*.pdf",
    },
    callback = function()
        vim.fn.jobstart('zathura "' .. vim.fn.expand("%") .. '"', {
            detach = true,
        })
        vim.api.nvim_buf_delete(0, {})
    end,
    group = openPDF,
})

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter = blob:none',
    'https://github.com/folke/lazy.ngit',
    '--branch = stable', -- latest stable release
    lazypath,
  }
end
opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup('plugins')

-- Converting to website katex format ezpz
-- map({'n', 'i'}, '<M-t>', function() 
--   vim.cmd.write()
--   local commands = {
--     "cat '" .. vim.fn.expand("%") .. "'",
--     [[sed -E 's/\$([^$]+)\$/[katex]\1[\/katex]/g']],
--     [[sed -E 's/\\\[/[katex display=true]/g']],
--     [[sed -E 's/\\\]/[\/katex]/g']],
--     [[xclip -selection clipboard]],
--   }
--   vim.fn.jobstart(table.concat(commands, " | "), {detach = true})
-- end)

-- Begin compilation for .tex files
map('n', '<M-s>', ':VimtexCompile<CR>', { silent = true })
map({'i', 'x'}, '<M-s>', '<Esc>:VimtexCompile<CR>a', { silent = true })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Telescope binds
-- Telescope configuration
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local actions = require("telescope.actions")
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["q"] = require("telescope.actions").close,
      }
    },
  },
}


-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- map('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- switch between buffers (i love buffferline)
map({'n', 'x'}, '<S-tab>', ':bn<CR>', { silent = true })
map({'n', 'x'}, '<S-x>', ':bd<CR>', { silent = true })

