# PROGRAMA 3
# x = 3; 
# y = 4 ; 
# z = ( 15*x + 67*y)*4
# Associações 
# x -> $s0
# y -> $s1
# z -> $s2

# Inicio
.text
.globl	main
main:
addi	$s0, $zero, 3 # x = 3
addi	$s1, $zero, 4 # y = 4
add	$t0, $zero, $s1  #iniciando var temp com 4
addi	$t0, $t0, 11 #iniciando var temp com 15
add	$t1, $t0, $t0 # mult 15 por 3
add	$t1, $t1, $t0 # mult 15 por 3
add	$t1, $t1, $t0 # mult 15 por 3
addi	$t2, $zero, 67
add	$t3, $zero, $t2 #mult 67 por 4
add	$t3, $t3, $t2 #mult 67 por 4
add	$t3, $t3, $t2 #mult 67 por 4
add	$t3, $t3, $t2 #mult 67 por 4
add	$t2, $t3, $t1 #somando 15*x + 67*y
add	$s2, $t2, $t2 #multiplicação de (15*x + 67*y) por 4
add	$s2, $s2, $t2 #multiplicação de (15*x + 67*y) por 4
add	$s2, $s2, $t2 #multiplicação de (15*x + 67*y) por 4
add	$s2, $s2, $t2 #multiplicação de (15*x + 67*y) por 4


# Fim