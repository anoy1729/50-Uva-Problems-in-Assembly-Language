.model small
.stack 100h
.data 
    t dw ?
    n dw ?
    x dw ?
    sum dw ?
.code
main proc
    mov ax,@data
    mov ds,ax 
    mov sum,0 
    call taking_input 
    mov n,ax
    call newline  
    mov t,5     
    mov cx,t
    inc cx
    mov t,cx
    level: 
        mov cx,t
        dec cx
        mov t,cx
        cmp cx,0
        je output
        call taking_input
        mov x,ax       
        call newline    
        mov ax,x      
        cmp ax,n
        je cal          
        jmp level 
    cal:
        mov bx,sum
        inc sum
        jmp level
    output:
        mov ax,sum
        call printing_output
        call newline     
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