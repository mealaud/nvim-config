" Custom conceal
syntax match texMathCmd "\\operatorname{.*}" conceal cchar= 
syntax match texGroupError "}" conceal cchar= 
setlocal conceallevel=1
