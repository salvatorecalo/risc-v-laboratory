.data
num1: .word 4
num2: .word 2
num3: .word 6

.text
main:
    lw t0, num1
    lw t1, num2
    lw t2, num3
    blt t0, t1, swap2
    add t0, t0, t1
    sub t1, t0, t1
    sub t0, t0, t1
swap2:
    blt t0, t2, swap3
    add t0, t0, t2
    sub t2, t0, t2
    sub t0, t0, t2
swap3:
    blt t1, t2, fine
    add t1, t1, t2
    sub t2, t1, t2
    sub t1, t1, t2
    
fine:
    li a7, 10
    ecall