.globl mostrar_stock

.text 

mostrar_stock:

	addi $sp, $sp, -4
	sw $ra, 0($sp)

	la $a0 msj_stock
	li $v0, 4
	syscall
	
	lw $t2, total_productos
	li $t1, 0                         # i = 0
	la $t3, productos                 # Puntero al primer producto
	la $t4, cantidades                # Puntero al primer stock
	
	for: 
	
		beq $t1, $t2, return
		
		la $a0, text_lista
		li $v0, 4
		syscall 
		
		lw $a0, ($t3)                   # Imprime producto
		syscall
		
		la $a0, text_puntos_espacio
		syscall
		
		lw $a0, ($t4) 
		li $v0, 1
		syscall                         # Imprime stock
		
		la $a0, text_unidades
		li $v0, 4
		syscall
		
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
	