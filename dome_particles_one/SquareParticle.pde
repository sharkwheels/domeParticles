class SquareParticle extends Particle{

    
    float size;
    float c;
    float c1;
    float c2;
    
    SquareParticle(float col, PVector l){
        super(col,l);
        size = random(2,8); 
        c = col;
        //print(c);
        c1 = random(20,100);
        c2 = random(20, 200);
        
    }

    void display(){
        float theta = map(location.x,0,width,0,TWO_PI*2);
        rectMode(CENTER);
        fill(c2,c1,c,lifespan);
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