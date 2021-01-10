class SensorDataProvider
{
  String filePath; 
  float time, initialFuelLevel, fuelLevel, gearRatio, X, Y, wheelRadius, tankCapacity;
  Table dataTable; 
  int currentIndex, rpm; 
  TableRow row;
  
  void initialize (String userInput) 
  {
    if (userInput.equals("minicar"))
      filePath = "car_status_BMW_323i.csv";
    else 
      filePath = "car_status_Truck_F150.csv";
      
    dataTable = loadTable (filePath, "header"); 
    row = dataTable.getRow(currentIndex); //use currentIndex because automatically intialized to 0 as default 
  }
  
  void readInitialFuelLevel()
  {//essentially get the very first fuel level 
    initialFuelLevel = row.getFloat("Fuel Level (liter)");
  }
  
  void readRPM()
  {
    rpm = row.getInt("RPM");
  }
    
  void readFuelLevel()
  {
    fuelLevel = row.getFloat("Fuel Level (liter)");
  }
  
  void readRatio()
  {
    gearRatio = row.getFloat("Gear Ratio");
  }
  
  void readX()
  {
    X = row.getFloat("X");
  }
  
  void readY()
  {
    Y = row.getFloat("Y");
  }
  
  void setWheelRadius()
  {
    if (filePath == "car_status_Truck_F150.csv")
      wheelRadius = 0.254;
    else
      wheelRadius = 0.23; //if minicar
  }
  
  void setTankCapacity() 
  {
    if (filePath == "car_status_Truck_F150.csv")
      tankCapacity = 80.0;
    else 
      tankCapacity = 60.0; //if minicar
  }
  
  void readNext() 
  {
    if (currentIndex < dataTable.getRowCount())
      currentIndex++;
  }
}
