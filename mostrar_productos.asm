.globl mostrar_productos

.text

### 
### Presenta los productos junto a su respectivo precio
###
mostrar_productos:

	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)

	la $a0, msj_productos
	li $v0, 4
	syscall

	lw $t0, total_productos
	li $t1, 0                         # i = 0
	
	for:

		beq $t1, $t0, return             # i < total_productos

		move $a0, $t1
		li $v0, 1
		syscall                          # Imprime pos producto

		la $a0, text_punto_espacio
		li $v0, 4
		syscall
		
		lw $a0, ($s0) 
		syscall                          # Imprime producto
		
		la $a0, text_espacio_dolar
		syscall

		lwc1 $f12, ($s1)
		li $v0, 2
		syscall                          # Imprime precio
		
		la $a0, NL
		li $v0, 4
		syscall                          # Imprime salto de línea
		
		addi $t1, $t1, 1                 # i += 1
		addi $s0, $s0, 4                 # Avanza puntero productos
		addi $s1, $s1, 4                 # Avanza puntero precios
		
		j for

return:

	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	addi $sp, $sp, 12
	jr $ra
