.model small
.stack 100h
.code

main proc

start:
    call scan  
    cmp dl, 0
    je exit
    cmp dl, 100
    jg greater
    mov dl, 91  
    jmp result
    
greater:
    sub dl, 10
    
result:
    mov ax, 0
    mov al, dl
    call print
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h  
    jmp start  

exit:
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
