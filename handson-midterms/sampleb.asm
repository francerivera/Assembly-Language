; France Raphael R. Rivera
; J3A - Assembly LAB
; Activity Procedure B

title sampleb.asm
.model small
.stack 100h

.data
    var db "WELCOME TO ASSEMBLY LANGUAGE $"

.code
start:
    mov ax, @data      
    mov ds, ax

    call clear         
    call cursor     
    
    mov ah, 09h     
    mov dx, offset var
    int 21h

    mov ah, 4ch    
    int 21h


clear:
    mov ah, 06h  
    mov bh, 17h        
    mov cx, 0000h
    mov dx, 184fh     
    int 10h
    ret

cursor:
    mov ah, 02h 
    mov bh, 0  
    mov dh, 12        
    mov dl, 25       
    int 10h
    ret

end start
