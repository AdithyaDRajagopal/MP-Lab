data segment
    num db 5h
    result db ?
data ends

code segment
assume cs:code, ds:data
start:
mov ax,data
mov ds,ax
mov cl,num
mov al,1

up: mul cl
    dec cl
    jnz up 

mov result,al
mov ah,4ch
int 21h
code ends

end start