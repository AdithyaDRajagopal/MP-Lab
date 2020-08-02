data segment
    arr dw 1111h,2222h,3333h,4444h,5555h
    count db 5
    result dw ?
data ends

code segment
assume cs:code, ds:data
start:
mov ax,data
mov ds,ax

lea si,arr
mov ax,0     
mov cl,count
up: add ax,[si]
    add si,2
    dec cl
    jnz up
    mov result,ax 
    
mov ah,4ch
int 21h
code ends
end start