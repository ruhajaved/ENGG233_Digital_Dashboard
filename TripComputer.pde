class TripComputer 
{
  float totalDistanceTravelled;
  float speed;
  
    void getSpeed(int rpm, float wheelRadius, float gearRatio)
  {
    speed = (rpm * 2 * 3.14159 * wheelRadius * 3600) / (60 * gearRatio * 1000);  // calcs in km/h for that instance in time 
  }
  
  void totalDistance()
  {
    totalDistanceTravelled+=speed; // in km - can simply add speed to total distance since the distance 
                                   // travelled within a second is just the speed 
  }
  
}
