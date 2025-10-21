; France Raphael R. Rivera
; J3A - Assembly LAB
; Laboratory Work #1M

.model small
.stack 100h

.data
menu    DB 0Dh,0Ah,'1. Addition',0Dh,0Ah
        DB '2. Subtraction',0Dh,0Ah
        DB '3. Multiplication',0Dh,0Ah
        DB '4. Division',0Dh,0Ah
        DB 'Enter choice: $'

msgA    DB 0Dh,0Ah,'Enter first number (0-9): $'
msgB    DB 0Dh,0Ah,'Enter second number (0-9): $'
msgResult  DB 0Dh,0Ah,'Result: $'
newline    DB 0Dh,0Ah,'$'

resultStr DB 3 DUP('$')

.code
main:

    MOV AX, @data
    MOV DS, AX

    ; show menu
    MOV AH, 09h
    LEA DX, menu
    INT 21h

    ; get user choice
    MOV AH, 01h
    INT 21h              
    SUB AL, '0'          ; convert ASCII to number
    MOV CH, AL           ; store choice in CH

    ; get first number
    MOV AH, 09h
    LEA DX, msgA
    INT 21h
    MOV AH, 01h
    INT 21h
    SUB AL, '0'          ; ASCII into number
    MOV BL, AL           ; store in BL

    ; get second number
    MOV AH, 09h
    LEA DX, msgB
    INT 21h
    MOV AH, 01h
    INT 21h
    SUB AL, '0'
    MOV CL, AL           ; store in CL

    ; prepare for operation
    MOV AL, BL           ; AL = first number
    MOV DL, CL           ; DL = second number

    ; check choice
    CMP CH, 1
    JE goAdd
    CMP CH, 2
    JE goSub
    CMP CH, 3
    JE goMul
    CMP CH, 4
    JE goDiv
    JMP done             ; invalid choice to exit

goAdd:
    ADD AL, DL           ; AL = BL + CL
    JMP showResult
goSub:
    SUB AL, DL           ; AL = BL - CL
    JMP showResult
goMul:
    MUL DL               ; AL = BL * CL
    JMP showResult
goDiv:
    XOR AH, AH           ; clear AH for division
    DIV DL               ; AL = BL / CL, AH = remainder
    JMP showResult

; display the result
showResult:
    MOV BL, AL           ; store result in BL

    ; show "Result: "
    MOV AH, 09h
    LEA DX, msgResult
    INT 21h

    ; convert result (0-99) into ASCII
    MOV AL, BL
    MOV AH, 0
    MOV CL, 10
    DIV CL               ; AL = quotient (tens), AH = remainder (ones)

    ADD AL, '0'          ; convert tens digit to ASCII
    ADD AH, '0'          ; convert ones digit to ASCII

    MOV resultStr, AL    ; store tens digit
    MOV resultStr+1, AH  ; store ones digit
    MOV resultStr+2, '$' ; end of string

    ; print result string
    MOV AH, 09h
    LEA DX, resultStr
    INT 21h

    JMP done

;  exit program 
done:
    MOV AH, 4Ch
    INT 21h
END main
