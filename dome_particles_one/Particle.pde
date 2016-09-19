// particle
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan; // alpha
  float diameter;

  // colours
  float r;
  float g = 20;
  float b = 100;
  
  Particle(float col,PVector l){
    // For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,0.09);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255;
    diameter = random(1,8);
    //print("P:" + red);
    r = col;
    
    
  }

  void applyForce(PVector force){
    acceleration.add(force);
  }
  
  void run(){
    update();
    display();
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 1.0;
  }
  
  void display(){
    stroke(0, lifespan);
    fill(r, g, b, lifespan);
    ellipse(location.x, location.y,diameter,diameter);

  }
  
  boolean isDead(){
    if(lifespan < 0.0){
      return true;
    }else{
      return false;
    }
  }
}