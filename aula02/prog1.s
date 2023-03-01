    .equ    READ_CORE_TIMER,11
    .equ    RESET_CORE_TIMER,12
    .equ    PUT_CHAR,3
    .equ    PRINT_INT,6
    .data
    .text
    .globl  main

main:       li  $t0,0                # counter=0

while:                              # while (1) {
            li  $v0,RESET_CORE_TIMER #
            syscall                 # resetCoreTimer()

while2:     li  $v0,READ_CORE_TIMER
            syscall
            blt $v0,200000,while2

            move    $a0,$t0
            addi    $t0,$t0,1       # counter++
            la      $a1,0x0004000A

            li  $v0,PRINT_INT
            syscall
        
            la  $a0,'\r'
            li  $v0,PUT_CHAR
            syscall

            j   while

            jr $ra #