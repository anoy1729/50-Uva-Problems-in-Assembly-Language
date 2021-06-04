.model small
.stack 100h
.data
    str db "may 29, 2013 wednesday $"
.code
main proc
    mov ax,@data
    mov ds,ax
    lea dx,str
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h
    main endp
end main