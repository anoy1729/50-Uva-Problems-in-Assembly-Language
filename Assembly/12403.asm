;12403 - save setu

.model small
.stack 100h
.data

n db 0

.code 

main proc 
    
      mov ax,@data
      mov ds,ax     ; initilize the data segment
      
      mov ah,1
      int 21h
      mov cl,al
      sub cl,48
      call newline
      
loop1:
        
      mov bl,0 
        
      ; taking the string
loop2:
          
      mov ah,1
      int 21h
          
      cmp al,13
      je loop2end
          
      cmp bl,0
      jne loop2
          
      inc bl
      mov bh,al
         
      jmp loop2:
        
loop2end:
        
      call newline
        
      cmp bh,64h
      jne print_the_result
        
      mov ah,1
      int 21h
      sub al,48
      add n,al ; n+=al 
        
      jmp continue_loop2
      
print_the_result:
      add n,48
      mov ah,2
      mov dl,n
      int 21h
      sub n,48
       
continue_loop2:
      call newline
      dec cl
      cmp cl,0
      je exit
       
      jmp loop1
    
exit:
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