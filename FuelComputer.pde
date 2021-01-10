class FuelComputer 
{
  float fuelEconomy, aveFuelEconomy, range, sum, fuelConsumption;
  int tracker = 1;
  
  void calcFuelEconomy (float totalDistance, float consumedFuel) 
  {
    fuelEconomy = totalDistance / consumedFuel;
  }
  
  void calcAveFuelEconomy()
  {
    sum =+ fuelEconomy;
    aveFuelEconomy = sum / tracker;
    tracker++;
  }
  
   void calcRange(float fuelLevel)
  {
    range = aveFuelEconomy * fuelLevel;
  }
  
  void getFuelConsumption()
  {
    fuelConsumption = 100 / aveFuelEconomy;
  }
}
