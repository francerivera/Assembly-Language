.model small
.stack 100h

.data
    prompt1 db "Enter first number (0-9): $"
    prompt2 db 0dh, 0Ah,"Enter second number (0-9): $"
    msg1 db 0dh, 0Ah,"v1 and v2 is greater than 5.$"
    msg2 db 0dh, 0Ah,"Sum is 5 or less.$"
    
.code
main:
    mov ax, @data
    mov ds, ax
    
    ; Ask first number
    mov ah, 09h
    lea dx, prompt1
    int 21h
    
    ; Read first input character
    mov ah, 01h
    int 21h
    sub al, '0'         ; Convert ASCII to integer
    mov bl, al          ; Store digit in BL
    
    ; Ask second number
    mov ah, 09h
    lea dx, prompt2
    int 21h
    
    ; Read second input character
    mov ah, 01h
    int 21h
    sub al, '0'         ; Convert ASCII to integer
    mov bh, al          ; Store digit in bl
    
    ; Calculate the sum
    add bl, bh       ; Sum of both numbers in bl
    
    ; Compare sum with 5
    cmp bl, 5
    jg greater_5
    
    ; Sum is or less
    mov ah, 09h
    lea dx, msg2
    int 21h
    jmp end_program
    
greater_5:
    mov ah, 09h
    lea dx, msg1
    int 21h
    
end_program:
    ; Exit program
    mov ah, 4Ch
    int 21h
end main
    