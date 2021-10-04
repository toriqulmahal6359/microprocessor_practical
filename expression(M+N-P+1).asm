.model small
.STACK 100h

.data
    msg1 DB 0dh, 0ah, "M = $"
    msg2 DB 0dh, 0ah, "N = $"
    msg3 DB 0dh, 0ah, "P = $"
    msg4 DB 0dh, 0ah, "Y = M+N-P+1 = $"
    
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
        SUB AL, 30h
        PUSH AX
        
        PRINT msg2
        MOV AH, 01h
        INT 21h
        SUB AL, 30h
        PUSH AX
        
        PRINT msg3
        MOV AH, 01h
        INT 21h
        SUB AL, 30h
        PUSH AX
        
        POP CX          ; restore CX from stack
        POP BX          ; restore BX from stack
        POP AX          ; restore AX from stack
        
        MOV AH, 00      ; initialize AH and construct solution
        ADD AL, BL
        SUB AL, CL
        ADD AL, 01h
        
        PUSH AX         ; save result
        PRINT msg4
        POP AX          ; restore result
        MOV DL, AL      ; and move that to data segment
        ADD DL, 30h
        MOV AH, 02h
        INT 21h
        
        MOV AH, 4ch
        INT 21h
        MAIN ENDP
    END MAIN

    
    
