
class Particle 
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector force;
  Repeller repeller;
  float   lifespan;
  int   mass;

  Particle( PVector l, int m, Repeller r ) 
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
    PVector force = PVector.sub( repeller.location, location );              
    float distance = force.mag();                                     
    force.normalize();                                                
    float strength = ( g * mass * repeller.mass ) / ( distance * distance ); 
    force.mult( -1 * strength );  
    applyForce ( force );
    
    velocity.add( acceleration );
    location.add( velocity );
    acceleration.mult( 0 );
    lifespan -= 4.0;
  }


  void display() 
  {
    stroke( 255, lifespan );
    point( location.x, location.y );
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
