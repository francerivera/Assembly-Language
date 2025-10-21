; France Raphael R. Rivera
; Program: Prompt user for full name and age, then display a greeting message.

.model small
.stack 100h

.data
    ; Prompt messages
    getName     db "Enter your full name: $"
    getAge      db "Enter your age: $"

    ; Input buffers (DOS function 0Ah format: max length, actual length, buffer)
    storeName   db 30, ?, 30 dup(?)     ; Buffer for full name input
    storeAge    db 4, ?, 4 dup(?)       ; Buffer for age input

    ; Formatting strings
    newline     db 13, 10, '$'          ; Newline (CR + LF)
    greeting    db "Hello, $"           ; Greeting prefix
    agemsg      db "! You are $"        ; Middle part of message
    yearsmsg    db " years old.$"       ; Ending part of message

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; --- Full Name Input Section ---

    ; Display prompt for full name
    mov ah, 09h
    lea dx, getName
    int 21h

    ; Read full name using buffered input
    mov ah, 0Ah
    lea dx, storeName
    int 21h

    ; Add '$' string terminator to the end of input
    lea si, storeName          ; Point to buffer
    mov cl, [si+1]             ; Get actual length entered
    mov ch, 0
    add si, 2                  ; Skip first two bytes (max & actual length)
    add si, cx                 ; Move to end of input
    mov byte ptr [si], '$'     ; Add string terminator

    ; Print newline after name input
    mov ah, 09h
    lea dx, newline
    int 21h

    ; --- Age Input Section ---

    ; Display prompt for age
    mov ah, 09h
    lea dx, getAge
    int 21h

    ; Read age using buffered input
    mov ah, 0Ah
    lea dx, storeAge
    int 21h

    ; Add '$' string terminator to the end of age input
    lea si, storeAge
    mov cl, [si+1]             ; Get actual length entered
    mov ch, 0
    add si, 2                  ; Skip first two bytes
    add si, cx                 ; Move to end of input
    mov byte ptr [si], '$'     ; Add string terminator

    ; Print newline after age input
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Print extra blank line before greeting
    mov ah, 09h
    lea dx, newline
    int 21h

    ; --- Output Greeting Section ---

    ; Print "Hello, "
    mov ah, 09h
    lea dx, greeting
    int 21h

    ; Print user's full name
    lea dx, storeName+2        ; Skip first two bytes to get actual string
    int 21h

    ; Print "! You are "
    lea dx, agemsg
    int 21h

    ; Print user's age
    lea dx, storeAge+2         ; Skip first two bytes
    int 21h

    ; Print " years old."
    lea dx, yearsmsg
    int 21h

    ; --- Program Termination ---

    mov ah, 4Ch                ; DOS terminate program function
    mov al, 0                  ; Return code 0
    int 21h
main endp

end main
