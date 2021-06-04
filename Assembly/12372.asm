.model small
.stack 100h
.data
	case dw ?
	a dw ?
	b dw ?
	c dw ?
	msg db 'case $'
	msg1 db 'good$'
	msg2 db 'bad$'   
	
.code     

main proc  
start:
    mov case,0
    mov ax,@data
    mov ds,ax
    call scan
    xor cx,cx
    mov cx,ax
loop1:
    inc case
    call scan
    mov a,ax
    call scan
    mov b,ax
    call scan
    mov c,ax
    cmp a,20
    jle n1
    jmp bad
    
n1:
  cmp b,20
  jle n2
  jmp bad 
  
n2:
   cmp c,20
   jle good
   jmp bad 
   
good:
   mov ah,9
   lea dx,msg
   int 21h
   mov ax,case
   call print
   mov ah,2
   mov dx,':'
   int 21h   
   mov dx,' '
   int 21h
   mov ah,9
   lea dx,msg1
   int 21h
   mov ah,2
   mov dx,10
   int 21h
   mov dx,13
   int 21h
  
   loop loop1
   mov ah,2
   mov dx,10
   int 21h
   mov dx,13
   int 21h
   jmp start
   
bad:
   mov ah,9
   lea dx,msg
   int 21h
   mov ax,case
   call print
   mov ah,2
   mov dx,':'
   int 21h   
   mov dx,' '
   int 21h
   mov ah,9
   lea dx,msg2
   int 21h
   mov ah,2
   mov dx,10
   int 21h
   mov dx,13
   int 21h
   
   loop loop1
   mov ah,2
   mov dx,10
   int 21h
   mov dx,13
   int 21h
   jmp start
        
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
    jmp input
    
negative:
    mov cx, 1
    
positive:
   
    int 21h
    
input:
    
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
    cmp al, 13
    je carriagereturn
    jmp input
    
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