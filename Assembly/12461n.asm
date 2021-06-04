.model small
.stack 100h
.data
    n dw ?
    s db "1/2 $"
.code
main proc
    mov ax,@data
    mov ds,ax    
    call taking_input  
    mov n,ax        
    call newline      
    mov ah,9
    lea dx,s
    int 21h
    exit:
        mov ah,4ch
        int 21h         
    main endp  

newline proc 
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        ret            
    newline endp 

taking_input proc
        mov cx,0
        input:
        mov ah,1
        int 21h
        cmp al,13
        jne calc
        mov ax,cx 
        ret
        calc:
        sub al,48
        mov ah,0
        mov bx,ax
        mov dx,10
        mov ax,cx
        mul dx
        add ax,bx        
        mov cx,ax
        jmp input    
    taking_input endp  

printing_output proc
        mov cx,0        
        print:
        mov dx,0
        mov bx,10
        div bx
        push dx
        inc cx
        cmp ax,0
        jne print        
        printf:
        mov ah,2
        pop dx
        add dl,48
        int 21h
        loop printf        
        ret        
    printing_output endp
end main