.globl mostrar_productos

.text

### 
### Presenta los productos junto a su respectivo precio
###
mostrar_productos:

	addi $sp, $sp, -20
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	sw $s4, 16($sp)

	la $a0, msj_productos
	li $v0, 4
	syscall

	lw $t0, total_productos
	li $t1, 0                         # i = 0
	
	for:

		beq $t1, $t0, return             # i < total_productos
		
		lw $t3, ($s2)                   # t3 = stock producto
		beq $t3 $zero, next             # No mostrar producto si stock = 0

		li $v0, 1
		move $a0, $t1
		syscall                          # Imprime pos producto

		li $v0, 4
		la $a0, text_punto_espacio
		syscall
		
		lw $a0, ($s0) 
		syscall                          # Imprime producto
		
		la $a0, text_espacio_dolar
		syscall

		li $v0, 2
		lwc1 $f12, ($s1)
		syscall                          # Imprime precio
		
		l.s $f1, porcentaje_min_stock
		
		l.s $f2, ($s2)                    # Carga stock actual
		l.s $f3, ($s4)                    # Carga stock original
	
		div.s $f0, $f2, $f3               # stock actual / stock original
		c.le.s $f0, $f1                   # división anterior < porcentaje minimo ?
		bc1f next
		
		mostrar_msj_stock:
		
		li $v0, 4
		la $a0, msj_stock_bajo
		syscall
		
		next:
		
		li $v0, 4
		la $a0, NL
		syscall                          # Imprime salto de línea
		
		addi $t1, $t1, 1                 # i += 1
		addi $s0, $s0, 4                 # Avanza puntero productos
		addi $s1, $s1, 4                 # Avanza puntero precios
		addi $s2, $s2, 4                 # Avanza puntero stock
		addi $s4, $s4, 4                 # Avanza puntero stock original
		
		j for

return:

	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s4, 16($sp)
	addi $sp, $sp, 20
	jr $ra
