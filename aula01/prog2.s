    .equ getChar,2
    .equ putChar,3

    .data
    
    .text   
    .globl main

main:
do:     li  $v0,getChar
        syscall

        move    $t0,$v0
        
        li      $v0,putChar
        syscall
        move    $a0,$t0

while:  bne $t0,'\n',do
        li  $v0,0
        jr  $ra