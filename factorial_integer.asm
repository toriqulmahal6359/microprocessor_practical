.model small
.STACK 100h

.code
    MAIN PROC
        MOV CL, 3           ; calculate for 3
        MOV AL, 1
        
        top:
            MUL CL
            DEC CL          ; decrement to next
            JNZ top         ; loop
            
            ADD AL, 30h
            MOV DL, AL      ; store on data register
            MOV AH, 02h
            INT 21h
            
            MOV AH, 4ch
            INT 21h
            MAIN ENDP 
    
    END MAIN

