.model small
.stack 100h

.data

imp db 'impossible', '$'
nl db 10, 13, '$' 
a db ?
b db ?

.code

main proc
    mov ax, @data
    mov ds, ax
    
    call scan  
    mov cx, 0   
    mov cl, dl
    lea dx, nl
    mov ah, 9
    int 21h
    
testcase:
    push cx
    call scan  
    mov [a], dl
    call scan  
    mov [b], dl
    cmp [a], dl
       
    jl impossible
    mov cx, 0   
    add cl, [a]
    add cl, [b]
    and cl, 1
    jnz impossible
    cwd
    mov ax, 0
    add al, [a]
    add al, [b]
    mov cx, 2
    idiv cx     
    call print  
         
    mov dl, ' '
    int 21h    
        
    cwd
    mov ax, 0
    mov al, [a]
    sub al, [b] 
    mov cx, 2
    idiv cx     
    call print  
        
    jmp newline
        
impossible:
    lea dx, imp
    mov ah, 9
    int 21h
        
newline:
    lea dx, nl
    mov ah, 9
    int 21h
        
    pop cx
    loop testcase
    ret
main endp

scan proc       
    mov dx, 0
input:
    mov ah, 1
    int 21h  
    cmp al, ' '
    je end
    cmp al, 13
    je end
    push ax
    mov al, 10
    mul dl
    mov dl, al
    pop ax
    sub al, '0'
    add dl, al
    jmp input
end: 
    ret
scan endp 



print proc
    xor cx, cx
loop1:
    cwd 
    mov bx, 10
    idiv bx
    push dx
    inc cx
    cmp ax, 0
    jg loop1
    
loop2:
    pop dx 
    add dx, '0'
    mov ah, 2
    int 21h
    loop loop2  
    ret
print endp 