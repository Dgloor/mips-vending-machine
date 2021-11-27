.globl validar_denominacion

.text

### 
### Verifica si el dinero ingresado es parte de las denominaciones válidas
###
validar_denominacion:
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
return:

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra