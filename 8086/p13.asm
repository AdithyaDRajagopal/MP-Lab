include 'emu8086.inc'

data segment
    CALL pthis             
    string db "MICROPROCESSOR","$",13,10,0
    sub1 db "HELLO","$",13,10,0           
    sub2 db "PROC","$",13,10,0  
data ends

code segment
assume cs:code,ds:data    
start:
mov ax,data
mov ds,ax 

PRINT "STRING : "
mov si,offset string  
CALL print_string  
PRINT "SUBSTRING 1 : "
mov si,offset sub1  
CALL print_string 
mov si,offset string  
mov di,offset sub1
CALL substring  
PRINT "SUBSTRING 2 : "
mov si,offset sub2  
CALL print_string 
mov si,offset string  
mov di,offset sub2
CALL substring
mov ah,4ch
int 21h   

substring PROC
    mov cl,0
    mov ch,0
    loop1: mov al,[si]
           cmp al,"$"
           je exit
           mov ah,[di]
           cmp al,ah
           jne down
           mov bx,si
           mov dx,di
           mov ch,1
           
    loop2: mov al,[si]
           mov ah,[di]
           cmp ah,"$"
           je exit
           cmp al,ah
           jne reset
           inc si
           inc di 
           jmp loop2
    
    reset: mov ch,0 
           mov di,dx
           mov si,bx
    down: inc si
          inc cl       
          jmp loop1
          
    exit: cmp ch,0
          jne found
          PRINTN "SUBSTRING NOT FOUND"
          jmp final
    found: PRINT "SUBSTRING FOUND AT INDEX : "      
           mov al,cl
           mov ah,0
           CALL print_num
                        
    final:                                   
    RET
substring ENDP

code ends
DEFINE_PTHIS
DEFINE_PRINT_STRING  
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
end start