bits 32
org 0x7c00
AnyKey db "Press any key to start the os...", 0x0 

_start:
; sample kernel. will modify that soon
   mov edi, 0xB8000
   mov esi, string
   mov ah, 0x0F
   .displaying:
   _PutCH 7
   lodsb
   stosw
   or al, al
   jnz .displaying
   jmp short $
 
string: db "Modrick OS!", 0

call Println
jmp nxt
Println:
    lodsb ;Load string 
    or al, al
    jz complete
    mov ah, 0x0e 	
    int 0x10 ;BIOS Interrupt 0x10 - Used to print characters on the screen via Video Memory 
    jmp Println ;Loop   	
complete:
    call PrintNwL

;Prints empty new lines like '\n' in C/C++ 	
PrintNwL: 
    mov al, 0	; null terminator '\0'
    stosb       ; Store string 

    ;Adds a newline break '\n'
    mov ah, 0x0E
    mov al, 0x0D
    int 0x10
    mov al, 0x0A 
    int 0x10
	ret

nxt: 
    mov si, AnyKey
    call Println
    call GetPressedKey 

    db 0x0ea 
    dw 0x0000 
    dw 0xffff 

;Gets the pressed key 
GetPressedKey:
    mov ah, 0
    int 0x16  ;BIOS Keyboard Service 
    ret 
