class Repeller {
  
  float speed = 5.0f, strength = 500.0f, radius = 2.0f;
  PVector location;
  
  Repeller(float x, float y)  {
    location = new PVector(x,y);
  }
  
  void update(){
    location.x += speed;
    if(location.x + radius > width || location.x - radius < 0){
      speed = -speed;
    }
  }
  
  void display() {
    stroke(255, 0, 0, 0);
    fill(255, 0, 0);
    ellipse(location.x, location.y, radius*2, radius*2);
    fill(0, 0, 255);
  }
 
  PVector repel(Particle p) {
    PVector dir = PVector.sub(location, p.location);
    float d = dir.mag();
    dir.normalize();
    d = constrain(d, 5, 100);
    float force = -1 * strength / (d * d);
    dir.mult(force);
    return dir;
  }
}
