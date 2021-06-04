.model small
.stack 100h  
 
.code

main proc 
    
     
    loop1:
        mov ah,1
        int 21h           
        mov bl,al 
                        ; print a space
        mov ah,2
        mov dl,' '  
        int 21h
     
                        ; for 2nd input 
        mov ah,1    
        int 21h
     
        mov bh,al 
     
                        ;comparing two inputs
          
        cmp bh,bl
        jg label1           ;jump if bh>bl 
     
                        ; as bl is greate than bh, bl-=bh
     
        sub bl,bh
        mov bh,bl      
        add bh,48       ;adding 48 for ascci valu
        jmp label2
     
     label1:
                        ; as bh is greater than bl bh-=bl
     
        sub bh,bl
        add bh,48           ;adding 48 for ascci valu
     
     label2:  
     
     ;for output
        
        mov ah,2 
        mov dl,13          ; print a new line
        int 21h
        mov dl,10
        int 21h 
                  
        mov dl,bh       ; print the output
        int 21h 
        
        mov dl,13
        int 21h
        mov dl,10         ; print a newline
        int 21h
        
        jmp loop1
  
        mov ah,4ch
        int 21h
    
main endp
        end main

ret
