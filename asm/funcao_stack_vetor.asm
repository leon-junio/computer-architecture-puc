#x == $s0
#y == $s1
#vet[] == $s2
#INICIO
add $s0, $zero, $zero #atribuo valor de x
addi $s1, $zero, 1000 #atribuo valor de y
#label para laço DO WHILE
do: 
sll $s0, $s1, 2 #4y defino tamanho de uso da memoria
add $t0, $t0, $s2 #endereço base + 4y
lw $s0, 0($t0) # acessando vetor na posição t0
add $a0, $zero, $s1 #passo argumento de y no parametro A0
add $a1, $zero, $s0 #passo argumento de x no parametro A1
addi $sp, $sp, -4 #aloco a pilha com tamanho de -4 (removo uma pos da pilha -4 == 1 pos)
sw $t0, 4($sp) #salvo na memoria (pilha a posição de t0)
jal soma #pulo para a soma
add $s1, $zero, $v0 #pego o return da função e salvo em X
lw $t0, 4($sp) #busco valor de t0 da pilha
addi $sp, $sp, 4 #desaloco a pilha (a pilha volta a ter 4 de espaço disponivel)
sw $s1, 0($t0) #salvo s1 na stack
addi $s1, $s1, -1
bne $s1, $zero, do
nop
#fim

#s0 passa a ser usado dentro da proxima funcao entao
deve se salvar o s0 de main
soma:
addi $sp, $sp, -4 #removo mais um posição da pilha (aloco)
sw $s0, 4($sp) #adiciono o s0 na nova posição da pilha (s0 que era do main)
add $s0, $a0, $a1 #somo os dois args
add $v0, $zero, $s0 #salvo valor de retorno na variavel v0
#finalizando com operações de buscar valores antigos das variaveis da main
na stack e salvar as mesmas novamente
sw $s0, 4($sp) #salvo o valor de 0 na stack
addi $sp, $sp, 4 #desaloco o que foi criado para salvar a posição da stack
jr $ra #é o jump do return para a função main