;France Raphael R. Rivera

.model small
.stack 100h
 
.data
line1 db "Hello World!$"
line2 db "Are you ready in CompOrg Programming?$"
 
.code
main proc
    mov ax, @data
    mov ds, ax
     
    ; Display first line
    lea dx, line1
    mov ah, 09h
    int 21h
     
    ; New line
    mov ah, 02h
    mov dl, 0Dh  ; Carriage Return
    int 21h
     
mov dl, 0Ah  ; Line Feed
    int 21h
     
    ; Display second line
    lea dx, line2
    mov ah, 09h
    int 21h
    
    mov ah, 4Ch
    int 21h
main endp
 
end main