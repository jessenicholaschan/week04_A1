import processing.serial.*;  // Import Serial class library
Serial myPort;  // Create object from Serial class

float val=0;
int Y;


void setup(){
size (400,400);
background (255);
String portName = Serial.list()[0]; //the first port
myPort = new Serial(this, portName, 9600);
myPort.bufferUntil('\n'); // buffer incoming characters until line feed.
}


void serialEvent(Serial p){
  String s = "";        // string value received.
  String[] values;      // splitted string values.
  
  if(p.available() > 0){  // check number of characters in the serial buffer 
    s = p.readString();   // read string.
    if(s != null){ 
      println("received:"+s);
      
      values = s.split(",");     // separate values with ',' characters.
      println(values);           
      
      val = float(values[0]);
    }}}
    
    
void draw(){
  
stroke (val,val,197);
strokeWeight (6);


for ( Y = 216; Y < 270; Y = Y + 12 ) {
  line (0,Y,400,Y);
}

stroke (255-val,val,197);

for ( Y = 0 ; Y < 210; Y = Y + 12 ) {
  line (0,Y,400,Y);
}

for ( Y = 276; Y < 400; Y = Y + 12 ) {
  line (0,Y,400,Y);
}

noStroke();
fill(0);

rect (0,350,400,50);
rect (0,0,400,50);
quad (200,50,0,50,0,350,100,350);
quad (200,50,400,50,400,350,300,350);
quad (150,350,175,250,225,250,250,350);
triangle (185,200,200,150,215,200);

}
//save ("lineyA.jpeg");


