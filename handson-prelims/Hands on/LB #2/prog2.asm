;France Raphael R. Rivera [J3A]

.model small
.stack 100h

.code
main proc
    mov ax, @data
    mov ds, ax
    
    msg label byte
    db "Hello World! Are you ready in CompOrg Programming?$"
    
    lea dx, msg
    mov ah, 09h
    int 21h
    
    mov ah, 4Ch
    int 21h
    
main endp
end main