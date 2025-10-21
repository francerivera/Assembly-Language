; France Raphael R. Rivera
; J3A - Assembly LAB
; Hands-on #2

TITLE COLORME.ASM
.MODEL SMALL
.STACK 0200h
.DATA
    MESSAGE1 DB "HELLO WORLD!", '$'
    MESSAGE2 DB "I LOVE ASSEMBLY PROGRAMMING !!!", '$'

.CODE
BEGIN:
    MOV AX, @data
    MOV DS, AX            

    MOV AX, 0600h      
    MOV BH, 24h     
    MOV CX, 0000h    
    MOV DX, 184Fh   
    INT 10h

    MOV AH, 02h
    MOV BH, 0
    MOV DH, 11
    MOV DL, 30
    INT 10h

    MOV AH, 09h
    MOV DX, OFFSET MESSAGE1
    INT 21h

    MOV AH, 02h
    MOV BH, 0
    MOV DH, 13
    MOV DL, 22
    INT 10h

    MOV AH, 09h
    MOV DX, OFFSET MESSAGE2
    INT 21h


    MOV AH, 08h
    INT 21h

    MOV AX, 4C00h
    INT 21h
END BEGIN
