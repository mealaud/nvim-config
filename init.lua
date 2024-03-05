-- thingy for autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- I'm lazy
local opt = vim.opt
local g = vim.g

-- Theme
vim.cmd.colorscheme 'foggy-forest'
vim.cmd.syntax 'on'

-- conceallevel for latex
opt.conceallevel = 1

-- indentation nonsense
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.autoindent = false
vim.g.vimtex_indent_enabled = false

-- opt.textwidth = 55

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

-- package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", opts)

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


-- switch between buffers (i love buffferline)
map({'n', 'x'}, '<S-tab>', ':bn<CR>', { silent = true })
map({'n', 'x'}, '<S-x>', ':bd<CR>', { silent = true })

