.model small
.stack 100h

.data
    msg1 db 0dh, 0ah, 'Enter First Decimal Number: $'
    msg2 db 0dh, 0ah, 'Enter Second Decimal Number: $'
    msg3 db 0dh, 0ah, 'SUM of Entered Numbers = $'
    
    num1 db ?
    num2 db ?       
    ans db ?,"$"
    
.code
    MAIN PROC
        MOV AX, @data
        MOV DS, AX                  ; all information saved into data segment
        
        MOV DX, OFFSET msg1
        MOV AH, 09h
        INT 21h
        
        MOV AH, 01h
        INT 21h
        SUB AL, 30h                 ; Subtract first input value from ASCII 0
        MOV num1, AL
        
        MOV DX, OFFSET msg2
        MOV AH, 09h
        INT 21h
        
        MOV AH, 01h
        INT 21h
        SUB AL, 30h                 ; Subtract second input value from ASCII 0
        MOV num2, AL
              
        MOV DX, OFFSET msg3
        MOV AH, 09h
        INT 21h
        
        MOV AL, num1
        ADD AL, num2
        ADD AL, 30h
        MOV ans, AL 
        
        MOV DX, OFFSET ans
        MOV AH, 09h
        INT 21h
        
        MOV AH, 4ch
        INT 21h
        MAIN ENDP
    END MAIN
        
        
         
        
