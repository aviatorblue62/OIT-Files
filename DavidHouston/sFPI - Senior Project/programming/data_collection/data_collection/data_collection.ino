/*

  Title: sFPI Processor to Computer Interface
  Author: David Houston
  Date: 08/26/2015
  
*/

// Global Variables

#define data_size 1024

// Variables
boolean transmit = false;
int data[data_size];
int drive = A0;

// Setup Function
void setup(){
  Serial.begin(9600);
  pinMode(drive,INPUT);
}

void loop(){
   if (transmit == true){
      while (Serial.available() <= 0){
        Serial.print("Waiting");
        Serial.print("\n");
        delay(1000);
      }
        Serial.println("okay");
          for (int i = 0; i < data_size; i++){
          }
        }
   
   else {
       for (int k = 0; k < data_size; k++){
          delay(1);
       }
       transmit = true;
   }
}
