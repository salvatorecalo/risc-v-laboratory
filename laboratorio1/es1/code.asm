# Write a value to a register and its
# verification on Ripes.
# The following values are stored:
# $t0 value 10 in decimal
# $s0 value DC in hexadecimal
.data
text1: .string "Il contenuto della cella t0 vale: "
text2: .string "\nIl contenuto della cella t1 vale: "
.text
main:
    la a0, text1
    li a7, 4
    ecall
    
    li t0, 10
    addi a0, t0, 0
    li a7, 1
    ecall 
    
    la a0, text2
    li a7, 4
    ecall
    
    li t1, 0xDC
    addi a0, t1, 0
    li a7, 34
    ecall 
    
    li a7, 10
    ecall