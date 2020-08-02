include 'emu8086.inc'

data segment
    num1 dw 01001001b
    num2 dw 10100101b
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
    mov bx,ax
    mov bh,al
    mov al,0
    mov cl,8
    mov ch,2
    up: mul ch
        ror bx,1
        jnc dwn
        inc al
    dwn: dec cl
         jnz up
         
    cmp bh,al
    je final
    PRINTN " is NOT bitwise palindrome"
    jmp term
    final: PRINTN " is bitwise palindrome"
    term:
    RET
check ENDP

code ends  
DEFINE_PRINT_NUM 
DEFINE_PRINT_NUM_UNS
end start