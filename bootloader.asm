org 0x7c00

boot:
  ; Activating A20 gate
  mov ax, 0x2401 
  int 0x15 

  xor ax, ax
  mov ds, ax 
  mov ss, ax
  mov sp, 0x9c00
  
  cli
  ; Loading the game
  mov ah, 0x2 ; read sectors
  mov al, 1 ; sectors to read
  mov ch, 0 ; cylinder idx
  mov dh, 0 ; head idx
  mov cl, 2 ; sector idx
  mov bx, game
  int 0x13
  
  jmp game
 
  times 510 - ($ - $$) db 0
  dw 0xaa55

%include "game.asm"

