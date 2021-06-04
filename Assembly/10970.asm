.model small
.stack 100h
.code

main proc
        
        
loop1:
      
   ;for 1st input
   
   mov ah,1
   int 21h
   
   mov bl,al 
   sub bl,48
   
   ; print a space
   
   mov ah,2
   mov dl,' '
   int 21h
   
   
   ;for 2nd input
   
   mov ah,1
   int 21h
   mov bh,al
   sub bh,48
   
   
   
   and ax,0 ; ax = 0
   
   mov al,bh
   
   mul bl   ; ax = al*bl
   
   sub ax,1  ; ax-=1
   
   and bx,0 ; bx = 0
   
   
   mov bx,ax
   add bl,48
   
   
   ;print newline 
       
   mov ah,2
   mov dl,0dh
   int 21h
   mov dl,0ah
   int 21h 
        
   ;print output
   
   mov dl,bl
   int 21h
   
   ;new line
        
   mov dl,0dh
   int 21h
   mov dl,0ah
   int 21h
  
   jmp loop1
          
   mov ah,4ch
   int 21h
    
main endp
        end main