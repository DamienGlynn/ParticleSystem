class Particle {

  PImage img;
  color colour;
  float lifespan, mass, radius;
  PVector location, velocity, acceleration;
  
  
  Particle(PVector l) {
    mass = 1;
    radius = 4;
    lifespan = 255.0;
    location = l.get();
    img = loadImage("White_Circle.png");
    acceleration = new PVector(0, random(1));
    velocity = new PVector(random(-1, 1), random(-2, 0));
    colour = color( (int) random(100, 255), (int) random(100, 255), (int) random(100, 255) );
  }

  void run() {
    update();
    display();
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0;
  }

  void display() {
    imageMode(CENTER);
    tint( colour, lifespan);
    image(img, location.x,location.y, radius*2, radius*2);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

