Exemplo de soma e subtração na maquina:


//soma de 3 elementos
add a b,c   #a = b + c
add a a,d   #a = a + d
add a a,e   #a = a + e

//subtracao e adicao
add a b,c #a = b + c
sub d a,e #d = a - e



//identificadores de registradores

S - saved (vars do programador (int a, int b, etc)) - $s0 - $s7
T - registradores temp (invisivel para programador (Só maquina)) - $t0 - $t7
# -> comentários

Sintaxe: OP code - Registrador destino - registrador var + registrador var


//Criando tabela de simbolos

em c: f = (g+h);

em mips:

Ass.: (tab simbolos)
f - $s0
g - $s1
h - $s2

#inicio

add $s0, $s1, $s2

#fim

//Realizando conta abaixo com Assembly (forma com problemas de leitura suja)
f = (g+h) - (i+j)
Ass.:
f - $s0
g - $s1
h - $s2
i - $s3
j - $s4

#inicio

add $s1, $s1, $s2 #soma de g + h //errado pq pode causar leitura suja em concorrência
add $s3, $s3, $s4 #soma de i + j
sub $s0, $s3, $s1 #subtração de  g - i 

#fim

//Problema otimizado com os registrados temporarios
#inicio

add $t0, $s1, $s2 #soma de g + h //certo porem salvando no registrador auxiliar
add $t1, $s3, $s4 #soma de i + j
sub $s0, $t0, $t1 #subtração de  g - i 

#fim


//Forma de economia de registradores
a = b+c+d-e
Ass.:
a - $s0
b - $s1
c - $s2
d - $s3
e - $s4

#inicio

add $t0, $s1, $s2
add $t0, $t0, $s3
sub $s0, $t0, $s4 //usa o proprio S0 para armazenar o resultado

#fim


//Como salvar 0 no registrador do MIPS utilizando subtração
a = 0;
b = 0;
c = a + b;

Ass.:
a - $s0
b - $s1
c - $s2

#inicio

sub $s0, $t0, $t0 #uso o registrador temporario t0 para fazer uma subtração e salvar o valor 0 no registrador s0
sub $s1, $t0, $t0 #uso o registrador temporario t0 para fazer uma subtração e salvar o valor 0 no registrador s1
add $s2, $s0, $s1

#fim