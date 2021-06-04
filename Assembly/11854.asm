.model small
.stack 100h

.data 
	right db 'right', 10, 13, '$'
	wrong db 'wrong', 10, 13, '$'

.code

main proc
start:  
    call scan 
    mov bh, dl
    call scan
    mov bl, dl
    call scan
    mov ch, dl
    
    cmp bh, 0
    jne calc
    cmp bl, 0
    jne calc
    cmp ch, 0
    je endmain
    
calc:
    xor ax, ax  
    mov al, bh
    imul al
    mov bh, al
    xor ax, ax  
    mov al, bl
    imul al
    add bh, al
    xor ax, ax  
    mov al, ch
    imul al
    
    cmp al, bh
    je printright
    
    lea dx, wrong
    mov ah, 9
    int 21h
    jmp start   
    
printright:
    lea dx, right
    mov ah, 9
    int 21h 
    
    jmp start   
endmain:
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
  