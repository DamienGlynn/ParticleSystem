class Emitter {
  
  // The location of the emitter.
  PVector origin;
  // To store the particles.
  ArrayList<Particle> particles;
  
  Emitter(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }
  
  // A method to add a particle to the particles.
  void addParticle() {
    particles.add(new Particle(origin));
  }
  
  // A method to apply a force to a particle.
  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }
  
  // A method to apply a repeller force.
  void applyRepeller(Repeller r) {
    for (Particle p : particles) {
      PVector force = r.repel(p);
      p.applyForce(force);
    }
  }

  void run() {
    // Using the Iterator allows us to remove a particle from the ArrayList.
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext ()) {
      Particle p = (Particle) it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}

