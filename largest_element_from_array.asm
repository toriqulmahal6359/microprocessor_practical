.model small
.STACK 100h

.data
    msg1 DB 0dh, 0ah, "Largest Element is: $"
    array DB 4, 9, 6, 7, 5
    largest DB ?

.code
    MAIN PROC
        MOV AX, @data
        MOV DS, AX
        LEA DI, array            ; Array must be shifted into Data Index register DI
        
        MOV CX, 5                ; array size declaration or counting array size
        MOV AL, [DI]             ; define Memory Locations of particular index of array values
        MOV largest, AL
        
        step:
            INC DI               ; increment by 1
            MOV BL, [DI]            
            CMP largest, BL
            JGE high
            MOV largest, BL
            
        high:
            LOOP step
            ADD largest, 30h    ; integer to character
            
            LEA DX, msg1
            MOV AH, 09h
            INT 21h
            
            MOV DL, largest     ; store that result to data segment register
            MOV AH, 02h          ; output that resulted value
            INT 21h              
            
            MOV AH, 4ch          ; exit
            INT 21h
            MAIN ENDP
    END MAIN