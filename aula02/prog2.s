    .equ    READ_CORE_TIMER,11
    .equ    RESET_CORE_TIMER,12
    .equ    PUT_CHAR,3
    .equ    PRINT_INT,6
    .data
    .text
    .globl  main

main:       addiu   $sp,$sp,-8
            sw      $ra,0($sp)
            sw      $s0,4($sp)

            li  $s0,0                # counter=0

while:      li  $a0,1000  
            jal delay

            addi    $s0, $s0, 1             
            move    $a0, $s0           

            li      $a1,0x0004000A

            li  $v0,PRINT_INT
            syscall
        
            li  $a0,'\r'
            li  $v0,PUT_CHAR
            syscall

            j   while

            li  $v0,0       # return 0
            lw  $ra,0($sp)
            lw  $ra,4($sp)
            addiu $sp,$sp,8

            jr $ra #
        
delay:      move    $t0,$a0         # $t0 = ms

            li  $v0,RESET_CORE_TIMER
            syscall
while3:
            li  $v0,READ_CORE_TIMER
            syscall
            li  $t1,20000
            mul $t3,$t1,$t0
            blt $v0,$t3,while3
            jr $ra