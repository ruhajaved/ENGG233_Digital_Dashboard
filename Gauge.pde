class Gauge  
{
  float min, max, xVector, yVector, previousX, previousY;
  
   void setMinMax (float _min, float _max)
   {
     min = _min;
     max = _max;
   }
  
  ////draws the gauge for speed, RPM, and fuel 
  void drawGauge (float parameter, String units, String title, float x, float y, float d)  
  {
    println (parameter);
    strokeWeight(4);
    stroke(255);
    noFill();
    ellipse(x, y, d, d);
    
    textSize(40); 
    
    //determining colour of numbers - red, orange, or green depending on how high or low the value is 
    if (title == "FUEL LEVEL")
    {
    if (parameter < max * 0.15)
      fill (#F51119); //red fill if fuel level is less than 15%
    else if (parameter > max * 0.85) //green fill if fuel level is greater than 85%
      fill (#1CD10D);
    else //else fill with yellow 
      fill(#FCAA03);
    }
    else //if speed or rpm gauge 
    {
      if ((parameter < max * 0.15) ||  (parameter > max * 0.85))
        fill (#F51119); //if speed or rpm is really low or really high, fill with red 
      else 
        fill (#1CD10D); //else fill with green 
    }
    
    //write out currentValue - don't really need but for alignment purposes have if/else structure 
    if (title == "SPEED")
      text (parameter, x - 90, y); 
    else if(title == "RPM")
      text (parameter, x - 105, y + 10); 
    else //if fuel level 
      text (parameter, x - 80, y);
    
    //write out units - don't write anything if dealing with the rpm gauge  
    if (title != "RPM")
    {
      textSize(25);
      fill (255);
      text (units, x - 50, y + 30); 
    }
    
    //set text size and fill for the titles of each gauge (label at the bottom)
    textSize(20);  // for title
    fill (#FC0399);
     
     //once again, don't really need but for alignment purposes haveif/else 
    if (title == "SPEED")
      text (title, x - 30, y + d/2 + 25);
    else if(title == "RPM")
      text (title, x - 20, y + d/2 + 25);
    else //if fuel level gauge 
      text (title, x - 50, y + d/2 + 25);
     
  }
  
  //displays range and odometer 
  void drawGauge(int x, int y, float value, String units, String title) 
  {
    stroke(#FC0399);  //magenta colour 
    strokeWeight(2);
    noFill();
    rect(x, y, 200, 50); //draw rectangle to put number in 
    
    //write out the value 
    textSize(25);  
    text (value, x + 30, y + 35);
    
    //write title at a specific location 
    textSize(15);
    if (title.equals("ODOMETER"))
      text (title + " " + units, x + 45, 2 * y);
    else 
      text (title + " " + units, x + 60, 2 * y);
    
  }
  
  void drawGauge(float X, float Y)    
  {
    //create a circle for the direction indicator 
    stroke(#FC0399);   
    noFill();
    ellipse (545, 400, 55, 55);
    
    textSize(20);
    //fill(#FC0399);
    strokeWeight(2);
    
    //find your vector x and y to determine direction 
    xVector = X - previousX;
    yVector = Y - previousY;
    
    
    if (xVector > 0 && yVector > 0) //q1
      text("NE", 530, 405);
     else if (xVector > 0 && yVector < 0) //q4
      text("SE", 530, 405);
     else if (xVector < 0 && yVector < 0) //q3
      text("SW", 530, 405);
     else if (xVector < 0 && yVector > 0) //q2
      text("NW", 530, 405);
     else if (xVector == 0 && yVector > 0) //on +y
      text("N", 530, 405);
     else if(xVector > 0 && yVector == 0) //on +x
      text("E", 530, 405);
     else if (xVector == 0 && yVector < 0) //on -y
       text("S", 530, 405);
     else 
       text("W", 530, 405); //on -x
     
     //reassign previous values
     previousX = X;
     previousY = Y;
       
  }
}
