bits 32
_main:
;its hard to live
 mov edi, 0xB8000
   mov esi, string
   mov ah, 0x0F
   .displaying:
   lodsb
   stosw
   or al, al
   jnz .displaying
   jmp short $
 
string: db "its hard to live", 0
