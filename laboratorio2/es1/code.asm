.data
text: .string "Inserisci un numero: \n"
buffer: .zero 255
dispariText: .string "e dispari \n"
pariText: .string "e pari \n"

.text
main:
    li s11, 0x30
    la a0, text
    li a7, 4
    ecall
    
    li a7, 63
    la a1, buffer
    li a2, 255
    li a0, 0
    ecall
    lw a0, 0(a1)
    andi a0, a0, 255
    sub a0, a0, s11
    andi a0, a0, 1
    beq a0, zero, pari
    j dispari
pari:
    la a0, pariText
    li a7, 4
    ecall
    j fine
dispari:
    la a0, dispariText
    li a7, 4
    ecall
fine:
    li a7, 10
    ecall