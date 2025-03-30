.data
var1: .string "m"
var2: .string "i"
var3: .string "p"
var4: .string "s"
.text
main:
    li t0, 0x61    # t0 = 'a' (ASCII value for lowercase 'a')
    li t1, 0x41    # t1 = 'A' (ASCII value for uppercase 'A')
    sub t0, t0, t1 # t0 = 0x20 (difference between lowercase and uppercase letters)

    # Convert and print the letter in var1
    la a0, var1    # load the address of var1
    lb a1, 0(a0)   # load the letter ('m')
    sub a1, a1, t0 # convert to uppercase by subtracting the difference
    li a7, 11      # syscall to print the character
    mv a0, a1      # move the character to a0
    ecall          # execute the syscall to print the character

    # Convert and print the letter in var2
    la a0, var2
    lb a1, 0(a0)
    sub a1, a1, t0
    li a7, 11
    mv a0, a1
    ecall

    # Convert and print the letter in var3
    la a0, var3
    lb a1, 0(a0)
    sub a1, a1, t0
    li a7, 11
    mv a0, a1
    ecall

    # Convert and print the letter in var4
    la a0, var4
    lb a1, 0(a0)
    sub a1, a1, t0
    li a7, 11
    mv a0, a1
    ecall

    # Exit program
    li a7, 10
    ecall
