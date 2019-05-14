data segment
    esq1 db 201,"$"
    esq2 db 187,"$"
    esq3 db 200,"$"
    esq4 db 188,"$"
    horiz db 205,"$"
    verti db 10,8,186,"$"
    
    
data ends

code segment 
    principal proc far
        assume ds:data, cs:code
        mov ax,data
        mov ds,ax
         
    CALL PANTALLA;LLAMAR AL PROCEDIMIENTO    
    CALL ESQUINAS 
    CALL LINEAS
    
    MOV AH,4CH
    INT 21H
        
    principal endp 
    
    PANTALLA PROC NEAR 
    MOV AH,06H
    MOV AL,0
    MOV BH,17
    MOV CX,0
    MOV DX,184FH
    INT 10H
           
    MOV AH,06H
    MOV AL,0
    MOV BH,37
    MOV CX,051AH
    MOV DX,1336H
    INT 10H
    
    RET     
    PANTALLA ENDP
    
    ESQUINAS PROC NEAR
     MOV AH,02H
     MOV BH,0
     MOV DH,05H
     MOV DL,1AH
     INT 10H
     
     MOV AH,09
     MOV DX,OFFSET ESQ1
     INT 21H
     
     MOV AH,02H
     MOV BH,0
     MOV DH,05H
     MOV DL,36H
     INT 10H
     
     MOV AH,09
     MOV DX,OFFSET ESQ2
     INT 21H
     
     MOV AH,02H
     MOV BH,0
     MOV DH,13H
     MOV DL,1AH
     INT 10H
     
     MOV AH,09
     MOV DX,OFFSET ESQ3
     INT 21H
     
     MOV AH,02H
     MOV BH,0
     MOV DH,13H
     MOV DL,36H
     INT 10H
     
     MOV AH,09
     MOV DX,OFFSET ESQ4
     INT 21H
     
     RET
    ESQUINAS ENDP 
    
    LINEAS PROC NEAR 
    
    MOV AH,02H
    MOV BH,0
    MOV DH,05H
    MOV DL,1BH
    INT 10H    
        
    MOV CX,27
    MOV DX,OFFSET horiz  
   
    CICLO:
    MOV AH,09H
    INT 21H
    LOOP CICLO
    
    MOV AH,02H
    MOV BH,0
    MOV DH,13H
    MOV DL,1BH
    INT 10H    
        
    MOV CX,27
    MOV DX,OFFSET horiz  
   
    CICLO2:
    MOV AH,09H
    INT 21H
    LOOP CICLO2
    
    ;VERTICAL
    MOV AH,02H
    MOV BH,0
    MOV DH,05H
    MOV DL,1bH
    INT 10H    
        
    MOV CX,13
    MOV DX,OFFSET verti  
   
    CICLO3:
    MOV AH,09H
    INT 21H
    LOOP CICLO3
    
    MOV AH,02H
    MOV BH,0
    MOV DH,05H
    MOV DL,37H
    INT 10H    
        
    MOV CX,13
    MOV DX,OFFSET verti  
   
    CICLO4:
    MOV AH,09H
    INT 21H
    LOOP CICLO4

    
     
     RET
    LINEAS ENDP
    
 code ends 
end principal 
    