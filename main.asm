.data
menu: .asciiz "== Máquina expendedora de artesanías == \n1. Mostrar productos \n2. Salir"
input: .asciiz "\nIngrese una opción: "

uno: .asciiz "uno"
dos: .asciiz "dos"
tres: .asciiz "tres"
productos: .word uno, dos, tres
cantidades: .word 10, 20, 5
size_cantidades: .word 3

.text

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








