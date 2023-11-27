Particle [] particles = new Particle[100]; 


 

void setup(){
frameRate(120); 
size(500,500);
background(2, 1, 36);

//assigning particles
for(int i = 0; i < particles.length; i++) particles[i] = new Particle(); 
for(int i = 0; i < 20; i++) particles[i] = new OddballParticle();  
}


void draw()
{  
 background(2, 1, 36);
  for(int i = 0; i < particles.length; i++) {
    particles[i].move();
    particles[i].show();
  }

} 


public class Particle
{
  
  double xPos, yPos, angle;
  int balls; 
  int speed;
  double xSpeed;
 
  
 Particle(){
     
    xSpeed = 100; 
    
    xPos = yPos = 250; 
    angle = Math.random()*2*Math.PI;
    speed = (int)(Math.random() * 2) + 2;
    balls = color(255,255,255); 
  }
  
  public void move(){
    xSpeed-=0.1; 
    xPos+= speed*cos((float)angle) ; 
    yPos+= speed*sin((float)angle) ;
    if(xPos > 1100 || xPos < 0 ||yPos > 1100 || yPos < 0) xPos = yPos = 250; 
  
}
 
  
  void show(){
  if(xPos > 250){
  balls = color(200,100+(balls/2),100+(balls/2));
  }
  if(xPos < 250) balls = color(150 +(balls/150),100+(150/balls),200);
  fill(balls); 
   ellipse((float)xPos, (float)yPos, 20,20); 
  }
  
}


class OddballParticle extends Particle //inherits from Particle
{
  
  public void show(){
  if(xPos < 250){
  balls = color(200,100+(150/balls),100+(150/balls));
  }
  if(xPos > 250) balls = color(100 +(balls/2),100+(balls/2),150);
  fill(balls); 
    ellipse((float)xPos,(float)yPos,100,100);

  
 }
}


