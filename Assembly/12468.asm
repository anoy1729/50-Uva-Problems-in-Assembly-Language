.model small
.stack 100h
.code

main proc  
maintop:
        call scan
        mov bx, ax
        call scan
   
        cmp ax, -1
        jz mainend 
        
        sub ax, bx
        cmp ax, 0
        jg abs
        neg ax
        abs:
        cmp ax, 50
        jle printres
        mov bx, ax
        mov ax, 100
        sub ax, bx
        
printres:
        call print
        mov ah, 2
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h
        jmp maintop
        
mainend:
    ret
main endp


scan proc
    
    push bx
    push cx
    push dx
    
    
    xor bx, bx
    xor cx, cx
    
   
    mov ah, 1
    int 21h
    
   
    cmp al, '-'
    je negative
    cmp al, '+'
    je positive
    jmp inputscan
    
negative:
    
    mov cx, 1
    
positive:
    
    int 21h
    
inputscan:
    
    and ax, 000fh
    
    
    push ax
   
    mov ax, 10
    mul bx
   
    pop bx
    add bx, ax 
    
    mov ah, 1
    int 21h
    cmp al, ' '
    je endinput
    cmp al, -1
    je endinput
    cmp al, 13
    je carriagereturn
    jmp inputscan
    
carriagereturn:
   
    mov ah, 2
    mov dl, 10
    int 21h
    
    
endinput:
    mov ax, bx   
    cmp cx, 0
    je endscan
    neg ax
    
endscan:
    pop dx
    pop cx
    pop bx
    ret
scan endp
  
print proc
    
    push ax
    push bx
    push cx
    push dx
    cmp ax, 0
    jge init
    
    push ax
    mov dl, '-'
    mov ah, 2
    int 21h
    pop ax
    neg ax
    
init:
    xor cx, cx  
    mov bx, 10  
    
digitify:
    cwd        
    div bx
    push dx     
    inc cx
    cmp ax, 0
    jnz digitify
    mov ah, 2
printloop:
    pop dx
    or dl, 30h 
    int 21h
    loop printloop
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print endp
