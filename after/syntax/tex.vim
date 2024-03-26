" Custom conceal
" highlight link texMathDelimMod Conceal
" syntax match texMathDelimMod "\s*\\left\s*" conceal cchar= 
" syntax match texMathDelimMod "\s*\\right\s*" conceal cchar= 
syntax match texMathDelimMod "\s*\\left\s*" conceal
syntax match texMathDelimMod "\s*\\right\s*" conceal
" syntax match texMathZone " _" conceal
syntax match texMathCmd "\\uplus" conceal cchar=⊎
syntax match texMathCmd "\\not\s*\\in" conceal cchar=∉
syntax match texMathCmd "\\not\s*\\ni" conceal cchar=∌
syntax match texMathCmd "\\not\s*\\subseteq" conceal cchar=⊈
syntax match texMathCmd "\\not\s*\\supseteq" conceal cchar=⊉
syntax match texMathCmd "\\not\s*\\exists" conceal cchar=∄
setlocal conceallevel=1
