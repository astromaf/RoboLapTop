/**
 LapTop Robot
 By MAF
 21/12/2010
 */ 
 
import processing.video.*; 
import processing.serial.*;

Serial myPort;
 
boolean arriba = false;
boolean abajo = false;
boolean derecha = false;
boolean izquierda = false;
boolean up,down,right,left = false;
Capture cam;

long espera=0;

color c1 = #FACE3D;//amarillo
color c2= #4364A5;//azul
color c3= #79A3F5;//claro
color c;

////////////////////////////////
void setup() {
  size(1000, 600);
  stroke(255);
  fill(0);
  rect(15,25,730,550);
  
cam = new Capture(this, 720, 540);
  myPort=new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\r');
  
}//fin setup
////////////////////////////////

void draw() {
  background(#525252);
   stroke(255);
  fill(0);
  rect(15,25,730,550);
if (cam.available() == true) {
    cam.read();
    //image(cam,20, 30);
    // The following does the same, and is faster when just drawing the image
    // without any additional resizing, transformations, or tint.
    set(20, 30, cam);
  }
  
        // hacia arriba
  strokeWeight(1.1);      
      if (arriba == true&& up==false) {
        fill(c);
      } else if(up == true){
        fill(c1);
      }
      else {
         fill(c2);
      }
      rect(832, 200, 70, 70);  
       strokeWeight(1); 
      triangle(832+35,200+9,832+5,261,892+5,261);
      strokeWeight(1.1);     
           
      // abajo
            
      if (abajo == true&& down==false) {
        fill(c);
      }else if(down == true){
        fill(c1);
      } else {
         fill(c2);
      }
       rect(832, 340, 70, 70);
        strokeWeight(1); 
       triangle(832+35,610-209,832+5,610-261,892+5,610-261);
       strokeWeight(1.1); 
     
     
      //Derecha
      
       
      if (derecha == true && right==false) {
        fill(c);
      } else if(right == true){
        fill(c1);
      }else {
         fill(c2);
      }
        rect(902, 270, 70, 70);
        strokeWeight(1);  
       triangle(1734-771,305,1734-823,275,1734-823,335);
       strokeWeight(1.1); 
      // Izquierda
     
       
      if (izquierda == true&& left==false) {
        fill(c);
      }else if(left == true){
        fill(c1);
      } else {
         fill(c2);
      }
      rect(762, 270, 70, 70);
       strokeWeight(1); 
      triangle(771,305,823,275,823,335);

}//LOOp

void keyPressed() {
  if (key == CODED) {
        if (keyCode == UP) {
            up=true;
            myPort.write('U');
      }
      else if (keyCode == DOWN) {
      down=true;
       myPort.write('D');
      } 
       else if (keyCode == RIGHT) {
       right=true;
        myPort.write('R');
      } 
       else if (keyCode == LEFT) {
      left=true;
       myPort.write('L');
      } 
    }
  else{
    up=down=right=left=false;
  }
}//KeyPressed

void keyReleased() {
 
up=down=right=left=false;
 myPort.clear();
 
}//KeyRealeased

void mousePressed() {
  if (arriba) { 
    c=c1;
     myPort.write('U');
  } 
  else if (abajo) {
    c=c1;
     myPort.write('D');
  }
  else if (derecha) {
    c=c1;
     myPort.write('R');
  }
  else if (izquierda) {
    c=c1;
     myPort.write('L');
  }
}//mouse pressed

void mouseReleased() {
 arriba = abajo = derecha = izquierda = false;
  myPort.clear();
checkButtons();
}//mouse realeased

void mouseMoved() { 
  checkButtons(); 
}
  
/*void mouseDragged() {
  checkButtons(); 
}*/

void checkButtons() {
   c=c3;   
  
  if (mouseX > 832 && mouseX < 902 && mouseY > 200 && mouseY < 270) {
     arriba = abajo = derecha = izquierda = false;
    arriba = true; 
    
    
  } else if (mouseX >832  && mouseX < 902 && mouseY >340 && mouseY < 410) {
     arriba = abajo = derecha = izquierda = false;
    abajo = true; 
  } 
   else if (mouseX > 762 && mouseX < 832 && mouseY > 270 && mouseY <340) {
     arriba = abajo = derecha = izquierda = false;  
   izquierda = true; 
    
  } 
   else if (mouseX > 902 && mouseX < 972 && mouseY > 270 && mouseY <340) {
      arriba = abajo = derecha = izquierda = false;
      derecha = true; 
      
  } 
  
  else  {
    arriba = abajo = derecha = izquierda = false;
  }
}

