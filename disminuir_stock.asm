.globl disminuir_stock

.text

###
### Disminuye en 1 el stock del producto despachado
###
disminuir_stock:

	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	sll $t1, $a0, 2                   # Posición producto * 4 (offset)
	add $t1, $s2, $t1                 # Inicio array + offset
	lw $t2, ($t1)                     # Stock producto
	
	addi $t2, $t2, -1                 # Stock -= 1
	sw $t2, ($t1)
	
return:

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
