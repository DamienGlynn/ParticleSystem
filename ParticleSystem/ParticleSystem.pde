import java.util.Iterator;

boolean show_instructions = true;
;

// Forces that act on the particle systems.
PVector gravity;
Repeller repeller;
// Emitters that emit particles.
ArrayList<Emitter> emitters;

void setup() {
  size(1200, 800);
  gravity = new PVector(0, 0.05);
  emitters = new ArrayList<Emitter>();
  repeller = new Repeller( (width/2)-200, height/2);
}

void draw() {
  //blendMode(ADD);
  background(0);
  // Loop through all the emitters.
  for (Emitter emitter : emitters) {
    emitter.run();
    emitter.addParticle();
    emitter.applyForce(gravity);
    emitter.applyRepeller(repeller);
  }
  // Update the particle system forces.
  repeller.update();
  repeller.display();

  if (show_instructions) {
    textSize( 100 );
    String str = "Click Anywhere";
    float tw = textWidth(str);
    text(str, (width-tw)/2, height/2);
  }
}

void mousePressed() {
  show_instructions = false;
  // Add a new particle system.
  emitters.add( new Emitter( new PVector(mouseX, mouseY) ) );
}

