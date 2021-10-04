.model small
.STACK 100h

.data
    input DB 0dh, 0ah, "Enter a String: $"
    output DB 0dh, 0ah, "Reversed String: $"
    
PRINT MACRO msg
    PUSH AX
    PUSH DX
    LEA DX, msg
    MOV AH, 09h
    INT 21h
    POP DX
    POP AX
ENDM

.code
    MAIN PROC
        MOV AX, @data
        MOV DS, AX
        
        PRINT input
        MOV CX, 00          ; initialize the CX (return to 0)
        MOV DX, 00          ; initialize the DX (return to 0)
        
        read:
            MOV AH, 01h     ; input
            INT 21h
            
            CMP AL, 0dh     ; compare with next carriage return        
            JZ done
            
            MOV DX, AX
            PUSH DX
            INC CX
            JMP read        ; ready to write next character
        
        done:
            PRINT output
            
        write:
            POP DX          ; store data from stack
            MOV AH, 02h
            INT 21h
            LOOP write
            
            MOV AH, 4ch
            INT 21h
            MAIN ENDP
    END MAIN
            
            

