;Here n=5H
;n is stored in R7
;n! is stored in R0
MOV R7,#05h
MOV B,R7
MOV R6,B
MOV A,#01h
LOOP: MOV B,R6
      MUL AB
      DJNZ R6,LOOP
MOV R0,A
STOP: SJMP STOP