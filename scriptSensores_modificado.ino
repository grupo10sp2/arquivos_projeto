//Importar biblioteca DHT Sensor Library
#include "DHT.h"
#define dht_type DHT11 //define qual o tipo de sensor DHTxx que se está utilizando
/**
* Configurações iniciais sobre os sensores
* DHT11, LM35, LDR5 e TCRT5000
*/
int dht_pin = A2;
DHT dht_1 = DHT(dht_pin, dht_type); //pode-se configurar diversos


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  dht_1.begin();
 
}

void loop() {
  // put your main code here, to run repeatedly:
  /**
  * Bloco do DHT11
  */
  float umidade = dht_1.readHumidity();
  float temperatura = dht_1.readTemperature();
  float umidadeRange = (umidade * 0.0667) + 7.2;
  float temperaturaRange = (temperatura * 0.41) + 13.52;

  
  if (isnan(temperatura) or isnan(umidade))
  {
    Serial.println("Erro ao ler o DHT");
  }  else
       {
          Serial.print(temperaturaRange);
          Serial.print(";");
          Serial.print((temperaturaRange*0.95)+1);
          Serial.print(";");
          Serial.print((temperaturaRange*1.05)-1);
          Serial.print(";");
          Serial.print((temperaturaRange*1.10)+0.5);
          Serial.print(";");
          Serial.print((temperaturaRange*0.90)-0.5);
          Serial.print(";");
          
          Serial.print(umidadeRange);
          Serial.print(";");
          Serial.print((umidadeRange*0.95)+1);
          Serial.print(";");
          Serial.print((umidadeRange*1.05)-1);
          Serial.print(";");
          Serial.print((umidadeRange*1.10)+0.5);
          Serial.print(";");
          Serial.print((umidadeRange*0.90)-0.5);
          Serial.println(";");
        
      }
  delay(2000);

}
