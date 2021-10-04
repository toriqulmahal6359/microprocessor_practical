.model small
.STACK 100h

.data
    msg1 DB "Result = $"
    X DB 2,3,4
    Y DB 3,2,4
    S DW ?
    
PRINT MACRO msg
    LEA DX, msg
    MOV AH, 09h
    INT 21h
ENDM

.code
    MAIN PROC
        MOV AX, @data
        MOV DS, AX
        
        MOV CX, 3               ; loop count 3 times
        LEA SI, X               ; assign X to SI
        LEA DI, Y               ; assign Y to DI
        
        
        array1:
            MOV AL, [SI]        ; SI is an index and move to AL
            MOV BL, [DI]        ; DI is an index and move to BL
            MUL BL              ; Multiply BL with AL
            ADD S, AX           ; stored result AX added with 
            MOV AX, 0000h       ; null
            ADD SI, 1           ; i=1
            ADD DI, 1           ; i=1
            LOOP array1         ; loop to continue next one
            
            PRINT msg1
            
            MOV AX, S
            CALL int2asc        ; call a function
            
            MOV AH, 4ch         ; exit
            INT 21h
            MAIN ENDP
    
    int2asc PROC
        MOV CX, 00              ; initialize it for next number
        MOV BX, 0ah             ; 0ah = 10
        rpt:
            MOV DX, 00h         ; initialize DX
            DIV BX              
            ADD DL, 30h         ; add and store on data register
            INC CX
            PUSH DX             ; store DX to stack
            CMP AX, 0ah         ; compare the number from 0 to 10
            JGE rpt
            
            ADD AL, 30h
            INC CX
            PUSH AX             ; store S elements to stack
            MOV AH, 02h
            
        print_loop:
            POP DX
            INT 21h
            LOOP print_loop
            RET                 ; return to main
            int2asc ENDP 
    
    END MAIN
            
            
