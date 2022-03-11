[bits 16]
[org 0x7c00]

start:

xor ax,ax
mov ds,ax
mov es,ax
mov bx,0x8000


mov si, suprise
call print_string

suprise db 'me cago en tus muertos',13,0 ;Your Simple Bootloader Text

print_string:
mov ah,0x0E

.repeat_next_char:
lodsb
cmp al, 0
je .done_print
int 0x10
jmp .repeat_next_char

.done_print
ret

times (510 - ($ - $$)) db 0x00
dw 0xAA55 ;Boot Sector Signature