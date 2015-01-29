class Confetti extends Particle {
 
  Confetti(PVector l) {
    super(l);
  }
  
  void display() {
    float theta = map(location.x,0,width,0,TWO_PI*2);
    rectMode(CENTER);
    fill  ( colour, lifespan);
    stroke( colour, lifespan);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    rect(0,0, radius, radius);
    popMatrix();
  }
}
