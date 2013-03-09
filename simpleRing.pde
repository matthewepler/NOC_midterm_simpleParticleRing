// Simple particle system based on Dan Shiffman's 'Nature of Code' examples
// Matthew Epler, 2013

ParticleSystem ps;
Repeller repeller;

PVector origin;
float limitRadius = 100;
float g = 1;


void setup() 
{
  size( 800,800 );
  origin = new PVector( width/2, height/2 );
  
  repeller = new Repeller( origin, 10000 );
  ps = new ParticleSystem( origin, repeller );
}

void draw() 
{
  background( 25 );
   
  for( int i = 0; i < 25; i++ )
  {
    float angle = random( 0, 360 );
    PVector start = new PVector();
    start.x = origin.x + cos( radians( angle ) ) * limitRadius;
    start.y = origin.y + sin( radians( angle ) ) * limitRadius;
  
    float mass = 1;
    ps.addParticle( start, mass );
  }
  
  repeller.setLocation( new PVector( mouseX, mouseY ) );
  ps.run();

}
