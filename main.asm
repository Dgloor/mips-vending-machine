.text

.globl main

main:
	# Imprimir el menu principal
	li $v0, 4
	la $a0, menu
	syscall

	# Solicitar opción
	li $v0, 4
	la $a0, input
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

end:
	li $v0, 10
	syscall








