.globl productos, precios, total_productos, total_denominaciones
.globl cantidades, min_stock, denominaciones

.data

prod_1: .asciiz "pulsera"
prod_2: .asciiz "billetera"
prod_3: .asciiz "pluma"
prod_4: .asciiz "collar"
prod_5: .asciiz "aretes"
prod_6: .asciiz "cinturon"

productos: .word prod_1, prod_2, prod_3, prod_4, prod_5, prod_6
precios: .float 3.5, 5.6, 2.5, 15.3, 7.5, 10.0
cantidades: .word 10, 10, 25, 15, 10, 9
denominaciones: .float 20, 10, 5, 1, 0.5, 0.25, 0.10, 0.05

# Minima cantidad x producto antes de advertir
min_stock: .word 3, 3, 7, 4, 3, 2
total_productos: .word 6
total_denominaciones: .word 8