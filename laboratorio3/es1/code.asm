.data
op1: .word 0x0000D000 
op2: .word 0xFFFFD000 
msg: .string "There is overflow \n"
.text
main:
   # op1 * op1
   lw t0, op1
   lw t1, op1
   mulhu a0, t1, t0
   bnez a0, next1
   la a0, msg
   li a7, 4
   ecall
   j next1
next1:
    # op2 * op2
    lw t0, op2
    lw t1, op2
    mulhu a0, t1, t0
    beqz a0, next2
    la a0, msg
    li a7, 4
    ecall
    j next2
next2: 
    # op1 * op2
    lw t0, op1
    # it already has op2 in t1
    mulhu a0, t1, t0
    beqz a0, fine
    la a0, msg
    li a7, 4
    ecall
    j fine
fine:
    li a7, 10
    ecall