// main tab
ArrayList<ParticleSystem> systems;

PVector windRight = new PVector(0.1,0);
PVector sortaSpeed = new PVector(-0.1,0);
PVector gravity = new PVector(0,0.05);

boolean wR = false;
boolean sP = false;
boolean cS = false;

int limit = 8;

int alpha = 50;
color[] colorArray  = {color(0,0,0,alpha),color(6, 18, 45,alpha),color(28, 6, 45,alpha)};
//float[] colorArray = {200,10,40,30};
int currentColor;
int nextColor;

float randomC;

boolean change = false;

void setup() {
	size(800,640);
	systems = new ArrayList<ParticleSystem>();
  smooth();
  noStroke();
  currentColor = 0;
  randomC = random(10,200);
  println("randomC: "+randomC);
  for(int i = 0; i < limit; i++){
    systems.add(new ParticleSystem(randomC,10,new PVector(random(10,700),-5))); //random(480)
  }
  background(255);
}

void draw() {
  //background(colorArray[currentColor]);
  //rect(0, 0, 2000, 2000);
  //background(colorArray[nextColor]);
  fill(colorArray[currentColor]);
  rect(0, 0, width*2, height*2);
    /*if(change){
        currentColor = nextColor;
        change = false;
        
    }*/

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
        if(change) {
          ps.updateColor(255);
        }
      }
  } 

}

void keyPressed() {

  if(key == 'w'){
    wR = true;
    print("w");
  } 
  if(key == 'a'){
    print('a');
    sP = true; 
  }
}

void keyReleased(){
  if(key == 'w'){
    wR = false;
  } else if(key == 'a'){
    sP = false;
  } else if(key == 's'){
    if(key == 's'){
        change = true;
        println("currentColor: "+currentColor);
        int newColor = currentColor;
        while (newColor == currentColor)
        newColor=(int) random(colorArray.length);
        nextColor = newColor;
    }
    
    
  } // end of cS
}
