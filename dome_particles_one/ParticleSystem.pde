// particle system
class ParticleSystem {
	
	ArrayList<Particle> plist;
	PVector origin; // An origin point for where particles are birthed
	float c1;
	float c2;
	float c3;

	ParticleSystem(float color1, float color2, float color3, int num, PVector v){
		plist = new ArrayList<Particle>();
		origin = v.get();
		c1 = color1;
		c2 = color2;
		c3 = color3;
		println("origin: "+origin);

		for(int i = 0; i < num; i++){
			plist.add(new Particle(c1,c2,c3,origin)); 
		}
	}
	void applyForce(PVector force){
		for (Particle p : plist){
			p.applyForce(force);
		}
	}
	void updateColor(float color1, float color2, float color3){
		for(Particle p : plist){
			p.updateColor(color1,color2,color3);
		}
	}

	void run(){		
		// iterate through array of single particles backwards
		// remove single particles when they are dead. 
		for (int i = plist.size()-1; i > 0; i--){
			Particle p = plist.get(i);
			p.run();
			if (p.isDead()){
				plist.remove(i);

			}
		}
		addParticle();
	}
	void addParticle(){
		//println("AP: "+r);
		float r = random(1);
		if (r<0.4) {
			plist.add(new SquareParticle(c1,c2,c3,origin));
		}else{
			plist.add(new Particle(c1,c2,c3,origin));
		}
	}

	boolean dead(){
		if(plist.isEmpty() || plist.size() == 1){
			return true;
		}else{
			return false;
		}
	}
}