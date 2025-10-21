; France Raphael R. Rivera

.model small
.stack 100h
.data
    msg1 DB 'Enter a number (0-9): $'
    evenMsg DB 0Dh,0Ah,'The number is EVEN.$'
    oddMsg  DB 0Dh,0Ah,'The number is ODD.$'

.code
main proc
    ; Initialize DS
    MOV AX, @data
    MOV DS, AX

    ; Display message
    MOV AH, 09h
    LEA DX, msg1
    INT 21h

    ; Input single digit (0?9)
    MOV AH, 01h
    INT 21h
    SUB AL, '0'          ; Convert ASCII to number
    MOV BL, AL           ; Store number in BL

    ; Check if EVEN or ODD
    MOV AH, 0
    MOV AL, BL
    AND AL, 01h          ; Check least significant bit
    JZ EVEN1             ; If zero, number is EVEN

ODD:
    MOV AH, 09h
    LEA DX, oddMsg
    INT 21h
    JMP EXIT

EVEN1:
    MOV AH, 09h
    LEA DX, evenMsg
    INT 21h

EXIT:
    ; Exit to DOS
    MOV AH, 4Ch
    INT 21h

main endp
end main
