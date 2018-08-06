const int echoPin = 10; // Echo Pin
const int trigPin = 9; // Trigger Pin
const int potPin = 0;
const int lightsensorPin = 1;

int potVal = 0;
int lightsensorVal = 0;
int previousData;
int currentData;

long duration; // Duration used to calculate distance
int distanceCm, distanceInch;

void setup() {
 pinMode(trigPin, OUTPUT);
 pinMode(echoPin, INPUT);
 pinMode(potPin, INPUT);
 Serial.begin(9600);
}

void loop() {

 digitalWrite(trigPin, LOW); 
 delayMicroseconds(2); 

 digitalWrite(trigPin, HIGH);
 delayMicroseconds(10); 
 digitalWrite(trigPin, LOW);
 
 duration = pulseIn(echoPin, HIGH);
 distanceCm = duration*0.034/2;

  currentData = distanceCm;
 if (currentData<180) {
  previousData = currentData;
  distanceCm = currentData;
 } else {
  distanceCm = previousData;
 }
 potVal = analogRead(potPin);
 lightsensorVal = analogRead(lightsensorPin);
 Serial.print(distanceCm);
 Serial.print(",");
 Serial.print(potVal);
 Serial.print(",");
 Serial.println(lightsensorVal);
 delay(50);

}
