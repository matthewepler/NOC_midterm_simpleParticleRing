
ParticleSystem ps;
Repeller repeller;

PVector origin;
int limitRadius = 200;
float g = 1;

void setup() 
{
  size( 800,800 );
  origin = new PVector( width/2, height/2 );
  
  repeller = new Repeller( origin, 100 );
  ps = new ParticleSystem( origin, repeller );
}

void draw() 
{
  background( 255 );
  
  // pick a random spot on the circumference of the limit circle
  PVector start = new PVector();
  start.x = origin.x + limitRadius * cos( random( 0, TWO_PI ) );
  start.y = origin.y + limitRadius * sin( random( 0, TWO_PI ) );
  
  // set mass with Perlin noise, also use to determine color of particle
  float mass = 12.0;
  ps.addParticle( start, mass );
  ps.run();
}
