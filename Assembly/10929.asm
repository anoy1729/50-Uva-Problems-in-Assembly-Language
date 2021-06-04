.model small
.stack 100h

.data

	input db 1002 dup(?)
	yes db ' is a multiple of 11', 10, 13, '$'
	no db ' is not a multiple of 11', 10, 13, '$' 

.code

main proc 

    mov ax, @data
    mov dx, ax

testcase:
        
    mov si, 0
    mov cx, 0
    mov ah, 1
    int 21h
    cmp al, '0'
    je endcase
    
inputloop:
    mov si[input], al
    inc si
    int 21h
    cmp al, 13
    jz endinput
    jmp inputloop
endinput:
    mov si[input], 36
    
    mov cx, si
    dec cx
    dec cx    
    mov bx, 10	
    xor ax, ax
    mov al, 0[input]
    sub al, 30h 
    imul bx
    add al, 1[input] 
    sub al, 30h
    mov si, 2
    cmp cx, 1
    jl comp
division:
    	
    cwd
    mov bx, 11
    idiv bx
    mov ax, dx
    mov bx, 10
    imul bx
    add al, si[input]	
    sub al, 30h  		
    inc si
    	
loop division:
     
comp:
    push ax
    mov ah, 9
    lea dx, input
    int 21h
    
    pop ax
    mov bx, 11
    cwd
    idiv bx
    cmp dx, 0
    jz printyes
    
    mov ah, 9
    lea dx, no
    int 21h
    jmp testcase
    
printyes:
    mov ah, 9
    lea dx, yes
    int 21h
    jmp testcase
    	    
endcase:  
	ret 
	
	
	
	main endp

 