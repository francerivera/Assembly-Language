; France Raphael R. Rivera
; J3A - Assembly LAB

.model small
.stack 100h

.data
    newline db 13, 10, '$'
    prompt db "Input digit ", ?, ":", ' $'
    echoMsg db "Digit ", ?, ": ", ?, '$'    ; Template for echo output
    youEntered db 13, 10, "You Entered:", '$'
    arr db 5 dup(?)                                  ; Array to store digits

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 5            ; Loop counter
    xor si, si           ; Index for array
    xor bx, bx           ; BX will hold digit number (0 to 4)

input_loop:
    ; Print newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Set digit number in prompt
    mov al, bl
    add al, '1'          ; Convert to ASCII
    mov prompt+12, al

    ; Print prompt
    mov ah, 09h
    lea dx, prompt
    int 21h

    ; Read digit
    mov ah, 01h
    int 21h
    mov arr[si], al

    inc si
    inc bl
    loop input_loop

    ; Print "You Entered:"
    mov ah, 09h
    lea dx, youEntered
    int 21h

    ; Output loop
    mov cx, 5
    xor si, si
    xor bx, bx

output_loop:
    ; Print newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Set digit number and value in echoMsg
    mov al, bl
    add al, '1'
    mov echoMsg+6, al

    mov al, arr[si]
    mov echoMsg+9, al

    ; Print echo message
    mov ah, 09h
    lea dx, echoMsg
    int 21h

    inc si
    inc bx
    loop output_loop

    ; Exit
    mov ah, 4Ch
    int 21h
main endp
end main
