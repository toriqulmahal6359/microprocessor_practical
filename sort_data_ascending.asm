.model small
.stack 100h

.data
    list DB 9,6,7,5,3
    
.code
    MAIN PROC
        MOV AX, @data
        MOV DS, AX
        LEA SI, list            ; define the list first
        MOV BX, 5               ; counting that list    
        
        PUSH BX                 ; count source list
        PUSH SI                 ; push elements in source stack
        DEC BX
        
        sort:
            PUSH SI             ; push elements in source stack
            MOV DX, SI          ; put source elements on DX
            
            INC SI              ; increment that index
            MOV DI, SI          ; source is now in destination
            MOV SI, DX          ; load that remaining or new element to its source
            MOV CX, BX          ; move that size        
            
        sort_list:
            MOV AL, [DI] 
            CMP [SI], AL
            JNG BB
            XCHG [SI], AL       ; exchange AL with [SI] if not [SI]>[DI]
            MOV [DI], AL
            
        BB:
            MOV SI, DI          ; destination is in source
            INC DI
            LOOP sort_list
            POP SI
            DEC BX
            JNZ sort
            
            POP SI
            POP BX
            MOV CX, BX
            
        print:
            MOV DL, [SI]
            ADD DL, 30h
            MOV AH, 02h
            INT 21h
            MOV DL, ','
            INT 21h
            INC SI
            LOOP print
            
            MOV AH, 4ch
            INT 21h
            
            MAIN ENDP
    END MAIN
            
            
        
         
