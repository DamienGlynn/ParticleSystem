import java.util.Iterator;

Emitter emitter;
Repeller repeller;

void setup() {
  size(1200, 800);
  emitter = new Emitter(new PVector(width/2, height/2));
  repeller = new Repeller( (width/2)-200, height/2);
}
 
void draw() {
  background(0);
  emitter.addParticle();
  PVector gravity = new PVector(0,0.1);
  emitter.applyForce(gravity);
  emitter.applyRepeller(repeller);
  emitter.run();
  repeller.update();
  repeller.display();
}

