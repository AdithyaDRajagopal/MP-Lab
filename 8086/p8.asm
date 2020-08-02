include 'emu8086.inc'

data segment
num1 dw 5
num2 dw 8
data ends

code segment
assume cs:code,ds:data    
start:
mov ax,data
mov ds,ax
push num1
CALL check
push num2
CALL check
mov ah,4ch
int 21h  

check PROC
    mov bx,sp
    add bx,2
    mov ax,[bx]
    CALL print_num
    ror ax,1
    jnc pve
    PRINTN " is ODD"
    jmp final

    pve: PRINTN " is EVEN"

    final:
    RET
check ENDP

code ends  
DEFINE_PRINT_NUM 
DEFINE_PRINT_NUM_UNS
end start