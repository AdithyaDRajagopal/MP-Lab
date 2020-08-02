include 'emu8086.inc'

data segment             
    string db "Education","$" 
    vowel db ?
data ends

code segment
assume cs:code,ds:data    
start:
mov ax,data
mov ds,ax     
mov si,offset string
mov ah,0
up: mov al,[si]
    cmp al,'a'
    je found
    cmp al,'A'
    je found
    cmp al,'e'
    je found
    cmp al,'E'
    je found
    cmp al,'i'
    je found
    cmp al,'I'
    je found
    cmp al,'o'
    je found
    cmp al,'O'
    je found
    cmp al,'u'
    je found
    cmp al,'U'
    je found
    cmp al,'$'
    je exit
    jmp down
    
found: inc ah

down: inc si
      jmp up 
      
exit: mov vowel,ah

mov ah,4ch
int 21h
code ends  
end start