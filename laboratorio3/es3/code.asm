.data
buffer: .byte 255           # Allocates 255 bytes for input
msg_valid: .string "VValid\n"
msg_invalid: .string "Invalid number\n"

.text
main:
    li a0, 0                 # File descriptor (0 = stdin)
    la a1, buffer            # Buffer address
    li a2, 255               # Max length
    li a7, 63                # syscall 63: Read string
    ecall

    la t0, buffer            # Pointer to buffer

check_loop:
    lb t1, 0(t0)            
    li t2, 10          
    beq t1, t2, valid

    li t2, 48                # ASCII value of '0'
    li t3, 57                # ASCII value of '9'
    blt t1, t2, invalid      # If t1 < '0', it's not a valid number
    bgt t1, t3, invalid      # If t1 > '9', it's not a valid number

    addi t0, t0, 1           # Move to the next character
    j check_loop

valid:
    la a0, msg_valid
    li a7, 4
    ecall
    j exit

invalid:
    la a0, msg_invalid   
    li a7, 4
    ecall

exit:
    li a7, 10        
    ecall
