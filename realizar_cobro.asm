.globl realizar_cobro

.text

###
### Solicita el ingreso de dinero para realizar el cobro
###
realizar_cobro:

	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $s1, 8($sp)
	
	sll $t3, $a0, 2                   # Posición producto * 4 (offset)
	add $t3, $s1, $t3                 # Inicio array + offset
	lwc1 $f20, ($t3)                  # Precio producto
	
	mtc1 $zero, $f4
	add.s $f4, $f4, $f20              # restante por pagar
	mtc1 $zero, $f5                   # dinero_ingresado = 0
	
	while:
	
		c.lt.s $f5, $f20                 # while dinero_ingresado < precio_producto
		bc1f endWhile
	
		li $v0, 4
		la $a0, msj_total_producto
		syscall
	
		li $v0, 2
		mov.s $f12, $f20
		syscall                          # Imprime precio producto
	
		li $v0, 4
		la $a0, msj_dinero_ingresado
		syscall
	
		li $v0, 2
		mov.s $f12, $f5
		syscall                          # Imprime dinero ingresado

		li $v0, 4
		la $a0, msj_restante
		syscall
	
		li $v0, 2
	  mov.s $f12, $f4
		syscall                          # Imprime restante a pagar
	
		li $v0, 4
		la $a0, NL
		syscall
	
		la $a0, msj_denominaciones
		syscall                          # Imprime denominaciones válidas
	
		la $a0, input_dinero
		syscall
	
		li $v0, 6
		syscall
		mov.s $f12, $f0

		jal validar_denominacion
		
		bne $v0, 0, else
		
		li $v0, 4
		la $a0, msj_error_denominacion
		syscall                          # Muestra error si dinero no es una denominación válida
		
		j while

		else:
		
		add.s $f5, $f5, $f0              # dinero_ingresado += dinero
		sub.s $f4, $f4, $f0              # restante -= dinero_ingreado

		j while

endWhile:
	
	li $v0, 4
	la $a0, msj_cambio
	syscall

	li $v0, 2
	sub.s $f6, $f5, $f20
	mov.s $f12, $f6
	syscall	                          # Imprime cambio
	
	li $v0, 4
	la $a0, msj_gracias_compra
	syscall
	
return:

	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $s1, 8($sp)
	addi $sp, $sp, 12
	jr $ra
