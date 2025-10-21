.MODEL small
.STACK 100h
.DATA
.CODE
main PROC
    ;code here
    MOV AH, 4Ch
    INT 21h
main ENDP
END main