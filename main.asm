.globl main

.text

main:

	li $v0, 4
	
	###
	### Muestra el menú principal
	###
	la $a0, msj_menu
	syscall                           

	###
	### Solicita la opción del menú
	###
	la $a0, input_op
	syscall                           

	li $v0, 5
	syscall
	move $t0, $v0                     # op <- t0
	
	### 
	### Opciones disponibles
	###
	beq $t0, 1,	op_1                  
	beq $t0, 2, op_2
	beq $t0, 3, end
	
	bne $t0, 3, error_input_op        # op != 1 & op !2 & op!= 3
	
op_1: 

	jal mostrar_productos
	
elegir_producto:

	li $v0, 4
	la $a0, input_producto
	syscall

	li $v0, 5
	syscall
	move $t1, $v0                     # t1 <- Posición producto
	
	jal realizar_cobro
	#jal disminuir_stock
	jal main

op_2: 

	jal mostrar_stock
	j main
	
error_input_op:

	la $a0, msj_error_input_op
	li $v0, 4
	syscall
	
	j main

end:

	li $v0, 10
	syscall
