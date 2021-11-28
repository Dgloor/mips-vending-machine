.globl validar_denominacion

.text

### 
### Verifica si el dinero ingresado es parte de las denominaciones válidas
### Retorna 1 si el dinero ingresado es válido, caso contrario 0
###
validar_denominacion:
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	lw $t0, total_denominaciones
	li $t1, 0                         # i = 0
	la $t2, denominaciones            # Puntero a la primera denominacion
	move $v0, $zero                   # Dinero válido = Falso
	
	while:
	
		beq $t1, $t0, return             # i < total_denominaciones
		
		lwc1 $f0, ($t2)
		c.eq.s $f12, $f0                 # denominaciones[i] == dinero_ingresado?
		
		bc1t denominacion_valida         # Si es igual retorna 1
		
		addi $t1, $t1, 1                 # i += 1
		addi $t2, $t2, 4                 # Avanza puntero denominaciones
		
		j while

denominacion_valida:

	addi $v0, $v0, 1

return:

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
