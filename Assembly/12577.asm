.model small
.stack 100h

.data
hajj db 'hajj-e-akbar', 10, 13, '$'
umrah db 'hajj-e-asghar', 10, 13, '$'

.code 

main proc 
    
start:
    mov ah, 1
    int 21h
    mov bl, al
huddai:
    int 21h
    cmp al, 13
    jne huddai
    
    cmp bl, '*'
    je exit
    cmp bl, 'h'
    je akbar
    
    lea dx, umrah
    mov ah, 9
    int 21h
    jmp start
    
akbar:
    lea dx, hajj
    mov ah, 9
    int 21h
    jmp start
    
exit:
    ret
main endp