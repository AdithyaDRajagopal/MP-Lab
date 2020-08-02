data segment
    num db 00110011b  
    bin db ?
data ends

code segment
assume cs:code, ds:data
start:
mov ax,data
mov ds,ax

mov ah,0
mov al,num
mov bl,00010000b
div bl 
mov cl,6
mul cl
mov bh,0
mov bl,num
sub bl,al
mov bin,bl
    
mov ah,4ch
int 21h
code ends
end start