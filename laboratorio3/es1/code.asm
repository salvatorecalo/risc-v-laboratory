.data
op1: .word 0x0000D000 
op2: .word 0xFFFFD000 
msg: .string "overflow \n"
msg2: .string "\n"

.text
main:
   # op1 * op1
   lw t0, op1
   lw t1, op1
   mulhu a0, t1, t0
   beqz a0, print1  # If the upper part is 0, print the number.
   la a0, msg       # else print overflow message
   li a7, 4
   ecall
   la a0, msg2
   li a7, 4
   ecall
   j next1

print1:
   mul a0, t0, t1
   li a7, 36
   ecall
   la a0, msg2
   li a7, 4
   ecall
   j next1

next1:
   # op2 * op2
   lw t0, op2
   lw t1, op2
   mulhu a0, t1, t0
   beqz a0, print2
   la a0, msg
   li a7, 4
   ecall
   la a0, msg2
   li a7, 4
   ecall
   j next2

print2:
   mul a0, t0, t1
   li a7, 36
   ecall
   la a0, msg2
   li a7, 4
   ecall
   j next2

next2: 
   # op1 * op2
   lw t0, op1
   # the register t1 already has op2
   mulhu a0, t1, t0
   beqz a0, print3
   la a0, msg
   li a7, 4
   ecall
   la a0, msg2
   li a7, 4
   ecall
   j fine

print3:
   mul a0, t0, t1
   li a7, 36
   ecall
   la a0, msg2
   li a7, 4
   ecall
   j fine

fine:
   li a7, 10
   ecall
