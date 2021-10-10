.model small
.STACK 100h 

.data
msg db 0dh, 0ah, "Enter the number...",

.code
    MAIN PROC 
        MOV AX, @data
        MOV DS, AX 

        MOV AH, 01h
        INT 21h  
        SUB AL, 30h
        MOV BL, AL 
        MOV CL, BL          
        MOV AL, 1
        
        top:
            MUL CL
            DEC CL          
            JNZ top          
              
            ADD AL, 30h
            MOV DL, AL      
            MOV AH, 02h
            INT 21h 
            
            MOV AH, 4ch
            INT 21h
            MAIN ENDP 
    
    END MAIN

