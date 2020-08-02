include 'emu8086.inc'

data segment             
    CALL pthis
    str1 db "malayalam","$",0 
    str2 db "Hello","$",0
data ends

code segment
assume cs:code,ds:data    
start:
mov ax,data
mov ds,ax     
mov si,offset str1    
CALL print_string
mov di,offset str1
CALL palindrome     
mov si,offset str2    
CALL print_string
mov di,offset str2
CALL palindrome  
mov ah,4ch
int 21h  

palindrome PROC
    loop1: mov ax,[si]
           cmp al,'$'
           je l1
           inc si
           jmp loop1
    
    l1: dec si
          
    loop2: mov al,[si]
           mov bl,[di]
           cmp al,bl
           je l2
           jmp l3
          
    l2: inc di
        dec si
        cmp si,di
        jge loop2 
        jmp l4
        
    l3: PRINTN " is NOT palindrome"
        jmp final
        
    l4: PRINTN " is palindrome"
    
    final:  
    RET
palindrome ENDP

code ends  
DEFINE_PTHIS     
DEFINE_PRINT_STRING
end start