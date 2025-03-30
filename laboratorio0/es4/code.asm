.data
wVett: .word 5, 7, 3, 4, 3
wResult: .zero 4
.text
main:
    la t1, 0
    la t0, wVett
    lw t2, 0(t0)
    add t1, t1, t2
    lw t2, 4(t0)
    add t1, t1, t2
    lw t2, 8(t0)
    add t1, t1, t2
    lw t2, 12(t0)
    add t1, t1, t2
    la s11, wResult
    sw t1, 0(s11)
    
    addi a0, t1, 0
    li a7, 1 # print integer number
    ecall
    li a7, 10 #exit
    ecall