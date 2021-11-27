.globl validar_denominacion

.text

### 
### Verifica si el dinero ingresado es parte de las denominaciones válidas
###
validar_denominacion:
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	lw $t0, total_denominaciones
	li $t1, 0                         # i = 0
	la $t2, precios                   # Puntero a la primera denominacion
	
	for:
	
		beq $t1, $t0, return            # i < total_denominaciones
		
		
		j for
		 
		   
	
#	endFor:
	
return:

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra