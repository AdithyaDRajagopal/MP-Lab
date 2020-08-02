;Here the numbers are stored in the location 0000H.
;The number being checked is stored in R7.
;If the number is negative, R0 is set to 1.
;Otherwise R0 is set to 0.
MOV DPTR,#0000H
MOVX A,@DPTR
MOV R7,A
RLC A
JNC PVE
MOV R0,#01H
SJMP STOP
PVE:  MOV R0,#00H
STOP: SJMP STOP