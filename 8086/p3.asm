data segment
    arr db 23h,43h,12h,54h,36h  
    count db 5
data ends

code segment
assume cs:code, ds:data
start:
mov ax,data
mov ds,ax
mov cl,count

loop1: lea si,arr
       mov ch,cl
       dec ch
       jz final

loop2: mov ah,[si]
       inc si
       mov al,[si]
       dec si
       cmp ah,al
       jc term
       xchg al,[si]
       inc si
       xchg ah,[si]
       dec si
       
term: inc si
      dec ch
      jnz loop2
      dec cl
      jnz loop1

final:
mov ah,4ch
int 21h
code ends

end start
