.model small
.stack 100h
.data

str dw "The 1500'th ugly number is 859963392$" 

.code
main proc
    
    
    mov ax,@data
    mov ds,ax 
    
    
    lea dx,str
    mov ah,9
    int 21h 
    
    
exit:
    
    mov ah,4ch
    int 21h
    


main endp

    end main


