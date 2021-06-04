.model small
.stack 100h
.data 
    v1 db ?
    v2 db ?

.code

main proc 
     
    mov ax,@data
    mov ds,ax     ; initilize the data segment
    
    
    mov ah,1
    int 21h 
    
    and cx,0
    
    mov cl,al
    sub cl,48
    
    call newline
    
loop1:    
    
    mov ah,1
    int 21h
    
    mov bl,al ; small input 
    sub bl,48
    mov v1,al
    
                ; print a space
    
    mov ah,2
    mov dl,' '
    int 21h
    
    
    mov ah,1
    int 21h
    
    mov v2,al
    
    and dx,0
    
    mov dl,al
    sub dl,48
    
    call newline
    
    mov ax,dx
    
    div bl
    
    
    cmp ah,0
    
    jne print_negative_1
    
    mov ah,2
    mov dl,v1 
    
    int 21h
    
    mov dl, ' '
    int 21h
    
    mov dl,v2
    int 21h
    
    call newline
    
    loop loop1
    
print_negative_1:
    
    mov dl,'-'
    mov ah,2
    int 21h
    
    mov dl,'1'
    int 21h 
    
    call newline
    
    
    loop loop1
    
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
