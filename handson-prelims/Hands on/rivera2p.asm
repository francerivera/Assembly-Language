; France Raphael R. Rivera
; Hands on 2P - Getting 2 numbers and display sum

.model small
.stack 100h
.data
MSG1 DB 'Enter first digit: $'
MSG2 DB 0Dh, 0Ah, 'Enter second digit: $'
MSG3 DB 0Dh, 0Ah, 'The sum is: $'

.code
main:
    MOV AX, @data
    MOV DS, AX
    
    ; First digit
    MOV AH, 09h
    LEA DX, MSG1
    INT 21h
    
    MOV AH, 01h
    INT 21h
    SUB AL, 30h
    MOV BL, AL
    
    ; Second digit
    MOV AH, 09h
    LEA DX, MSG2
    INT 21h
    
    MOV AH, 01h
    INT 21h
    SUB AL, 30h
    MOV BH, AL
    
    ; Add numbers
    ADD BL, BH
    
    ; Display result
    MOV AH, 09h
    LEA DX, MSG3
    INT 21h
    
    ADD BL, 30h
    MOV DL, BL
    MOV AH, 02h
    INT 21h
    
    ; Exit
    MOV AH, 4Ch
    INT 21h
END main