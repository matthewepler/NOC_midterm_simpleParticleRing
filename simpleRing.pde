
ParticleSystem ps;

void setup() {
  size( 640,360 );
  ps = new ParticleSystem( new PVector( width/2, 50 ) );
}

void draw() {
  background( 255 );
  ps.origin.set( width/2, height/2 );
    
  ps.addParticle();
  ps.run();

}