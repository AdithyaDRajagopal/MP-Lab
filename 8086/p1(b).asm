data segment
    arr1 dw 1111h,2222h,3333h,4444h,5555h
    arr2 dw 1000h,2000h,3000h,4000h,5000h
    count db 5
    result dw ?,?,?,?,?
data ends

code segment
assume cs:code, ds:data
start:
mov ax,data
mov ds,ax

lea si,arr1
lea di,arr2
lea bx,result     
mov cl,count
up: mov ax,0
    add ax,[si]
    sub ax,[di]
    mov [bx],ax
    add si,2  
    add di,2
    add bx,2
    dec cl
    jnz up 
    
mov ah,4ch
int 21h
code ends
end start