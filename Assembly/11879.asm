.model small
.stack 100h

.data
input db 1002 dup(?) 
yes db '1', 10, 13, '$'
no db '0', 10, 13, '$'

.code

main proc

mov ax, @data
mov ds, ax

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
    xor ax, ax
    mov al, 0[input]
    sub al, 30h 
    mov si, 1
    cmp cx, 1
    jl comp
division:
    	
   mov bx, 10	
   imul bx
   add al, si[input]
   inc si 
   sub al, 30h
   cwd 		
   mov bx, 17	
   idiv bx
   mov ax, dx
    	
loop division:
     
comp:
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