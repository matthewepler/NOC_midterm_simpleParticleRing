
class ParticleSystem 
{

  ArrayList<Particle> particles;
  PVector origin;
  Repeller repeller;


  ParticleSystem( PVector location, Repeller r ) 
  {
    origin    = location.get();
    particles = new ArrayList<Particle>();
    repeller  = r;
  }


  void addParticle( PVector location, int mass ) 
  {
    particles.add( new Particle( location, mass, repeller ) );
  }


  void run() 
  {
    for ( int i = particles.size() - 1; i >= 0; i-- ) 
    {
      Particle p = particles.get( i );
      p.run();

      if ( p.isDead() ) 
      {
        particles.remove( i );
      }
    }
  }
  
}
