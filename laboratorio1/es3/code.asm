.data
text: .string "sum = "
op1: .byte 150
op2: .byte 100

.text
main:
    la t0, op1
    lbu t1,0(t0)
    
    la t0, op2
    lb t2, 0(t0)
    
    la a0, text
    li a7, 4
    ecall
    
    li a0, 0
    add a0, a0, t1
    add a0, a0, t2
    li a7, 1
    ecall
    
    li a7, 10
    ecall