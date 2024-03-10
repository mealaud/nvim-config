" Custom conceal
syntax match texMathDelimMod "\s*\\left\s*" conceal
syntax match texMathDelimMod "\s*\\right\s*" conceal
" syntax cluster mathMode contains=texMathDelimZoneTD,texMathDelimZoneTI
" syntax match texMathDelimZoneTD  conceal
" syntax match texMathDelimZoneTI  conceal
" syntax match mathMode  conceal
setlocal conceallevel=1
