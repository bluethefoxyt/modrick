bits 32
_start:
; sample kernel. will modify that soon
   mov edi, 0xB8000
   mov esi, string
   mov ah, 0x0F
   .displaying:
   lodsb
   stosw
   or al, al
   jnz .displaying
   jmp short $
 
string: db "Modrick OS", 0
restart: 
db 0x0ea 
dw 0x0000 
dw 0xffff
