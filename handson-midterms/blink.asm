; Program Title: Machine Problem - Blinking Name              
; Author: France Raphael R. Rivera                            
; Description: Displays the name "France" in the center of the screen using a blinking attribute, without loops and labels.
; Date Written: 10-21-2025 
; J3A - Assembly LAB                                          

.model small
.stack 100h

.code
main proc
    ; Clear the whole screen
    ; Ah=06h scrolls the window, BH sets the color attribute
    mov ah, 06h         
    mov al, 0           
    mov bh, 60h
    mov cx, 0000h       
    mov dx, 184Fh       
    int 10h             

    ; Set the starting position to center of the screen
    ; DH = row, DL = column
    mov bh, 00h         
    mov cx, 01h         
    mov dh, 12          ; Row 12
    mov dl, 37          ; Column 37

    ; Print 'F'
    ; BL sets color and blinking effect
    mov bl, 94h         ; 9 = blinking, 4 = red text
    mov ah, 02h         ; Set cursor position at (row 12, col 37)
    int 10h             
    mov al, 'F'         
    mov ah, 09h         ; Write character AL with color in BL
    int 10h             
    inc dl              ; Move cursor right for next letter

    ; Print 'r'
    mov bl, 9Eh         ; Blinking + yellow text
    mov ah, 02h         
    int 10h
    mov al, 'r'
    mov ah, 09h    
    int 10h
    inc dl        

    ; Print 'a'
    mov bl, 9Ah         ; Blinking +green text
    mov ah, 02h
    int 10h
    mov al, 'a'
    mov ah, 09h
    int 10h
    inc dl             

    ; Print 'n'
    mov bl, 9Bh         ; Blinking + cyan text
    mov ah, 02h
    int 10h
    mov al, 'n'
    mov ah, 09h
    int 10h
    inc dl            

    ; Print 'c'
    mov bl, 99h         ; Blinking + blue text
    mov ah, 02h
    int 10h
    mov al, 'c'
    mov ah, 09h
    int 10h
    inc dl            

    ; 'e'
    mov bl, 9Dh         ; Blinking + magenta text
    mov ah, 02h
    int 10h
    mov al, 'e'
    mov ah, 09h
    int 10h

    mov ah, 4Ch         
    int 21h             
    
main endp
end main
