data segment
    num db 00110001b  
    bcd dw ?
data ends

code segment
assume cs:code, ds:data
start:
mov ax,data
mov ds,ax

mov ah,0
mov al,num
mov bl,00001010b
div bl 
mov cl,6
mul cl
mov bh,0
mov bl,num
add ax,bx
mov bcd,ax
    
mov ah,4ch
int 21h
code ends
end start