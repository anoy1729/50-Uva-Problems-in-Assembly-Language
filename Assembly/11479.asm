.model small
.stack 100h

.data
inv db 'invalid$'
equ db 'equilateral$'
iso db 'isosceles$'
sca db 'scalene$'
nl db 10, 13, '$'

.code

main proc
    mov ax, @data
    mov ds, ax
    
    call scan       
    mov cx, 0      
    mov cl, dl
    
testcase:
    push cx
        
    call scan   
    mov bh, dl
    call scan
    mov bl, dl
    call scan
    mov ch, dl
        
       
    xor ax, ax  
    mov al, bh
    add al, bl
    cmp al, ch
    jl invalid
        
    xor ax, ax  
    mov al, bh
    add al, ch
    cmp al, bl
    jl invalid
        
    xor ax, ax  
    mov al, ch
    add al, bl
    cmp al, bh
    jl invalid
        
        
    cmp bh, bl
    jne nequal
    cmp bh, ch
    je equilateral  
    jne isosceles   
        
nequal:
    cmp bh, ch
    je isosceles    
    cmp bl, ch
    je isosceles    
    jmp scalene     
        
       
invalid:
     mov ah, 9
     lea dx, inv
     int 21h
     jmp newline
        
equilateral:
        mov ah, 9
        lea dx, equ
        int 21h
        jmp newline
        
isosceles:
        mov ah, 9
        lea dx, iso
        int 21h
        jmp newline 
        
scalene:
        mov ah, 9
        lea dx, sca
        int 21h
        
newline:
        lea dx, nl
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

