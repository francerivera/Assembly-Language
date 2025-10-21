; France Raphael R. Rivera
; Hands - On #1P = getting a digit

.model small
.stack 100h
.data
    MSG DB 'Enter a digit: $'

.code
begin:
    MOV AX, @data
    MOV DS, AX
    
    ; Display prompt
    MOV AH, 09H
    LEA DX, MSG
    INT 21h
    
    ;Input char
    MOV AH, 01h
    INT 21h
    MOV BL, AL  ; store input in BL
    
    ; Move to next line
    MOV AH, 02h
    MOV DL, 0Dh ; Carriage return
    INT 21h
    
    MOV AH, 4Ch
    INT 21h
END begin
    