.globl productos, total_productos, cantidades, min_stock

.data

prod_1: .asciiz "producto uno"
prod_2: .asciiz "dos"
prod_3: .asciiz "tres"
prod_4: .asciiz "cuatro"

productos: .word prod_1 prod_2, prod_3
cantidades: .word 10, 20, 5

 # Mínima cantidad x producto antes de advertir
min_stock: .word 3, 2, 2

total_productos: .word 3
