" Vim color file
" foggy-forest
" Created by mel guy with ThemeCreator (httpg://github.com/mswift42/themecreator)

hi clear

if exists("syntax on")
  syntax reset
endif

set termguicolors
set t_Co=256
let g:colors_name = "foggy-forest"


" Define reusable colorvariables.
let g:bg0="#1c1f2e"
let g:bg1="#1f2735"
let g:bg2="#222e3b"
let g:bg3="#2a3d45"
let g:bg4="#2f444a"
let g:fg0="#ece6da"
let g:fg1="#c7c7b9"
let g:fg2="#a2a89b"
let g:fg3="#6d7c72"
let g:fg4="#4e615b"
let g:yellow0="#ddca22"
let g:yellow1="#e6cf57"
let g:yellow2="#ecd57f"
let g:yellow3="#efdba4"

" exe "hi Normal guifg=" + g:fg0 + " guibg=" + g:bg0
hi Normal guifg=#ece6da guibg=#1c1f2e
hi Conceal guibg=clear
hi LineNr guifg=#a2a89b guibg=#1f2735
hi Comment guifg=#6d7c72 gui=italic
hi Error guifg=#e6cf57
hi ErrorMsg guifg=#ecd57f
