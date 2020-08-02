data segment
num1 db 10
num2 db 15
lcm db ?
gcd db ?
data ends

code segment
assume cs:code, ds:data
start:
mov ax,data
mov ds,ax
mov al,num1
mov bl,num2

l1: cmp al,bl    
    je l3
    cmp al,bl
    jl l2
    add bl,num2
    jmp l1

l2: add al,num1
    jmp l1

l3: mov lcm,al    

mov bl,lcm
mov cl,num2
mov al,num1
mul cl
div bl
mov gcd,al

mov ah,4ch
int 21h
code ends
end start