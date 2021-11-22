
.globl msj_menu, msj_productos, msj_stock, msj_error_input_menu
.globl input_op, input_producto
.globl text_espacio_dolar, text_punto_espacio, text_lista, text_puntos_espacio, text_unidades, NL

.data

msj_menu: .asciiz "\n== Máquina expendedora de artesanías == \n1. Mostrar productos \n2. Mostrar stock \n3. Salir"
msj_productos: .asciiz "\n== Productos ==\n"
msj_stock: .asciiz "\n== Stock productos ==\n"
msj_error_input_menu: .asciiz "\nError, opción no válida. \n"

input_op: .asciiz "\nIngrese una opción: "
input_producto: .asciiz "Escoga un producto (1-3): "

text_espacio_dolar: .asciiz " - $"
text_punto_espacio: .asciiz ". "
text_puntos_espacio: .asciiz ": "
text_lista: .asciiz "* "
text_unidades: .asciiz " unidades"

NL: .asciiz "\n"
