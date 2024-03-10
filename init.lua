-- thingy for autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- I'm lazy
local map = vim.keymap.set
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local fn = vim.fn

-- Theme
opt.termguicolors = true
opt.syntax = on
autocmd("VimEnter", {
  callback = function()
    cmd.source '/home/mel/.config/nvim/colors/foggy-forest.lua'
    -- cmd.colorscheme 'foggy-forest.lua'
  end,
})

-- Finding the highlight group under the cursor
map('n', '<Space>o', ':Oil<CR>', { silent = true })
map('n', '<Space>]', function()
  for _, i1 in ipairs(fn.synstack(fn.line('.'), fn.col('.'))) do
    local i2 = fn.synIDtrans(i1)
    local group = fn.synIDattr(i2, 'name')
    local fg = fn.synIDattr(i2, 'fg#')
    local bg = fn.synIDattr(i2, 'bg#')
    print(group, "/", fg, "/", bg)
   end
end, {})

function GetSyntaxRegions()
    local line = vim.fn.line('.')
    local col = vim.fn.col('.')
    local synstack_ids = vim.fn.synstack(line, col)
    vim.print(line, col, synstack_ids)
    local regions = vim.tbl_map(function(id)
        return vim.fn.synIDattr(id, "name")
    end, synstack_ids)
    -- return regions
    return synstack_ids
end

map('n', '<Space>0', function()
  print(vim.inspect(GetSyntaxRegions()))
end, {})


-- Turning on spell check
opt.spell = true

-- conceallevel for latex
opt.conceallevel = 2
autocmd("BufEnter", {
  callback = function()
    opt.conceallevel = 2
  end,
})

-- indentation nonsense
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
-- opt.autoindent = false
-- vim.g.vimtex_indent_enabled = false

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
