.model small
.STACK 100h

.code
    MAIN PROC
        MOV CX, 26          ; count for 26
        MOV AH, 02h
        MOV DL, 'A'         ; start from 'A'
        
        l1:
          INT 21h
          INC DL
          LOOP l1
          
        MOV AH, 4ch         ; exit
        INT 21h
        
        MAIN ENDP
    END MAIN
          
        
        
    
