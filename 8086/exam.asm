include 'emu8086.inc'

data segment
    ;Declare the string and a variable for storing the result             
    CALL pthis
    string db "consonants","$"
    result db ?
data ends

code segment
assume cs:code,ds:data    
start:
mov ax,data
mov ds,ax  

;Initialize SI and DI to the starting address of string and result
;respectively   
mov si,offset string  
mov di,offset result  

;Initialize BX to the starting address of string
mov bx,si

;Traverse to the end of string
loop1: inc si
       mov al,[si]
       cmp al,'$'
       jne loop1

 
rev: cmp bx,si      ;If SI returns back to the starting address of string,
     jz exit        ;   exit the loop
     dec si         ;Decrement SI
     mov al,[si]    ;Store the character at [SI] to [DI]
     mov [di],al
     inc di         ;Increment DI
     jmp rev 

exit: mov al,"$"    ;End the result with a $ symbol
      mov [di],al

;Now, we have the reverse of string stored in the result                                                   
;Initialize SI to result to change the vowels to nearest consonants                                                   
PRINT "Reversed string : "
mov si,offset result  
CALL print_string 
PRINTN " "
 
up: mov al,[si]
    cmp al,'a'   ;If the character in [SI] is a vowel, goto vowel
    je vowel
    cmp al,'A'
    je vowel
    cmp al,'e'
    je vowel
    cmp al,'E'
    je vowel
    cmp al,'i'
    je vowel
    cmp al,'I'
    je vowel
    cmp al,'o'
    je vowel
    cmp al,'O'
    je vowel
    cmp al,'u'
    je vowel
    cmp al,'U'
    je vowel
    cmp al,'$'    ;If the character in [SI] is '$', exit the loop
    je final
    jmp down
    
vowel: inc al     ;If the character in [SI] is a vowel increment it

down: mov [si],al 
      inc si
      jmp up        

final: PRINT "Replace with consonant : "
       mov si,offset result
       CALL print_string

mov ah,4ch
int 21h
code ends 
DEFINE_PTHIS
DEFINE_PRINT_STRING
end start