;Here n=33.
;n is stored in the register R7.
;The hexadecimal equivalent of n is stored in R0.
MOV R7,#33H
MOV A,R7
MOV B,#10H
DIV AB
MOV B,#06H
MUL AB
MOV R0,A
MOV A,R7
SUBB A,R0
MOV R0,A
STOP: SJMP STOP