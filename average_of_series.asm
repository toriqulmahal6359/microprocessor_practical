.model small
.STACK 100h

.data
    msg1 DB "Enter N = $"
    msg2 DB 0dh, 0ah, "Average = $"
    
PRINT MACRO msg
    LEA DX, msg    
    MOV AH, 09h
    INT 21h
ENDM

.code
    start:
        MOV AX, @data
        MOV DS, AX
        
        PRINT msg1
        MOV AH, 01h
        INT 21h
        MOV AH, 00h         ; will not return anything
        SUB AX, 30h
        MOV CX, AX
        MOV DL, AL          ; this is also the value we want to divide with
        MOV BX, 00h         ; return to 0 (nothing)
        
     next:
        ADD BL, CL
        LOOP next
        MOV AX, BX
        MOV AH, 00
        DIV DL
        
        PUSH AX
        PRINT msg2
        POP AX
        
        MOV DL, AL
        ADD DL, 30h
        MOV AH, 02h
        INT 21h
        
        MOV AH, 4ch
        INT 21h
        END start

    