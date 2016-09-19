ArrayList<ParticleSystem> systems;

PVector windRight = new PVector(0.1,0);
PVector sortaSpeed = new PVector(0,0.1);
PVector gravity = new PVector(0,0.05);

boolean wR = false;
boolean sP = false;

void setup() {
	size(640,480);
	systems = new ArrayList<ParticleSystem>();
  noStroke();
}

void draw() {
	background(0);
  if(!systems.isEmpty()){
      for (int i =0; i < systems.size(); i++){
        ParticleSystem ps = systems.get(i);
        ps.applyForce(gravity);
        ps.run();
        if(wR){
          ps.applyForce(windRight);
        }
        if(sP){
          ps.applyForce(sortaSpeed);
        }
      }
  } else {
    fill(255);
    text("any button will trigger a particle system",1,height-30);
  }
	
}

void keyPressed() {

  if(key == 'w'){
    wR = true;
  } else if(key == 'a'){
    //print('a');
    sP = true; 
  }else{
    systems.add(new ParticleSystem(random(100,200),10,new PVector(random(10,630),10))); //random(480)
  }
}

void keyReleased(){
  if(key == 'w'){
    wR = false;
  } else if(key == 'a'){
    sP = false;
  }
}

/*for (ParticleSystem ps: systems) {
        ps.applyForce(gravity);
        ps.run();
        ps.addParticle();
        if(wTrue){
          ps.applyForce(wind);
        }      
      }*/