.globl productos, precios, cantidades, denominaciones, cantidades_original
.globl total_productos, total_denominaciones, porcentaje_min_stock

.data

prod_1: .asciiz "Pulsera de piedra de luna"
prod_2: .asciiz "Billetera de cuero artesanal"
prod_3: .asciiz "Boligrafo artesanal de papagayo"
prod_4: .asciiz "Collar de semillas"
prod_5: .asciiz "Aretes de Tagua"
prod_6: .asciiz "Cinturon de cuero artesanal"

productos: .word prod_1, prod_2, prod_3, prod_4, prod_5, prod_6
precios: .float 3.5, 5.6, 2.5, 15.3, 7.5, 10.0
cantidades: .word 10, 10, 25, 15, 10, 8
denominaciones: .float 20, 10, 5, 1, 0.5, 0.25, 0.10, 0.05

total_productos: .word 6
total_denominaciones: .word 8
porcentaje_min_stock: .float 0.10

cantidades_original: .word 10, 10, 25, 15, 10, 8
