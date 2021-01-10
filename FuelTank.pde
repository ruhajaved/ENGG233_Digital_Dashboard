class FuelTank 
{
  float consumedFuel; 
  
  void getConsumedFuel(float initialFuelLevel, float fuelLevel)
  {
    consumedFuel = initialFuelLevel - fuelLevel;
  }
}
