.model small
.stack 100h
.code
main proc
    
    mov ah,1
    int 21h    ;input for test case 
    mov cl,al
    sub cl,48  ; cl -= 48 
    
    mov ah,2
    mov dl,10
    int 21h       ; print a new line
    mov dl,13
    int 21h
    
loop1:
    mov ah,1
    int 21h
    mov bl,al    ;taking input for the degit
    
    mov ah,2
    mov dl,' '   ; print a space
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    
    cmp bl,bh
    jl less       ; jump if bl is less than bh
    jg greater    ; jump if bl is greater tha bh
    je equal      ; jump if bl == bh
    
less:
    
    mov ah,2
    mov dl,10
    int 21h       ; print a new line
    mov dl,13
    int 21h
      
    mov dl,'<'
    int 21h               ; print < 
    jmp continue_loop
      
      
greater:
    mov ah,2
    mov dl,10
    int 21h       ; print a new line
    mov dl,13
    int 21h
      
    mov dl,'>'
    int 21h                 ; print >
    jmp continue_loop
       
equal:
    mov ah,2
    mov dl,10
    int 21h       ; print a new line
    mov dl,13
    int 21h
     
    mov dl,'='
    int 21h
    jmp continue_loop   
    
continue_loop: 

    mov ah,2
    mov dl,10
    int 21h       ; print a new line
    mov dl,13
    int 21h
    
    
    dec cl        ; c--
    cmp cl,0
    jge loop1     ; jump if cl is greater than 0     
    
exit:
    
    mov ah,4ch
    int 21h
    
main endp
    end main