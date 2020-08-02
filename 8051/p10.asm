;Here n=49H.
;n is stored in the register R7.
;The decimal equivalent of n is stored in R0.
MOV R7,#49H
MOV A,R7
MOV B,#0AH
DIV AB
MOV B,#06H
MUL AB
ADD A,R7
MOV R0,A
STOP: SJMP STOP