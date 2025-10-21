; France Raphael R. Rivera
; J3A - Assembly Lab
; Machine Problem #1M

.model small
.stack 100h

.data
msginput   db 0dh,0ah,'Enter a number (0-9): $'
msgresult  db 0dh,0ah,'Result: $'
msgexit    db 0dh,0ah,'Exit: Yes (Y/y): $'
newline    db 0dh,0ah,'$'
resultstr  db 3 dup('$')    

.code
main:
    mov ax, @data
    mov ds, ax               ; Initialize data segment

program_loop:
; Step 1: Prompt the user for input
    mov ah, 09h
    lea dx, msginput
    int 21h                  ; Display "Enter a number (0-9):"

; Step 2: Read a single digit (0?9)
    mov ah, 01h
    int 21h
    sub al, '0'              ; Convert ASCII to numeric (0?9)
    mov bl, al               ; Store input number in bl

; Step 3: Determine if number is odd or even
    mov al, bl
    mov ah, 0
    mov dl, 2
    div dl                   ; Divide by 2, remainder in ah
    cmp ah, 0
    je process_even          ; if remainder = 0, even
    jmp process_odd          ; else: odd

; Step 4: Process odd numbers
process_odd:
    cmp bl, 5
    jg odd_add_5             ; if number > 5, add 5
    add bl, 2                ; else: add 2
    jmp display_result

odd_add_5:
    add bl, 5                ; Add 5 if number > 5
    jmp display_result

; Step 5: Process even numbers
process_even:
    cmp bl, 4
    jle even_add_2           ; if number <= 4, add 2
    cmp bl, 6
    jge even_add_5           ; if number >= 6, add 5
    jmp display_result       ; else: no change

even_add_2:
    add bl, 2                ; add +2
    jmp display_result

even_add_5:
    add bl, 5                ; add +5
    jmp display_result

; Step 6: Display the final result
display_result:
    mov ah, 09h
    lea dx, msgresult
    int 21h                  ; Display "Result: "

; Convert numeric value (bl) into digits
    mov al, bl
    mov ah, 0
    mov cl, 10
    div cl                   ; al = tens, ah = ones

    cmp al, 0
    je print_single_digit    ; if no tens, print single digit

print_two_digits:
    add al, '0'              ; Convert tens to ASCII
    add ah, '0'              ; Convert ones to ASCII
    mov resultstr, al
    mov resultstr+1, ah
    mov resultstr+2, '$'
    mov ah, 09h
    lea dx, resultstr
    int 21h                  ; Display two-digit result
    jmp ask_to_exit

print_single_digit:
    add ah, '0'              ; Convert ones to ASCII
    mov resultstr, ah
    mov resultstr+1, '$'
    mov ah, 09h
    lea dx, resultstr
    int 21h                  ; Display single-digit result
    jmp ask_to_exit

; Step 7: Ask the user if they want to exit
ask_to_exit:
    mov ah, 09h
    lea dx, msgexit
    int 21h                  ; Display "Exit: Yes (Y/y):"

    mov ah, 01h
    int 21h                  ; Get user response
    cmp al, 'y'
    je end_program           ; Exit if user types 'y'
    cmp al, 'Y'
    je end_program           ; Exit if user types 'Y'

    jmp program_loop         ; Repeat if not Y/y

; Step 8: Exit the program
end_program:
    mov ah, 4ch
    int 21h

end main


; CODE EXPLANATION

; Step 1 - Input:
; The program displays a message asking the user to enter a single digit (0?9).
; The user's input is then read from the keyboard and converted from ASCII to its numeric value.

; Step 2 - Odd/Even Check:
; The input number is divided by 2 using the DIV instruction.
; If the remainder (stored in ah) is 0, the number is even; else, it is odd.
; Based on the result, the program jumps to the correct section for processing.

; Step 3 - Odd Processing:
; For odd numbers:
; - If the number is greater than 5, 5 is added to it.
; - Else, 2 is added.

; Step 4 - Even Processing:
; For even numbers:
; - If the number is less than or equal to 4, 2 is added.
; - If the number is greater than or equal to 6, 5 is added.
; - Else, the number stays the same.

; Step 5 - Display Result:
; The result is converted into ASCII form so it can be displayed correctly.
; If the answer has one digit, it will be printed with no leading zero (for example: 4.
; If the answer has two digits, both are printed (for example: 13.

; Step 6 - Loop and Exit:
; After showing the result, the program asks the user if they want to exit.
; If the user presses 'Y' or 'y', the program ends.
; Else, it loops back and asks for another number until the user input is valid.
