.model small

.data
    msg1 db 0dh, 0ah, "X = $"
    msg2 db 0dh, 0ah, "Y = $"
    msg3 db 0dh, 0ah, "sum = $"
    
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
    MOV AH, 01h             ; first input of X
    INT 21h
    SUB AL, 30h
    MOV CL, AL
    
    PRINT msg2
    MOV AH, 01h             ; second input of Y
    INT 21h
    SUB AL, 30h
    MOV CH, AL
    
    PRINT msg3
    ADD CL, CH              ; add CH val with CL and store onto CL
    MOV DL, CL              ; put into data segment
    ADD DL, 30h             ; add that result with 0 ASCII Integer code
    MOV AH, 02h
    INT 21h
    
    MOV AH, 4ch             ; end program
    INT 21h
    MAIN ENDP
END MAIN

    