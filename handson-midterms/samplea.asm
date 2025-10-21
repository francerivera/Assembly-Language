; France Raphael R. Rivera
; J3A - Assembly LAB
; Activity Procedure A

title samplea.asm
.model small
.stack 100h

.data
    var db "WELCOME TO ASSEMBLY LANGUAGE $"

.code
clear proc near
    mov ah, 06h  
    mov bh, 17h     
    mov cx, 0000h
    mov dx, 184fh
    int 10h
    ret
clear endp

start:
body proc far
    mov ax, @data  
    mov ds, ax

    call clear 

    mov ah, 09h
    mov dx, offset var
    int 21h

    mov ah, 4ch
    int 21h

body endp
end start
