// particle system
class ParticleSystem {
	
	ArrayList<Particle> plist;
	PVector origin; // An origin point for where particles are birthed
	float c;

	ParticleSystem(float col, int num, PVector v){
		plist = new ArrayList<Particle>();
		origin = v.get();
		c = col;
		for(int i = 0; i < num; i++){
			plist.add(new Particle(c,origin)); 
		}
	}
	void applyForce(PVector force){
		for (Particle p : plist){
			p.applyForce(force);
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
		//print(plist.size());
	}


	void addParticle(){
		//println("AP: "+r);
		float r = random(1);
		if (r<0.4) {
			plist.add(new SquareParticle(c,origin));
		}else{
			plist.add(new Particle(c,origin));
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