.model small

.data
    msg DB 60 dup(?) 

.code 
    MAIN PROC
        MOV AX, @data
        MOV DS, AX
        
        MOV SI, OFFSET msg                 ; input of characters set as an array
        
        input:
            MOV AH, 01h
            INT 21h
            CMP AL, 13                     ; carriage return
            JE display
            MOV [SI], AL                   ; move to SI index
            INC SI
            JMP input
         
        display:
            MOV [SI], '$'
            MOV DI, OFFSET msg             ; move that msg to data segment for output
            MOV DL, 13                     ; same procedure done for input
            MOV AH, 02h
            INT 21h
            MOV DL, 10                     ; backspace
            MOV AH, 02h
            INT 21h
        
        again:
            CMP [DI], '$'                  ; further procedure for output 
            JE last
            CMP [DI], 32
            JE next
            MOV DL, [DI]                   ; move DL for bind perfectly 
            MOV AH, 02h
            INT 21h
            INC DI
            JMP again
        
        next:
            MOV DL, 13                     ; carriage return
            MOV AH, 02h
            INT 21h
            MOV DL, 10                     ; backspace
            MOV AH, 02h
            INT 21h
            INC DI
            JMP again
        
        last:
            MOV AH, 4ch
            INT 21h
            
            MAIN ENDP 
    
    END MAIN
           
            
            