.data
buffer: .byte 255
.text
main:
    li s11, 0x30 # 0: used to convert from strin input to int
    li a7, 63
    la a1, buffer
    li a0, 0
    li a2, 255
    ecall
    lw a0, 0(a1)
    andi a0, a0, 255
    sub a0, a0, s11
    mv t1,a0
    li a7, 63
    li a0,0
    la a1, buffer
    li a2,255
    ecall
    lw a0, 0(a1)
    andi a0,a0,255
    sub a0,a0,s11
    mv t2,a0
    add t1,t1,t2
    sub t2,t1,t2
    sub t1,t1,t2

    li a7,10
    ecall