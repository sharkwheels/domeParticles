class SquareParticle extends Particle{

    
    float size;
    float r;
    float g;
    float b;
    
    SquareParticle(float color1,float color2, float color3, PVector l){
        super(color1,color2,color3,l);
        size = random(2,8); 
        r = color3;
        //g = color1;
        //b = color2;
        g = random(20,100);
        b = random(100,200);
        
    }
    void updateColor(float c1, float c2, float c3){
        r = c1;
        

    }

    void display(){
        float theta = map(location.x,0,width,0,TWO_PI*2);
        rectMode(CENTER);
        fill(r,g,b,lifespan);
        stroke(0,lifespan);
        pushMatrix();
        translate(location.x,location.y);
        rotate(theta);
        rect(0,0,size,size);
        popMatrix();
    }
}


/*class SquareParticle extends Particle{

    //float g;
    //float size;

    SquareParticle(PVector l){
        //super(l);
        super(r,l); // inherits the thing from the constructor.
        //g = random(40, 200);
        size = random(2,8); 
        g = col;

    }
     void display() {
        float theta = map(location.x,0,width,0,TWO_PI*2);

        rectMode(CENTER);
        fill(0,g,200,lifespan);
        stroke(0,lifespan);
        //[full] If we rotate() a shape in Processing, we need to familiarize ourselves with transformations. For more, visit: http://processing.org/learning/transform2d/
        pushMatrix();
        translate(location.x,location.y);
        rotate(theta);
        rect(0,0,size,size);
        popMatrix();
        //[end]
    }

}*/