.model small
.stack 100h
.code

main proc
start:
    mov ah, 1
    int 21h   
    mov bh, al
    mov ah, 2
    mov dl, ' '
    int 21h
    mov ah, 1
    int 21h   
    mov bl, al
    mov ah, 2
    mov dl, ' '
    int 21h
    mov ah, 1
    int 21h   
    mov ch, al
    mov ah, 2
    mov dl, ' '
    int 21h
    
    cmp bh, bl
    jne nequal
    cmp bh, ch
    je none
    
    mov ah, 2
    mov dl, 'c' 
    int 21h
    jmp newline
    
nequal: 
    cmp bh, ch
    jne nequal2
    mov ah, 2
    mov dl, 'b'
    int 21h
    jmp newline
               
nequal2:
    mov ah, 2
    mov dl, 'a'
    int 21h
    jmp newline
    
none:
    mov ah, 2
    mov dl, '*'
    int 21h
    
newline:
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    jmp start

endmain:
    ret
    
main endp

