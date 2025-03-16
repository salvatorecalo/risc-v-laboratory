.data
text: .string "\nInserisci un numero frocio: "
buffer: .word 255
vett: .word 0, 0, 0, 0, 0
.text
main:
    la t0 vett
    li t1 5
    la s11, vett
    li t5, 1
    li t3, 0x30
ciclo:
    la a0, text
    li a7, 4
    ecall
    la a1, buffer
    li a2, 255
    li a0, 0 # sys read
    li a7, 63
    ecall
    lw a0, 0(a1)
    andi a0,a0,255
    li s11, 0x30
    sub a0,a0,s11
    #Risultato in a0
    sw a0, 0(t0)
    addi t0, t0, 4
    sub t1, t1, t5
    beqz t1, pippo 
    j ciclo
pippo:
    li t1, 5
ciclo2:
    lw a0, 0(s11)
    li a7, 1
    ecall
    addi s11, s11, 4
    sub t1, t1, t5
    beqz t1, fine
    j ciclo2
    
fine:
    li a7, 10
    ecall
    