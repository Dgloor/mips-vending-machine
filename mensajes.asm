.globl msj_menu, msj_productos, msj_stock, msj_pago
.globl msj_denominaciones, msj_total_producto, msj_dinero_ingresado
.globl msj_restante, msj_cambio, msj_gracias_compra, msj_stock_bajo
.globl msj_error_input_op, msj_error_denominacion
.globl input_op, input_producto, input_dinero
.globl text_espacio_dolar, text_punto_espacio, text_lista
.globl text_puntos_espacio, text_unidades, NL

.data

msj_menu: .asciiz "\n== Máquina expendedora de artesanías == \n1. Comprar producto \n2. Mostrar stock \n3. Salir"
msj_productos: .asciiz "\n== Productos ==\n"
msj_stock: .asciiz "\n== Stock productos ==\n"
msj_pago: .asciiz "\n== Pago Producto ==\n"

msj_denominaciones: .asciiz "\nDenominaciones aceptadas: $20, $10, $5, $1, $0.50, $0.25, $0.10, $0.05"
msj_total_producto: .asciiz "\nTotal producto: $"
msj_dinero_ingresado: .asciiz "\nMonto ingresado: $"
msj_restante: .asciiz "\nRestante: $"
msj_cambio: .asciiz "\nSu cambio es de: $ "
msj_gracias_compra: .asciiz "\n\nPuede retirar su producto, ¡Gracias por su compra!\n"

msj_error_input_op: .asciiz "\n[X] Error, opción no válida.\n"
msj_error_denominacion: .asciiz "\n[X] Error, dinero inválido.\n"
msj_stock_bajo: .asciiz " [!] Stock por debajo del mínimo."

input_op: .asciiz "\nIngrese una opción: "
input_producto: .asciiz "\nIngrese posición de producto: "
input_dinero: .asciiz "\nIngrese dinero: "

text_espacio_dolar: .asciiz " - $"
text_punto_espacio: .asciiz ". "
text_puntos_espacio: .asciiz ": "
text_lista: .asciiz "* "
text_unidades: .asciiz " unidades"

NL: .asciiz "\n"
