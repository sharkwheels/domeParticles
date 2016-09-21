ArrayList<ParticleSystem> systems;

// forces
PVector windRight = new PVector(0.04,0);
PVector windLeft = new PVector(-0.04,0);
PVector gravity = new PVector(0,0.04);
PVector antiGrav = new PVector(0,-0.03);

// booleans for key presses
boolean wR = false;
boolean sP = false;
boolean cS = false;
boolean gS = false;

// limit amount of particle systems
int limit =5;

// float your colours for the particles
float cR;
float cG;
float cB;

// keep track of two keys pressed at once. 

boolean[] keys;

// trails control
int opacity;

void setup() {
	size(640,480);
	systems = new ArrayList<ParticleSystem>();

  keys=new boolean[2];
  keys[0]=false;
  keys[1]=false;
  
  // set random colours
  cR = 100;
  cG = 200;
  cB = 50;
  println("colors: "+cR + " " + cG + " " + cB);

  opacity = 80;

  println("setup - cR: "+cR);
  for(int i = 0; i < limit; i++){
    systems.add(new ParticleSystem(cR,cG,cB,10,new PVector(random(width),-10))); //random(480)
  }
  background(0);
}

void draw() {
  noStroke();
  fill(0,0,0,opacity);
  rect(0, 0, width*2, height*2);

  if(!systems.isEmpty()){
      for (int i =0; i < systems.size(); i++){
        ParticleSystem ps = systems.get(i);
        ps.applyForce(gravity);
        ps.run();
        ps.updateColor(cR,cG,cB);
        if(wR){
          ps.applyForce(windRight);
        }
        if(sP){
          ps.applyForce(windLeft);
        }
        if(gS){
          ps.applyForce(antiGrav);
        }
        
      }
  } 

  if(keys[0]&&keys[1]){
    //println("two keys");
    gS = true;
  } else{
    gS = false;
  }
}

void keyPressed() {

  if(key == 'w'){
    wR = true;
    keys[0]=true;  
  } 
  if(key == 'a'){
    keys[1]=true;
    sP = true; 
  }
}

void keyReleased(){
  if(key == 'w'){
    keys[0]=false;
    wR = false;
  } else if(key == 'a'){
    keys[1]=false;
    sP = false;
  } else if(key == 's'){
        cR = random(10,255);
        cG = random(10,255);
        cB = random(10,255);
        println("cR: "+cR);
        println("colors (key released): "+cR + " " + cB + " " + cG);
    
  }else if(key == 'o'){
    opacity = 20;
  } else if(key == 'p'){
    opacity = 80;
  }
  }

/*

origin: [ 489.638, -10.0, 0.0 ]
origin: [ 199.6925, -10.0, 0.0 ]
origin: [ 38.856773, -10.0, 0.0 ]
origin: [ 331.44772, -10.0, 0.0 ]*/

/*
  println("key press - currentPColor: "+currentPColor);
        int newPColor = currentPColor;
        while (newPColor == currentPColor)
        newPColor=(int) random(particleColors.length);
        currentPColor = newPColor;
        
// particle colours

float particleColors[] = {100,10,50,60,200,30,255,5,0};
int currentPColor;
int nextPColor;
*/


/*
// background colour stuff
int alpha = 50;
color[] colorArray  = {color(0,0,0,alpha),color(6, 18, 45,alpha),color(28, 6, 45,alpha)};
int currentColor;
int nextColor;

/*println("currentColor: "+currentColor);
        int newColor = currentColor;
        while (newColor == currentColor)
        newColor=(int) random(colorArray.length);
        nextColor = newColor;*/

//background(colorArray[currentColor]);
  //rect(0, 0, 2000, 2000);
  //background(colorArray[nextColor]);

//background(0,50);
  //filter( BLUR,1 );
    /*if(change){
        currentColor = nextColor;
        change = false;
        
    }*/