.model small
.STACK 100h
MAIN PROC
    MOV AH, 01h
    INT 21h
    ADD AL, 20h
    MOV BL, AL
    MOV DL, BL
    MOV AH, 02h
    INT 21h
    MOV AH, 4ch
    INT 21h
    MAIN ENDP
END MAIN