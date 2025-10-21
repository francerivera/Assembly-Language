; France Raphael R. Rivera
; J3A - Assembly LAB
; Hands-on #5

TITLE COMPARE.ASM
.MODEL SMALL
.STACK 0100h

.DATA
    try1 db "MENU$"
    try2 db "----$"
    try3 db "[a] Happy$"
    try4 db "[b] Sad$"
    try5 db "Input A or B: $"
    
    Gd db "Good$"
    Bd db "Bad$"

.CODE
START:
    mov ax, 03h
    int 10h

    mov ax, @data
    mov ds, ax

    mov ah, 06h
    mov al, 0
    mov bh, 43h
    mov cx, 0000h
    mov dx, 184Fh
    int 10h
    
    mov ah, 02h
    mov bh, 0
    mov dh, 10
    mov dl, 38
    int 10h
    mov ah, 09h
    lea dx, try1
    int 21h

    mov ah, 02h
    mov dh, 11
    mov dl, 38
    int 10h
    mov ah, 09h
    lea dx, try2
    int 21h

    mov ah, 02h
    mov dh, 12
    mov dl, 35
    int 10h
    mov ah, 09h
    lea dx, try3
    int 21h

    mov ah, 02h
    mov dh, 13
    mov dl, 35
    int 10h
    mov ah, 09h
    lea dx, try4
    int 21h

    mov ah, 02h
    mov dh, 14
    mov dl, 32
    int 10h
    mov ah, 09h
    lea dx, try5
    int 21h

    xor ah, ah
    int 16h

    mov bl, al
    mov dl, al
    mov ah, 02h
    int 21h

    cmp bl, 'a'
    je Good
    cmp bl, 'b'
    je Bad
    jmp exit

Good:
    mov ah, 02h
    mov bh, 0
    mov dh, 16
    mov dl, 32
    int 10h
    mov ah, 09h
    lea dx, Gd
    int 21h
    jmp exit

Bad:
    mov ah, 02h
    mov bh, 0
    mov dh, 16
    mov dl, 32
    int 10h
    mov ah, 09h
    lea dx, Bd
    int 21h
    jmp exit

exit:
    mov ah, 4Ch
    int 21h

END START
