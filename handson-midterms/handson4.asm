; France Raphael R. Rivera
; J3A - Assembly LAB
; Hands-on #4

.model small
.stack 200h

.data
    A DB "ENTER A SMALL LETTER: $"
    B DB "EQUIVALENT CAPITAL LETTER: $"

.code
BEGIN:
    mov ax, @data
    mov ds, ax


    mov ah, 06h
    mov bh, 52h        
    mov cx, 0000h
    mov dx, 184Fh
    int 10h

    mov ah, 02h
    mov bh, 0
    mov dh, 10
    mov dl, 28
    int 10h

    mov ah, 09h
    lea dx, A
    int 21h

    mov ah, 01h
    int 21h

    sub al, 20h
    mov bl, al

    mov ah, 02h
    mov bh, 0
    mov dh, 12
    mov dl, 28
    int 10h

    mov ah, 09h
    lea dx, B
    int 21h

    mov ah, 02h
    mov dl, bl
    int 21h

    mov ah, 4Ch
    int 21h

END BEGIN
