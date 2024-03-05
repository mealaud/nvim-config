" Vim color file
" foggy-forest
" Created by mel guy with ThemeCreator (https://github.com/mswift42/themecreator)

hi clear

if exists("syntax on")
syntax reset
endif

set t_Co=256
let g:colors_name = "foggy-forest"


" Define reusable colorvariables.
let s:bg="#1c1f2e"
let s:fg="#ece6da"
let s:fg2="#d9d4c9"
let s:fg3="#c6c1b7"
let s:fg4="#b3afa6"
let s:bg2="#2e313f"
let s:bg3="#40434f"
let s:bg4="#525560"
let s:keyword="#d4d4d4"
let s:builtin="#d4d4d4"
let s:const= "#d4d4d4"
let s:comment="#4e615b"
let s:func="#d4d4d4"
let s:str="#4e615b"
let s:type="#d4d4d4"
let s:var="#d4d4d4"
let s:warning="#f5ec00"
let s:warning2="#fffbb9"

exe 'hi Normal ctermfg='s:fg' ctermbg='s:bg
exe 'hi Cursor ctermfg='s:bg' ctermbg='s:fg
exe 'hi CursorLine  ctermbg='s:bg2
exe 'hi CursorLineNr ctermfg='s:str' ctermbg='s:bg
exe 'hi CursorColumn  ctermbg='s:bg2
exe 'hi ColorColumn  ctermbg='s:bg2
exe 'hi FoldColumn ctermfg='s:comment' ctermbg='s:bg2
exe 'hi SignColumn ctermfg='s:comment' ctermbg='s:bg2
exe 'hi LineNr ctermfg='s:fg2' ctermbg='s:bg2
exe 'hi CursorLineNr ctermfg='s:fg' ctermbg='s:bg2
exe 'hi VertSplit ctermfg='s:fg3' ctermbg='s:bg3
exe 'hi MatchParen ctermfg='s:warning2'  gui=underline'
exe 'hi StatusLine ctermfg='s:fg2' ctermbg='s:bg3' gui=bold'
exe 'hi Pmenu ctermfg='s:fg' ctermbg='s:bg2
exe 'hi PmenuSel  ctermbg='s:bg3
exe 'hi IncSearch ctermfg='s:bg' ctermbg='s:keyword
exe 'hi Search   gui=underline'
exe 'hi Directory ctermfg='s:const
exe 'hi Folded ctermfg='s:fg4' ctermbg='s:bg
exe 'hi WildMenu ctermfg='s:str' ctermbg='s:bg

exe 'hi Boolean ctermfg='s:const
exe 'hi Character ctermfg='s:const
exe 'hi Comment ctermfg='s:comment
exe 'hi Conditional ctermfg='s:keyword
exe 'hi Constant ctermfg='s:const
exe 'hi Todo ctermbg='s:bg
exe 'hi Define ctermfg='s:keyword
exe 'hi DiffAdd ctermfg=#fafafa ctermbg=#123d0f gui=bold'
exe 'hi DiffDelete ctermbg='s:bg2
exe 'hi DiffChange  ctermbg=#151b3c ctermfg=#fafafa'
exe 'hi DiffText ctermfg=#ffffff ctermbg=#ff0000 gui=bold'
exe 'hi ErrorMsg ctermfg='s:warning' ctermbg='s:bg2' gui=bold'
exe 'hi WarningMsg ctermfg='s:fg' ctermbg='s:warning2
exe 'hi Float ctermfg='s:const
exe 'hi Function ctermfg='s:func
exe 'hi Identifier ctermfg='s:type'  gui=italic'
exe 'hi Keyword ctermfg='s:keyword'  gui=bold'
exe 'hi Label ctermfg='s:var
exe 'hi NonText ctermfg='s:bg4' ctermbg='s:bg2
exe 'hi Number ctermfg='s:const
exe 'hi Operator ctermfg='s:keyword
exe 'hi PreProc ctermfg='s:keyword
exe 'hi Special ctermfg='s:fg
exe 'hi SpecialKey ctermfg='s:fg2' ctermbg='s:bg2
exe 'hi Statement ctermfg='s:keyword
exe 'hi StorageClass ctermfg='s:type'  gui=italic'
exe 'hi String ctermfg='s:str
exe 'hi Tag ctermfg='s:keyword
exe 'hi Title ctermfg='s:fg'  gui=bold'
exe 'hi Todo ctermfg='s:fg2'  gui=inverse,bold'
exe 'hi Type ctermfg='s:type
exe 'hi Underlined   gui=underline'

" Neovim Terminal Mode
let g:terminal_color_0 = s:bg
let g:terminal_color_1 = s:warning
let g:terminal_color_2 = s:keyword
let g:terminal_color_3 = s:bg4
let g:terminal_color_4 = s:func
let g:terminal_color_5 = s:builtin
let g:terminal_color_6 = s:fg3
let g:terminal_color_7 = s:str
let g:terminal_color_8 = s:bg2
let g:terminal_color_9 = s:warning2
let g:terminal_color_10 = s:fg2
let g:terminal_color_11 = s:var
let g:terminal_color_12 = s:type
let g:terminal_color_13 = s:const
let g:terminal_color_14 = s:fg4
let g:terminal_color_15 = s:comment
