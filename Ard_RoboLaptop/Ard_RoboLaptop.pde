/*
 MIGUEL ANGEL DE FRUTOS CARRO
 AEROBOT Club de Robotica de Aeronauticos_UPM
 18/10/2010_Madrid
 
 */


#include <CompactQik2s9v1.h>
#include <NewSoftSerial.h>

#define rxPin 3
#define txPin 4
#define rstPin 5

NewSoftSerial mySerial =  NewSoftSerial(rxPin, txPin);
CompactQik2s9v1 motor = CompactQik2s9v1(&mySerial,rstPin);

int a = 60; //Velocidad de Avance-Retroceso (0-100)
int g = 70;//Velocidad de Giro (0-100)

int inByte = 0;         // incoming serial byte

void setup()
{
    Serial.begin(9600);
    mySerial.begin(9600);
  motor.begin();
  motor.stopBothMotors();
   
}

void loop()
{
  if (Serial.available() > 0) { 
     
    inByte = Serial.read();
      
      if (inByte =='U'){  
      //Serial.println("U");  
                motor.motor0Reverse(a); 
                motor.motor1Reverse(a);
                delay(300); 
      } else if (inByte =='D'){  
    //Serial.println("D");       
                motor.motor0Forward(a); 
                motor.motor1Forward(a);
                delay(300); 
      } else if (inByte=='R'){
         //Serial.println("R");  
                    //DERECHA
                         motor.motor1Reverse(g); 
                         motor.motor0Forward(g);
                         delay(200); 
      } else if (inByte=='L'){ 
   //Serial.println("L");          
                    //IZQ
                         motor.motor0Reverse(g); 
                         motor.motor1Forward(g);
                         delay(200); 
       } else {                 
             //Serial.println("Stop");  
                         motor.stopBothMotors();
                         delay(200); 
       }//else                    
      
  }//If available
   else {                 
             //Serial.println("Stop");  
                         motor.stopBothMotors();
                         delay(200); 
       }//else 
} //Loop

