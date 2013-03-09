
ParticleSystem ps;
Repeller repeller;

PVector origin;
int limitRadius = 200;
float g = 1;

void setup() 
{
  size( 800,800 );
  origin = new PVector( 0, 0 );
  
  repeller = new Repeller( origin, 100 );
  ps = new ParticleSystem( origin, repeller );
}

void draw() 
{
  background( 255 );
  
  float angle = random( 0, 360 );
  PVector start = new PVector();
  start.x = cos( radians( angle ) ) * limitRadius;
  start.y = sin( radians( angle ) ) * limitRadius;
  
  // set mass with Perlin noise, also use to determine color of particle
  float mass = 12.0;
  ps.addParticle( start, mass );
  ps.run();
}
