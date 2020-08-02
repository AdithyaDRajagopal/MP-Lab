include 'emu8086.inc'

data segment             
    string db "MICROPROCESSOR","$",13,10
data ends

code segment
assume cs:code,ds:data    
start:
mov ax,data
mov ds,ax 
PRINT "OLD STRING : "
mov si,offset string  
CALL print_string
mov bl,20h   

up: mov al,[si]
    cmp al,"$"
    je down
    add al,bl
    mov [si],al
    inc si
    jmp up
    
down: mov si,offset string

PRINT "NEW STRING : "
CALL print_string
mov ah,4ch
int 21h
code ends
DEFINE_PRINT_STRING  
end start