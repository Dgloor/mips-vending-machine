.globl salvar_stock_original

.text

### 
### Realiza una copia del stock inicial de los productos
###
salvar_stock_original:
	
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s2, 4($sp)
	
	lw $t0, total_productos
	sll $t1, $t0, 2                   # Espacio total
	add $t2, $s2, $t1                 # Dirección final del bloque

	loop:
	
			slt $t3, $s2, $t2               # t3 = 1 si aún se está copiando
			beq $t3, $zero, return
			
			lw $t4, ($s2)
			sw $t4, ($s4)
			
			addi $s2, $s2, 4                # Avanza puntero stock
			addi $s4, $s4, 4                # Avanza puntero copia stock
			
			j loop
	
return:

	lw $ra, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	jr $ra
