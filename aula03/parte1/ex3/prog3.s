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
    lw      $t1,TRISB($t0)  #
    ori     $t1,$t1,0x000F  # RB0, RB1, RB2, RB3 = 1 (INPUT)
    sw      $t1,TRISB($t0)  # RB0, RB1, RB2, RB3 as input

    lw      $t1,TRISE($t0)
    andi    $t1,$t1,0xFFF0  # RE0, RE1, RE2, RE3 = 0 (OUTPUT)
    sw      $t1,TRISE($t0)  # RE0, RE1, RE2, RE3 as output

loop:
    lw      $t1,PORTB($t0)
    andi    $t1,$t1,0x0001
    xori    $t1,$t1,0x0001

    lw      $t2,LATE($t0)
    andi    $t2,$t2,0xFFFE
    or      $t2,$t2,$t1
    sw      $t2,LATE($t0)

    j       loop
    jr      $ra