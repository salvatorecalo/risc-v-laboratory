data:
n1: .byte 10
n2: .byte 0x10
n3: .string "1"
res: .zero 4
.text
main:
    lb t0, n1
    lb t1, n2
    lw t2, n3
    sub t0, t0, t1
    add t0, t0, t2
    
    addi a0, t0, 0
    li a7, 1
    ecall
    
    li a7, 10
    ecall
    
    