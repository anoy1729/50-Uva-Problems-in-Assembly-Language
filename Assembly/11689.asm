.model small
.stack 100h
.data
    v db ?

.code

main proc
     
    mov ax,@data
    mov ds,ax     ; initilize the data segment
    
    mov ah,1
    int 21h
    
    mov cl,al
    
    sub cl,48 
    
    call newline
    
test_case:
    
    and v,0 
    mov ah,1 ; 
    int 21h
    mov bl,al
    sub bl,48
    
    ;print a space
    
    mov ah,2
    mov dl,' '
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    add bl,al
    
     
    ;print a space
    
    mov ah,2
    mov dl,' '
    int 21h
    
    
    mov ah,1
    int 21h
    sub al,48
    
    mov bh,al
    
    call newline 
    
loop1:
    
    and ax,0
    mov al,bl
    
    div bh
    
    add v,al
    
    add al,ah
    
    mov bl,al
    
    cmp bl,bh 
    
    jge loop1
    
    add v,48
    mov dl,v
    
    mov ah,2
    int 21h
    
    call newline
    
     
        
        
        
    loop test_case    
        
        
    mov ah,4ch
    int 21h
        
        
main endp 

newline proc
       
    push ax
    push dx  
        
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
      
    pop dx
    pop ax
        
        
    ret
        
newline endp
        
end main