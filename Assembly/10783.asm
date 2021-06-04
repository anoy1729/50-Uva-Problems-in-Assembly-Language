.model small
.stack 100h
.data

.code

main proc
    
    mov ah,1
    int 21h
    mov cl,al
    sub cl,30h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13   ; print a new line
    int 21h
    
    loop:
    mov ah,1
    int 21h
    mov bh,al    ; taking the first input
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13   ; print a new line
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al    ; taking the second input
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13   ; print a new line
    int 21h
    
    sub bh,30h
    sub bl,30h
    
    mov al,bh
    add al,48
    
loop2:
    
    sub al,2        
    cmp al,1
    jg loop2
    je odd
    jl even
    
    
odd: 
    mov ch,0
    jmp loop3 
      
    
even:
    add bh,1
    
    mov ch,0;
    
loop3:
    
    add ch,bh
                    ;for summing 
    
    add bh,2
    
    cmp bh,bl
    jle loop3
    
    add ch,48    
    
    mov dl,ch
    int 21h
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    dec cl    ; cl--
    cmp cl,0  ; 
    jg loop    
    
exit:
    
    mov ah,4ch
    int 21h

main endp
        end main