
ParticleSystem ps;
Repeller repeller;

PVector origin;
float limitRadius = 100;
float g = 1;
float xoff = 0.0;

PImage XL, L, M, S;


void setup() 
{
  size( 800,800 );
  origin = new PVector( width/2, height/2 );
  XL = loadImage( "100.png" );
  L  = loadImage( "75.png" );
  M  = loadImage( "50.png" );
  S  = loadImage( "25.png" );
  
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
  
    int mass = floor( random( 1, 5 ) );
    println( mass );
    ps.addParticle( start, mass * 10 );
  }
  
  repeller.setLocation( new PVector( mouseX, mouseY ) );
  ps.run();

}
