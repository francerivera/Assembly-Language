; France Raphael R. Rivera
; J3A - Assembly LAB
; Hands-on #3

dosseg
.model small 
.stack 100h

.data
    A DB "EXCELLENT$"
.code
BEGIN:
    mov ax, @data
    mov ds, ax

    mov ah, 06h
    mov bh, 36h   
    mov cx, 0h
    mov dx, 184Fh
    int 10h

    mov ah, 2
    mov bh, 0
    mov dh, 10
    mov dl, 35
    int 10h

    mov ah, 9
    mov dx, offset A
    int 21h

    mov ah, 4Ch
    int 21h
end BEGIN
