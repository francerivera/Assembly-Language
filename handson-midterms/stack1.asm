; France Raphael R. Rivera
; J3A - Assembly LAB
; Activity Stack A

.model small
.stack 100h

.data
    VAR1 DB "ENTER FIRST NUMBER (0-9): $"
    VAR2 DB "ENTER SECOND NUMBER (0-9): $"
    VAR3 DB "THE SUM IS: $"
    VAR4 DB "INVALID ENTRY $"

.code
start:
    MOV AX, @data
    MOV DS, AX

    CALL clear
    
    CALL cursor1     
    MOV AH, 09h
    MOV DX, OFFSET VAR1
    INT 21h         

    CALL cursor2        
    MOV AH, 01h
    INT 21h           
    MOV BL, AL       


    CMP AL, '0'
    JB wrong
    CMP AL, '9'
    JA wrong
    SUB BL, '0'    


    CALL cursor3      
    MOV AH, 09h
    MOV DX, OFFSET VAR2
    INT 21h         

    CALL cursor4        
    MOV AH, 01h
    INT 21h           
    MOV BH, AL          


    CMP AL, '0'
    JB wrong
    CMP AL, '9'
    JA wrong
    SUB BH, '0'  

    MOV AL, BL          
    ADD AL, BH         
    
    CMP AL, 9
    JG two_digits     
    
    ADD AL, '0'   
    
    CALL cursor5   
    MOV AH, 09h
    MOV DX, OFFSET VAR3
    INT 21h             

    CALL cursor6       
    MOV AH, 02h
    MOV DL, AL          
    INT 21h             
    JMP exit_prog

two_digits:

    MOV AH, 0      
    MOV BL, 10      
    DIV BL              
    
    MOV CL, AH        
    
    ADD AL, '0'         

    CALL cursor5     
    MOV AH, 09h
    MOV DX, OFFSET VAR3
    INT 21h            

    CALL cursor6   
    
   
    MOV AH, 02h          
    MOV DL, AL           
    INT 21h
    

    MOV AH, 02h   
    MOV DL, CL         
    ADD DL, '0'         
    INT 21h
    
    JMP exit_prog

wrong:
    CALL clear
    CALL cursor5
    
    MOV AH, 09h
    MOV DX, OFFSET VAR4
    INT 21h

exit_prog:
    MOV AH, 4CH
    INT 21h

clear:
    MOV AH, 06h
    MOV AL, 0
    MOV BH, 17H
    MOV CX, 0000h
    MOV DX, 184fh
    INT 10h
    RET

cursor1:
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 10
    MOV DL, 14
    INT 10h
    RET

cursor2:
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 10
    MOV DL, 50
    INT 10h
    RET

cursor3:
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 11
    MOV DL, 14
    INT 10h
    RET

cursor4:
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 11
    MOV DL, 50
    INT 10h
    RET

cursor5:
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 12
    MOV DL, 14
    INT 10h
    RET

cursor6:
    MOV AH, 02h
    MOV BH, 0
    MOV DH, 12
    MOV DL, 25
    INT 10h
    RET

END start
