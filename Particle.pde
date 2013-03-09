
class Particle 
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector force;
  Repeller repeller;
  float   lifespan;
  float   mass;

  Particle( PVector l, float m, Repeller r ) 
  {
    acceleration = new PVector( 0, 0 );
    velocity     = new PVector( 0, 0 );
    location     = l.get();
    lifespan     = 255.0;
    mass         = m;
    repeller     = r;
  }
  
  
  void run() 
  {
    update();
    display();
  }


  void update() 
  {
    PVector force = PVector.sub( location, repeller.location );              
    float distance = force.mag();                                     
    force.normalize();                                                
    float strength = ( g * mass * repeller.mass ) / ( distance * distance ); 
    force.mult( -1 * strength );  
    applyForce ( force );
    
    velocity.add( acceleration );
    location.add( velocity );
    acceleration.mult( 0 );
    lifespan -= 2.0;
  }


  void display() 
  {
    stroke( 0, lifespan );
    fill( 127, lifespan );
    ellipse( location.x, location.y, mass * 2, mass * 2 );
  }
  
  
  boolean isDead() 
  {
    if ( lifespan < 0.0 ) {
      return true;
    } else {
      return false;
    }
  }
  
  
  void applyForce( PVector force )
  {
    PVector f = PVector.div( force, mass );
    acceleration.add( f ); 
  }
}
