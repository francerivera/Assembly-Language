; France Raphael R. Rivera
; J3A - Assembly LAB

.model small
.stack 100h
.data
    prompt     db 'Enter a digit(0-9): $'
    result_msg db 0Dh, 0Ah, 'Result: $'
    input      db 5 dup('$')
    result     db 0

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display prompt
    mov ah, 9
    lea dx, prompt
    int 21h

    ; Read input character
    mov ah, 1
    int 21h
    sub al, '0'        ; Convert ASCII to integer
    mov bl, al         ; Store digit in BL

    cmp bl, 5          ; If digit > 5
    jg add_one

add_two:
    add bl, 2
    jmp display

add_one:
    add bl, 1

display:
    mov ah, 9
    lea dx, result_msg
    int 21h

    mov ah, 2
    add bl, '0'        ; Convert integer to ASCII
    mov dl, bl
    int 21h

    mov ah, 4Ch
    int 21h
main endp
end main
