.model small

.data
msg1 db 0dh, 0ah, "Enter The Number: $"
msg2 db 0dh, 0ah, "It is an even number. $"
msg3 db 0dh, 0ah, "It is an odd number. $"

PRINT MACRO msg
    LEA DX, msg
    MOV AH, 09h
    INT 21h
ENDM

.code
MAIN PROC
    MOV AX, @data
    MOV DS, AX
    PRINT msg1
    MOV AH, 01h
    INT 21h
    SUB AL, 30h          ; ASCII digit code for 0 
    MOV BL, 02
    DIV BL
    CMP AH, 00
    JLE  s2
    PRINT msg3
    JMP L4
    
    s2:
    PRINT msg2
    
    L4:
    MOV AH, 4ch
    INT 21h
    MAIN ENDP
END MAIN
