.data
text: .string "somma = "
vett: .word 5, 7, 3, 4,
.text
main:
    la t0, vett
    li t3, 4
    li t2, 0
    li t1, 0
    li t5, 1
ciclo:
    lw t2, 0(t0)
    add t1 , t1, t2
    sub t3, t3, t5
    addi t0, t0 , 4
    beqz t3, fine
    j ciclo
fine:
    
    la a0, text
    li a7, 4
    ecall
    
    li a0, 0
    add a0, a0, t1
    li a7, 1
    ecall
    
    li a7, 10
    ecall
        
    