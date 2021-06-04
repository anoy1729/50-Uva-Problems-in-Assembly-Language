.model small
.stack 100h
.data



.code
main proc
    
    loop1:
    
        mov ah,1
        int 21h
    
        mov bl,al 
        sub bl,48
    
        mov ah,2
        mov dl, ' '
        int 21h
    
        mov ah,1
        int 21h
        mov bh,al
        
        sub al,48
    
    
        mov cl,1 
        cmp bl,1
        je level
    
    loop2:
     
        add bh,al
        
        inc cl
        cmp cl,bl
        jl loop2
     
     
    level:
        mov al,bh
        sub al,48
     
        add bh,al

     
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        mov dl,bh
        int 21h
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
    
        jmp loop1 
            
        mov ah,4ch
        int 21h
    
main endp
        end main