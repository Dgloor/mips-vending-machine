.globl mostrar_productos

.text

mostrar_productos:

	addi $sp, $sp, -4
	sw $ra, 0($sp)

	la $a0, msj_productos
	li $v0, 4
	syscall

	lw $t2, total_productos
	li $t1, 0                         # i = 0
	la $t3, productos                 # Puntero al primer producto
	la $t4, precios                   # Puntero al primer precio
	
	for:

		beq $t1, $t2, return            # i < total_productos

		move $a0, $t1
		li $v0, 1
		syscall                         # Imprime pos producto

		la $a0, text_punto_espacio
		li $v0, 4
		syscall
		
		lw $a0, ($t3) 
		syscall                         # Imprime producto
		
		la $a0, text_espacio_dolar
		syscall

		lwc1 $f12, ($t4) 
		li $v0, 2
		syscall                         # Imprime precio
		
		la $a0, NL
		li $v0, 4
		syscall                         # Imprime salto de línea
		
		addi $t1, $t1, 1                # i += 1
		addi $t3, $t3, 4                # Avanza puntero productos
		addi $t4, $t4, 4                # Avanza puntero precios
		
		j for

return:

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
