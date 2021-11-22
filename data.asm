.globl productos, precios, total_productos, cantidades, min_stock

.data

prod_1: .asciiz "prod 1"
prod_2: .asciiz "prod 2"
prod_3: .asciiz "prod 3"
prod_4: .asciiz "prod 4"

productos: .word pulsera, sombrero de paja toquilla, billetera, pluma, camisa bordada, collar, aretes, cinturón 
precios: .word 2, 30, 5, 1.50, 15, 12, 7.50, 10 
cantidades: .word 10, 6, 10, 25, 8, 15, 10, 9

 # MÃ­nima cantidad x producto antes de advertir
min_stock: .word 3, 2, 2, 6, 2, 4, 2, 3

total_productos: .word 8
