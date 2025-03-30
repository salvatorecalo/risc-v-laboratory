.data
wOpd1: .word 10
wOpd2: .word 24
text1: .string "La somma dei due operandi vale: "
.text
main:
    lw t0, wOpd1
    lw t1, wOpd2
    add t0, t0, t1
    
    la a0, text1
    li a7, 4
    ecall
        
    addi a0, t0, 0
    li a7, 1
    ecall
    
    li a7, 10
    ecall