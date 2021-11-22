.globl productos, precios, total_productos, cantidades, min_stock

.data

prod_1: .asciiz "prod 1"
prod_2: .asciiz "prod 2"
prod_3: .asciiz "prod 3"
prod_4: .asciiz "prod 4"

productos: .word prod_1, prod_2, prod_3
precios: .word 1, 3, 4
cantidades: .word 10, 20, 5

 # Mínima cantidad x producto antes de advertir
min_stock: .word 3, 2, 2

total_productos: .word 3
