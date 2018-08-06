import processing.serial.*;  
Serial myPort;
int textColorR = 0;
int textColorG = 0;
int textColorB = 0;
int strokeColorR = 0;
int strokeColorG = 0;
int strokeColorB = 0;
int strokeColorR1 = 0;
int strokeColorG1 = 0;
int strokeColorB1 = 0;
int strokeColorR2 = 0;
int strokeColorG2 = 0;
int strokeColorB2 = 0;

static final int NUM_LINES = 17;
float t;
PFont font;
int _data [] = new int[0];

void setup() {
  background(0);
  font = loadFont("OpenSans-Bold-100.vlw");
  textFont(font);
  fullScreen();
  String portName = "/dev/cu.usbmodem14111";
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');

}

void draw() {
  background(0);
  //dots background
  for (int i = 1 ; i < 20; i++){
  int strokeColorR2 = (int)map(_data[0], 20, 150, 255, 0);
  int strokeColorG2 = (int)map(_data[0], 20, 150, 255, 0);
  int strokeColorB2 = (int)map(_data[0], 20, 150, 255, 0);
  stroke(strokeColorR2,strokeColorG2,strokeColorB2); // color for points 
  point(width/20*i, height/15);
    for (int j = 1 ; j < 15; j++){
      point(width/20*i, height/15*j);
    }
  }
  strokeWeight(3);
  translate(width/2, height/2);
  
  if (_data[2] < 530) {
    int textColorR = (int)map(_data[1], 30, 180, 141, 106);
    int textColorG = (int)map(_data[1], 30, 180, 198, 207);
    int textColorB = (int)map(_data[1], 30, 180, 63, 238);
    fill(textColorR,textColorG,textColorB);
    textSize(150);
    textAlign(CENTER);
    text("Welcome!", 0, 50);
    
  } else {
    int textColorR = (int)map(_data[1], 30, 180, 141, 106);
    int textColorG = (int)map(_data[1], 30, 180, 198, 207);
    int textColorB = (int)map(_data[1], 30, 180, 63, 238);
    fill(textColorR,textColorG,textColorB);
    textSize(150);
    textAlign(CENTER);
    text("MHCI+D", 0, 50);
  }
  //Recreating Vintage Computer Art with Processing https://youtu.be/LaarVR1AOvs
  for (int i = 0; i < NUM_LINES; i++) {
    //MHCID COLOR
    //int strokeColorR = (int)map(_data[0], 0, 180, 141, 106);
    //int strokeColorG = (int)map(_data[0], 0, 180, 198, 207);
    //int strokeColorB = (int)map(_data[0], 0, 180, 63, 238);
    int strokeColorR = (int)map(_data[0], 30, 180, 93, 252);
    int strokeColorG = (int)map(_data[0], 30, 180, 230, 40);
    int strokeColorB = (int)map(_data[0], 30, 180, 103, 33);
    stroke(strokeColorR, strokeColorG, strokeColorB);
    line(x1(t+i)*_data[0]/10, y1(t+i)*1.5, x2(t+i)*1.5, y2(t+i));
    //MHCID COLOR
    //int strokeColorR = (int)map(_data[0], 0, 180, 141, 106);
    //int strokeColorG = (int)map(_data[0], 0, 180, 198, 207);
    //int strokeColorB = (int)map(_data[0], 0, 180, 63, 238);
    int strokeColorR1 = (int)map(_data[0], 30, 180, 200, 26);
    int strokeColorG1 = (int)map(_data[0], 30, 180, 80, 137);
    int strokeColorB1 = (int)map(_data[0], 30, 180, 20, 200);
    stroke(strokeColorR1, strokeColorG1, strokeColorB1);
    line(-x3(t+i)*_data[0]/10, -y3(t+i)*1.5, -x4(t+i)*1.5, -y4(t+i));
    delay(1);
}
  t+= 1;
}
//Recreating Vintage Computer Art with Processing https://youtu.be/LaarVR1AOvs
//line one
float x1(float t) {
  return sin(t / 10) * 200 + sin(t / 5) * 20;
}

float y1(float t) { 
  return cos(t / 10) * 200 + sin(t / 5) * 50;
}
float x2(float t) {
  return sin(t / 10) * 400 + sin(t) * 2;
}

float y2(float t) { 
  return -cos(t / 20) * 400 + cos(t / 12)* 20;
}

//line two
float x3(float t) {
  return sin(t / 10) * 200 + sin(t / 5) * 20;
}

float y3(float t) { 
  return cos(t / 10) * 200 + sin(t / 5) * 50;
}
float x4(float t) {
  return sin(t / 10) * 400 + sin(t) * 2;
}

float y4(float t) { 
  return -cos(t / 20) * 400 + cos(t / 12)* 20;
}

void serialEvent(Serial myPort)
{
  try {
    // Grab the data off the serial port. See: 
    // https://processing.org/reference/libraries/serial/index.html
    String inString = myPort.readStringUntil('\n');
    inString = trim(inString);
    //distanceCm = Integer.parseInt(inString);
    _data = int(split(inString, ','));
    println(_data);
  }
  catch(Exception e) {
    println(e);
  }
}