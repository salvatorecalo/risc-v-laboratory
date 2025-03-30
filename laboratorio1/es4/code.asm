.data
var: .word 0x3FFFFFF0

.text
main:
    lw t1, var
    slli, t1, t1, 1
    
    mv a0, t1
    li a7, 34
    ecall
    
    li a0, 40
    li a7, 34
    ecall
    
    li a7, 10
    ecall