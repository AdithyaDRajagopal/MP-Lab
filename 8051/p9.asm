MOV R4,#05H
AGAIN: MOV R3,#04H
       MOV R0,#20H
       CLR C
UP:    MOV A,@R0
       MOV R1,A
       INC R0
       MOV A,@R0
       SUBB A,R1
       JNC SKIP
       MOV A,@R0
       DEC R0
       MOV @R0,A
       MOV A,R1
       INC R0
       MOV @R0,A
SKIP:  DJNZ R3,UP
       DJNZ R4,AGAIN
STOP:  SJMP STOP