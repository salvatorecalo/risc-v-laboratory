.data
text: .string "Insert the values of the vector: \n"  # Prompt the user for input
vett: .word 0,0,0,0,0  # Array to hold the input values
buffer: .word 255  # Buffer to store input

.text
main:
    la t0, vett  # Load the address of the vector into register t0
    li t1, 4  # Set the counter (t1) to 4 (we will read 5 values in total)
    li t5, 1  # Set t5 to 1, to use as a decrement step
    la a0, text  # Load the address of the prompt message into a0
    li a7, 4  # System call for printing a string
    li s11, 0x30  # Store the ASCII value of '0' (48) in s11
    ecall  # Make the system call to print the prompt
    
    li t4, 100000000  # Initialize t4 with a large value (used for minimum comparison)
ciclo:
    la a1, buffer  # Load the address of the buffer into a1
    li a2, 255  # Set the maximum number of bytes to read
    li a0, 0  # Set a0 to 0 (sys read)
    li a7, 63  # System call for reading input
    ecall  # Make the system call to read user input
    lw a0, 0(a1)  # Load the first byte of input into a0
    andi a0, a0, 255  # Mask the input to make sure it's a valid byte
    sub a0, a0, s11  # Convert the ASCII value to a number by subtracting '0'
    sw a0, 0(t0)  # Store the result in the vector at the current position (t0)
    blt a0, t4, minne  # If the value is smaller than the current minimum, go to minne
    sub t1, t1, t5  # Decrement the counter (t1)
    beqz t1, fine  # If t1 reaches 0, exit the loop
    j ciclo  # Jump back to the start of the loop to input the next value

minne:
    addi t4, a0, 0  # Update the minimum value in t4
    j ciclo  # Continue the loop to read the next value

fine:
    addi a0, t4, 0  # Load the minimum value into a0 for printing
    li a7, 1  # System call for printing an integer
    ecall  # Make the system call to print the minimum value
    
    li a7, 10  # System call for exiting the program
    ecall  # Exit the program
