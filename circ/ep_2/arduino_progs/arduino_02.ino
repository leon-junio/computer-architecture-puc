// Testando a saída Serial
 
int numero=0;

void setup() {
Serial.begin (9600);
Serial.println("Gerando valores sequenciais");
}

void loop(){
  Serial.print ("Valor: ");
  Serial.println(numero);
  delay(500);
  numero++;
}
