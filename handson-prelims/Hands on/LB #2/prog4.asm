;France Raphael R. Rivera [J3A]

.model small
.stack 100h
 
.code
main proc
    mov ax, @data
    mov ds, ax
     
    msg label byte
    db "Hello World! No LEA, no .data segment, with OFFSET!$"
     
    mov dx, offset msg
    mov ah, 09h
    int 21h
     
    mov ah, 4Ch
    int 21h
main endp
end main