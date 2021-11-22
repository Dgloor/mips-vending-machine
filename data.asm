.globl productos, precios, total_productos, cantidades, min_stock

.data

prod_1: .asciiz "prod 1"
prod_2: .asciiz "prod 2"
prod_3: .asciiz "prod 3"
prod_4: .asciiz "prod 4"

productos: .word pulsera, billetera, pluma, collar, aretes, cinturón 
precios: .word 3, 5, 2, 15, 7, 10 
cantidades: .word 10, 10, 25, 15, 10, 9

 # MÃ­nima cantidad x producto antes de advertir
min_stock: .word 3, 3, 7, 4, 3, 2

total_productos: .word 6
