.text
.globl main
main:


mult:
mult 	$a0,$a1
mflo	$v0
mfhi	$v1 #as vezes nao utilizado --> para nums de 64 bits apenas
jr $ra

mult:
add	$t0, $zero, $zero
loop:
slt	$t1,$zero,$a1 #verifico se arg 1 é menor que 0
beq	$t1,$zero, fim #verifico se arg 1 é igual a 0 se sim goto fim
add	$t0, $t0, $a0 #somo o argumento 1 com ele mesmo
addi	$a1, $a1, -1 #altero o valor de arg 1 em -1
j loop #continua o loop

fim:
add	$v0, $zero, $t0 #altera o valor de retorno para a resposta
jr $ra #retorna para ponto de chamada
