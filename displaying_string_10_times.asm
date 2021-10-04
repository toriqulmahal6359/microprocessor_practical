.model small
.data

msg db 0dh, 0ah, "Hello, World!$"

.code
PRINT MACRO msg
    LEA DX, msg
    MOV AH, 09h
    INT 21h
ENDM

MAIN PROC
    MOV AX, @data
    MOV DS, AX
    MOV CX, 10
    
printmsg:
    PRINT msg
    LOOP printmsg
    MOV AH, 4ch
    INT 21h
    MAIN ENDP

END MAIN
     




