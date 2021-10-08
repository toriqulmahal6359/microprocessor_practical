.model small
.stack

.data
    A db 0dh, 0ah, "ENTER an INPUT...", 0dh, 0ah, "$"
    B db 0dh, 0ah, "The OUTPUT is...", 0dh, 0ah, "$"
    
.code
MAIN PROC
    MOV AX, @data
    MOV DS, AX
    
    MOV AH, 09h
    LEA DX, A
    INT 21h
    
    MOV AH, 01h          ; input character with echo
    INT 21h
    SUB AL, 20h          ; include add with 20 for small char
    MOV BL, AL
    
    MOV AH, 09h          
    LEA DX, B
    INT 21h
    MOV DL, BL
    MOV AH, 02h          ; write character with standard echoed value
    INT 21h
    
    MOV AH, 4ch
    INT 21h
    MAIN ENDP
END MAIN