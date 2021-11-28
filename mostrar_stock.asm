.globl mostrar_stock

.text 

### 
### Presenta la cantidad restante de unidades de cada producto
###
mostrar_stock:

	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s2, 8($sp)

	la $a0 msj_stock
	li $v0, 4
	syscall

	lw $t0, total_productos
	li $t1, 0                         # i = 0

	for: 

		beq $t1, $t0, return             # i < total_productos

		la $a0, text_lista
		li $v0, 4
		syscall 

		lw $a0, ($s0)                    # Imprime producto
		syscall

		la $a0, text_puntos_espacio
		syscall

		lw $a0, ($s2)
		li $v0, 1
		syscall                          # Imprime stock

		la $a0, text_unidades
		li $v0, 4
		syscall
		
		la $a0, NL
		syscall                          # Imprime salto de línea

		addi $t1, $t1, 1                 # i += 1
		addi $s0, $s0, 4                 # Avanza puntero productos
		addi $s2, $s2, 4                 # Avanza puntero stock
		
		j for

return:

	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 12
	jr $ra
	
