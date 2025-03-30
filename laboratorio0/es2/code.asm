# Writing a value to a memory cell
# Declaration of a variable initialized with the
# value 3 in decimal
# wVar: .word 3
.data
wVar: .word 3
text1: .string "Il valore della cella wVar vale inizialmente: "
text2: .string "\nIl valore della cella wVar ora vale: "

.text
main:
    # stampo una stringa con il codice 4 (ecall)
    la a0, text1
    li a7, 4
    ecall
    
    # carico il contenuto della word con lw 
    # poi stampo con il codice ecall 1 (stampa intero)
    lw a0, wVar
    li a7, 1
    ecall
    
    # memorizzo l'indirizzo di wVar in un registro permanente
    # poi lo riscrivo con 10 (hardcoded)
    li t0, 10 
    la s11, wVar
    sw t0, 0(s11)
    
    
    # stampo il testo
    la a0, text2
    li a7, 4
    ecall
    
    # stapo il contenuto della cella
    lw a0, wVar
    li a7, 1
    ecall
    
    li a7, 10
    ecall