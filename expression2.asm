.model small
.STACK 100h

.data
    msg1 DB 0dh, 0ah, "M = $"
    msg2 DB 0dh, 0ah, "N = $"
    msg3 DB 0dh, 0ah, "P = $"
    msg4 DB 0dh, 0ah, "X = $"
    msg5 DB 0dh, 0ah, "Y = $"
    msg6 DB 0dh, 0ah, "Z = (M-N)P = $"          ; if(X > Y)
    msg7 DB 0dh, 0ah, "Z = (M/N)+P = $"         ; if(X <= Y) 
    
PRINT MACRO msg
    LEA DX, msg
    MOV AH, 09h
    INT 21h
ENDM                                            ; end of macro

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
        
        PRINT msg4
        MOV AH, 01h
        INT 21h
        SUB AL, 30h
        MOV BL, AL          ; it is needed for next check
        
        PRINT msg5
        MOV AH, 01h
        INT 21h
        SUB AL, 30h
        CMP BL, AL          ; compare this with previous one
        
        JLE step1           ; if(X<=Y)
        
        POP CX              ; store P from stack
        POP BX              ; store N from stack
        POP AX              ; store M from stack
        
        SUB AL, BL
        MUL CL
        JMP step3
        
        step1:
            POP CX          ; store P
            POP BX          ; store N
            POP AX          ; store M
            MOV AH, 00      ; initialize M
            DIV BL          ; AL divide with N
            ADD AL, CL      ; add that result (M/N) with P(CL)
        
        step2:
            PUSH AX         ; save AX to stack
            PRINT msg7
            POP AX          ; store AX
            MOV DL, AL      ; move that to data register
            ADD DL, 30h
            MOV AH, 02h
            INT 21h
            
        JMP stop
        
        step3:
            PUSH AX         ; save AX to stack
            PRINT msg6
            POP AX          ; store AX for further working
            MOV DL, AL      ; move that to data register
            MOV AH, 02h
            INT 21h
            
        stop:
            MOV AH, 4ch
            INT 21h
            MAIN ENDP
    
    END MAIN
            
            
            




    