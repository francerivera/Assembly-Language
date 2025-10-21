; France Raphael R. Rivera
; J3A - Assembly LAB
; Hands-on #1

.MODEL SMALL
.STACK 100h
.DATA
    A DB "I LOVE COMPUTER PROGRAMMING$"
.CODE
BEGIN:

    MOV AX, @data
    MOV DS, AX
    
    mov ah, 06h
    mov bh, 10h
    mov cx, 0h
    mov dx, 184FH
    int 10h

    mov ah, 2
    mov bh, 0
    mov dh, 10
    mov dl, 34
    int 10h
    
    MOV AH, 9
    MOV DX, OFFSET A
    INT 21H
    
    MOV AH, 4CH
    INT 21H
END BEGIN
        