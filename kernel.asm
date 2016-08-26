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
 
string: db "Testing Modrick OS's New Kernel !", 0
