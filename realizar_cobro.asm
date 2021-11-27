.globl realizar_cobro

.text

### 
### Solicita el ingreso de dinero para realizar el cobro
###
realizar_cobro:

	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $t2, precios                   # Puntero al primer precio
	sll $t3, $t1, 2                   # Posición producto * 4
	add $t3, $t2, $t3                 # Inicio array + offset
	lwc1 $f20, ($t3)                  # Precio producto
	
	add.s $f4, $f4, $f20              # restante por pagar
	mtc1 $zero, $f5                   # dinero_ingresado = 0
	mtc1 $zero, $f6                   # vuelto = 0
	
	while:
	
		li $v0, 4
		la $a0, msj_total_producto
		syscall
	
		li $v0, 2
		mov.s $f12, $f20
		syscall                           # Imprime precio producto
	
		li $v0, 4
		la $a0, msj_dinero_ingresado
		syscall
	
		li $v0, 2
		mov.s $f12, $f5
		syscall                           # Imprime dinero ingresado

		li $v0, 4
		la $a0, msj_restante
		syscall
	
		li $v0, 2
	  mov.s $f12, $f4
		syscall                           # Imprime restante a pagar
	
		li $v0, 4
		la $a0, NL
		syscall
	
		la $a0, msj_denominaciones        # Imprime denominaciones válidas
		syscall
	
		la $a0, input_dinero
		syscall
	
		li $v0, 6
		syscall
		#mov.s $f4, $f0

		#jal validar_denominacion
		
		add.s $f5, $f5, $f0              # dinero_ingresado += dinero
		sub.s $f4, $f4, $f0              # restante -= dinero_ingreado

		jal while
	
return:

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
