data segment
num db 01001001b
noof0 db ?
noof1 db ?
data ends

code segment
assume cs:code,ds:data    
start:
mov ax,data
mov ds,ax

mov al,num
mov cl,8
mov bx,0

up: ror al,1
    jc one
    inc bl
    jmp down
    
one: inc bh

down: dec cl
      jnz up

mov noof0,bl
mov noof1,bh

mov ah,4ch
int 21h  
code ends  
end start