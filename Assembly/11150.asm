.model small
.stack 100h
.data
    n db 3
    n2 db ?

.code 

main proc 
    
      mov ax,@data
      mov ds,ax     ; initilize the data segment
      
      
loop1:
      ; for input
      mov ah,1
      int 21h
      mov n2,al
      sub n2,48
      
      and bl,0 ; bl = 0
      mov bh,n2
      
loop2:
      
      and ax,0 ; ax = 0
      
      mov al,n2
      
      div n ; al/=n
      
      add bl,al
      
      add al,ah ; al+=ah
      
      mov n2,al ; n2 = al
      
      cmp n2,1
      jle not_to_add_1
      
      cmp n2,2
      je add_1
      
      
      
      jmp loop2
      
not_to_add_1: 
       
      add bl,bh
      add bl,48
         
      call newline
         
      mov ah,2
      mov dl,bl
      int 21h
      call newline
       
      jmp loop1
      
      
add_1:
       
      add bl,bh
      add bl,49  ; adding 1
         
      call newline
         
      mov ah,2
      mov dl,bl
      int 21h
      call newline
      
      
      jmp loop1
    
    
      mov ah,4ch
      int 21h
    
main endp 

newline proc
        
      push ax
      push dx
        
        
      mov ah,2
      mov dl,0dh
      int 21h
      mov dl,0ah
      int 21h
        
      pop dx
      pop ax
        
        
      ret
        
newline endp



end main