Particle [] bobs;
Particle bob;
OddballParticle sue;
boolean start = false;
public void setup()
{
  size(500,500);
  noStroke();
  bobs = new Particle[2000];
  bob = new Particle();
  sue = new OddballParticle();
  for(int i = 0; i < bobs.length; i++) { 
    bobs[i] = new OddballParticle();
  }
  for(int i = 20; i < bobs.length; i++) {
    bobs[i] = new Particle();
  }
}
public void draw()
{
  background(0);
  for(int i =0; i < bobs.length; i++) {
    bobs[i].move();
    bobs[i].show();
    bobs[i].boundary();
  }
}
class Particle
{
   protected double myAngle, mySpeed, myX, myY, mySize;
   protected int myColor;
   private boolean boundary;
   public Particle() {
     myX = myY = 250;
     myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
     myAngle = Math.random()*2*Math.PI;
     mySpeed = (Math.random()*3);
     boundary = false;
   }
   
   public void move() {
     if (boundary == false) {
       myY = myY+((Math.sin(myAngle))*mySpeed);
       myX = myX+((Math.cos(myAngle))*mySpeed);
     }
   }
   public void boundary() {
     if (myX > width || myY > height){
        boundary = true; 
        myX = myY = 250;
        myAngle = Math.random()*2*Math.PI;
        mySpeed = (Math.random()*3);
     }
     else 
       boundary = false;
   }
   public void show() { 
     mySize = dist(250,250, (int)myX, (int)myY)/30;
     fill(myColor);
     ellipse((int)myX, (int)myY, (int)mySize,(int)mySize);
  }
}
class OddballParticle extends Particle //inherits from Particle
{
   public OddballParticle() {
     myX = (int)(Math.random()*100)+150;
     myY = (int)(Math.random()*100)+150;
     myColor = color((int)(Math.random()*50)+196, (int)(Math.random()*50)+18, (int)(Math.random()*50)+18);
     myAngle = Math.random()*2*Math.PI;
     mySpeed = 1;
   }
    public void show() { 
     fill(myColor);
     float rot = random(PI*2);
     translate((float)myX, (float)myY);
     rotate(rot);
     for(float i = 0; i < PI*2; i += PI*2/4) {
       rotate(i);
       translate(3,0);
       rect(0, 0, 10,20);
       translate(-3,0);
       rotate(-i);
     }
     rotate(-rot);
     translate((float)(-myX), (float)(-myY));
   }
}
