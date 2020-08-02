;Here n1=50H and n2=9H.
;The MSB and LSB of product are stored in R4 and R3 respectively.
;The quotient and remainder are stored in R1 and R0 respectively.
MOV R7,#50H
MOV R6,#9H
MOV A,R7
MOV B,R6
MUL AB
MOV R4,B
MOV R3,A
MOV A,R7
MOV B,R6
DIV AB
MOV R1,A
MOV R0,B
STOP: SJMP STOP