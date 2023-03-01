    .equ    BASE,0xBF88
    .equ    TRISE,0X6100
    .equ    LATE,0X06120
    .equ    TRISB,0x6040
    .equ    PORTB,0x6050

    .data
    .text
    .globl  main

main:  
    lui     $t0,BASE        # $t0 = 0xbf880000
    
    lw      $t1,TRISE($t0)
    andi    $t1,$t1,0xFFE1  # 1111111111100001
    sw      $t1,TRISE($t0)  # set as ouput

    li      $t2,0           # counter = 0

loop:
    lw      $t3,LATE($t0)
    andi    $t3,$t3,0xFFE1
    sll     
