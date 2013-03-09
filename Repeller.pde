class Repeller
{
  PVector location;
  float mass;
 
  Repeller( PVector l, float m )
 {
   location = l;
   mass     = m;
 } 
 
 void setLocation( PVector l )
 {
   PVector newLocation = l.get();
   location = newLocation; 
 }
 
}
