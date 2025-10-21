; France Raphael R. Rivera
; J3A - Assembly LAB
; LabWork 1M

.MODEL small
.STACK 100h

.DATA
menu    DB 0Dh,0Ah,'1. Addition',0Dh,0Ah
        DB '2. Subtraction',0Dh,0Ah
        DB '3. Multiplication',0Dh,0Ah
        DB '4. Division',0Dh,0Ah
        DB 'Enter choice: $'

msgA    DB 0Dh,0Ah,'Enter first number: $'
msgB    DB 0Dh,0Ah,'Enter second number: $'
msgRes  DB 0Dh,0Ah,'Result: $'
msgDivZero  DB 0Dh,0Ah,'Error: Division by zero!', 0Dh, 0Ah, '$'
msgInvalid  DB 0Dh,0Ah,'Invalid choice.', 0Dh, 0Ah, '$'
newline DB 0Dh,0Ah,'$'

choice  DB ?

buffer  DB 5,?,5 DUP(0)    

num1    DW ?
num2    DW ?
result  DW ?

.CODE
MAIN PROC
    MOV AX, SEG menu
    MOV DS, AX

    ; Show menu
    MOV AH, 09h
    LEA DX, menu
    INT 21h

    ; Read choice (single char)
    MOV AH, 01h
    INT 21h
    SUB AL, '0'      ; Convert ASCII 1-4 to number 1-4
    MOV choice, AL

    ; Get first number
    MOV AH, 09h
    LEA DX, msgA
    INT 21h

    CALL ReadNumber
    MOV num1, AX

    ; Get second number
    MOV AH, 09h
    LEA DX, msgB
    INT 21h

    CALL ReadNumber
    MOV num2, AX

    ; Perform operation
    MOV AL, choice

    CMP AL, 1
    JE doAdd
    CMP AL, 2
    JE doSub
    CMP AL, 3
    JE doMul
    CMP AL, 4
    JE doDiv

    JMP invalidChoice

doAdd:
    MOV AX, num1
    ADD AX, num2
    JMP storeResult

doSub:
    MOV AX, num1
    SUB AX, num2
    JMP storeResult

doMul:
    MOV AX, num1
    MOV BX, num2
    MUL BX
    JMP storeResult

doDiv:
    MOV AX, num1
    MOV BX, num2
    CMP BX, 0
    JE divError
    XOR DX, DX
    DIV BX
    JMP storeResult

divError:
    MOV AH, 09h
    LEA DX, newline
    INT 21h
    LEA DX, msgDivZero
    INT 21h
    JMP done

invalidChoice:
    MOV AH, 09h
    LEA DX, newline
    INT 21h
    LEA DX, msgInvalid
    INT 21h
    JMP done

storeResult:
    MOV result, AX

    ; Print result
    MOV AH, 09h
    LEA DX, msgRes
    INT 21h

    MOV AX, result
    CALL PrintNumber

    MOV AH, 09h
    LEA DX, newline
    INT 21h

done:
    MOV AH, 4Ch
    INT 21h

MAIN ENDP

; ReadNumber - reads user input from buffer and converts to integer
ReadNumber PROC
    PUSH CX
    PUSH DX
    PUSH SI
    PUSH BX

    LEA DX, buffer
    MOV AH, 0Ah
    INT 21h

    XOR AX, AX
    MOV SI, OFFSET buffer + 2
    MOV CL, [buffer + 1]
    XOR CH, CH

convertLoop:
    CMP CX, 0
    JE doneRead
    MOV BL, [SI]
    SUB BL, '0'
    MOV BH, 0
    MOV DX, AX
    MOV AX, 10
    MUL DX
    ADD AX, BX
    INC SI
    DEC CX
    JMP convertLoop

doneRead:
    POP BX
    POP SI
    POP DX
    POP CX
    RET
ReadNumber ENDP

; PrintNumber - prints AX as unsigned decimal
PrintNumber PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    XOR CX, CX
    MOV BX, 10

printLoopPrep:
    XOR DX, DX
    DIV BX
    PUSH DX
    INC CX
    CMP AX, 0
    JNE printLoopPrep

printLoop:
    POP DX
    ADD DL, '0'
    MOV AH, 02h
    INT 21h
    LOOP printLoop

    POP DX
    POP CX
    POP BX
    POP AX
    RET
PrintNumber ENDP

END MAIN