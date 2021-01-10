// digital dashboard

//global variables - need global since we want then to update everytime - don't want to waste time re-intializing 
SensorDataProvider data = new SensorDataProvider(); //used to load data 
Car vehicle = new Car();
Gauge displaySpeed = new Gauge ();   
Gauge displayRPM = new Gauge ();
Gauge displayFuelLevel = new Gauge();
Gauge displayTotalDistance = new Gauge();
Gauge displayRange = new Gauge();
Gauge displayDirection = new Gauge();

//need as global variables because both draw and mouse clicked use then 
boolean run = false; 
String userInput;

//constantly updating rather than re-filling so need them as global - otherwise draw will erase it 
float [] FuelConsumption = new float [40];
float [] aveFuelEconomy = new float [40];
int place = 0; //keeps track of how many elements have been filled 
int i = 0; 

//importing library to create bar charts 
import org.gicentre.utils.stat.*;

//barchart objects - used to create bar charts later on
BarChart FC;
BarChart FE; 

//set up screen to draw on 
void setup()  
{
  size (1100, 800);
}

void draw()
{
  //if occurs when we want to show the home screen 
  if (run == false)  
  {
    //create black background 
    background(0); 
    
    //starting coordinates to draw rectangles for options 
    int x = 10;
    int y = 10;
    
    //setting up how to write options in white - no fill for rectangles, the thickness...
    textSize(40);
    noFill(); 
    stroke(random(255), random(255), random(255)); //creating the changing colour effect 
    strokeWeight(5); 
    
    //drawing rectangles for display screen 
    for (i = 0; i < 3; i++)
    {
      rect (x, y, 1075, 250);
      y+=266;
    }
    
    //now fill with white (since writing text now), but keep stroke and everything else the same
    fill(255);
    //write different options on the screen
    text ("CLICK HERE TO RUN A SIMULATION ", 200, 130);
    text ("FOR A MINICAR", 390, 175);
    
    text ("CLICK HERE TO RUN A SIMULATION", 200, 390);
    text ("FOR A TRUCK", 390, 435);
    
    text ("CLICK HERE TO QUIT", 340, 675);
    //here, the mouseClicked class will automatically be called - depending on where the user clicks
    //the run will be set to true and the userInput will be set to the vehicle wanted, or program will exit (when quit clicked)
    
  }
  //else occurs as soon as run is true (so user selected a vehicle) and this will run on the next iteration of draw 
  else 
  {
    //below class method used to set the filepath (name if file to be used), load data in dataTable, and set the row number 
    data.initialize(userInput);  
    
    //get the very first fuel level based on the fact that were at row 0 - used for calculating consumed fuel in FuelTank 
    if (data.currentIndex == 0)
      data.readInitialFuelLevel(); 
      
    //every single time draw runs, it'll run across a new row, and reassign these values based on that row 
     data.readRPM(); // in rotations/min
     data.readFuelLevel(); // in L
     data.readRatio();
     data.readX();
     data.readY();
     data.setWheelRadius(); // in m
     data.setTankCapacity(); // in L
    
    //calculates the speed for a given instance and the total distance travelled overall 
    vehicle.trip.getSpeed(data.rpm, data.wheelRadius, data.gearRatio); // in km/h
    vehicle.trip.totalDistance(); // in km
    
    //determines how much fuel has been consumed at that given instance in time in L 
    vehicle.tank.getConsumedFuel(data.initialFuelLevel, data.fuelLevel); 
    
    //series of calculations 
    vehicle.fuel.calcFuelEconomy(vehicle.trip.totalDistanceTravelled, vehicle.tank.consumedFuel); // km/L
    vehicle.fuel.calcAveFuelEconomy(); //km/L
    vehicle.fuel.calcRange(data.fuelLevel); //km 
    vehicle.fuel.getFuelConsumption(); // L
    
    //fill array for fuelConsumption or aveFuelEconomy if all 40 indexes not full - used to create charts 
    if (place < 40)
    {
      FuelConsumption[place] = vehicle.fuel.fuelConsumption;
      aveFuelEconomy[place] = vehicle.fuel.aveFuelEconomy;
      place++;
    }
    //if every element is full, shift everythign back one every time, and then put in the new value at the end 
    else 
    {
      for (i = 0; i < 39; i++)
      {
          FuelConsumption[i] = FuelConsumption[i+1];
          aveFuelEconomy[i] = aveFuelEconomy[i+1];
      }
        FuelConsumption[i] = vehicle.fuel.fuelConsumption;
        aveFuelEconomy[i] = vehicle.fuel.aveFuelEconomy;
    } 
    
    //sets currentValue in each gauge to the value being sent in 
    //displaySpeed.setCurrent(vehicle.trip.speed);
    //displayRPM.setCurrent(data.rpm);
    //displayFuelLevel.setCurrent(data.fuelLevel);
    
    //sets the min, max values for each gauge 
    displaySpeed.setMinMax(0, 200);
    displayRPM.setMinMax(0, 2500);
    displayFuelLevel.setMinMax(0, data.tankCapacity);
    
    //to overwrite the previous screen, wether that be gauges for the last instance or the input screen
    background(0);
    
    //now draw the gauges, with their respective parameters,in positions x, y, with a diameter d 
    displaySpeed.drawGauge (vehicle.trip.speed, "(KM/HR)", "SPEED", 315.0, 300.0, 250.0);
    displayRPM.drawGauge (data.rpm, "RPM", "RPM", 545.0, 200.0, 250.0);
    displayFuelLevel.drawGauge (data.fuelLevel, "(LITRES)", "FUEL LEVEL", 775.0, 300.0, 250.0);
    
    //now draw the gauge for the odometer/range - using function overloading 
    displayTotalDistance.drawGauge (215, 70, vehicle.trip.totalDistanceTravelled, "(KM)", "ODOMETER");
    displayRange.drawGauge (675, 70, vehicle.fuel.range, "(KM)", "RANGE");
    
    //now draw the gauge for the direction of the car 
    displayDirection.drawGauge(data.X, data.Y);
    
    //draw fuel consumpotion barchart
    FC = new BarChart (this); 
    FC.setData(FuelConsumption);
    
    //determine range of y axis 
    FC.setMinValue(0);
    FC.setMaxValue(5);
    
    //textFont(createFont("Sherif", 3), 10);
    textSize(10);
    
    //drawing graph for fuel consumption
    FC.showValueAxis(true);  
    FC.setValueFormat("#");
    FC.showCategoryAxis(true);
    FC.setBarColour(255);
    FC.setBarGap(4);
    FC.draw(10, 550, 540, 180);  
    
    //write title for the graph 
    textSize(20);
    fill (#FC0399);
    text ("Fuel Consumption (L/100 KM)", 130, 750); 
    
    //display current value of fuel consumption 
    text ("Fuel Consumption(L/100 KM): ", 155, 500);
    fill(255);
    text(vehicle.fuel.fuelConsumption, 445, 500);
    
    //create fuel economy graph 
    FE = new BarChart (this);
    FE.setData(aveFuelEconomy);
    
    //once again determine range of y axis 
    FE.setMinValue(0);
    FE.setMaxValue(1000);
    
   // textFont(createFont("Sherif", 3), 10);
    textSize(10);
    
    FE.showValueAxis(true);  
    FE.setValueFormat("#");
    FE.showCategoryAxis(true);
    FE.setBarColour(255);
    FE.setBarGap(4);
    FE.draw(550, 550, 540, 180);  
    
    //write title for graph 
    textSize(20);
    fill (#FC0399);
    text ("Average Fuel Economy (KM/L)", 680, 750);
    
    //display current value of average fuel economy 
    text ("Average Fuel Economy(KM/L): ", 575, 500);
    fill(255);
    text(vehicle.fuel.aveFuelEconomy, 865, 500);
    
    //increment the row index to point at the next row for the next time draw called 
    data.readNext();    
    
    //if you've reached the end of the data, quit drawing, and go back to the home screen 
    if (data.currentIndex == data.dataTable.getRowCount())
      run = false;
  } 
}
 
void mouseClicked()
{
  
  if (mouseY > 0 && mouseY <= 266)
  {
    userInput = "minicar"; 
    run = true;
    data.currentIndex = 0;
  }
  else if (mouseY > 266 && mouseY <= 532)
  {
    userInput = "truck";
    run = true;
    data.currentIndex = 0;
  }
  else 
  {
    exit();
    return;
  }
}
