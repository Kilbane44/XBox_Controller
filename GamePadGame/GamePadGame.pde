import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;

import g4p_controls.*;

ControlIO control;
Configuration config;
ControlDevice gpad;
PVector pos = new PVector(400,400);

void setup()
{
  size(800,800);
  control = ControlIO.getInstance(this);
  gpad = control.getMatchedDevice("GamePadTest");
  if (gpad == null) {
    println("No suitable device configured");
    System.exit(-1); // End the program NOW!
  }
}




void GamePad()
{
  float Speed = 3;
  
  float Triggers = gpad.getSlider("Triggers").getValue();
  float RStickVt = gpad.getSlider("RStickVt").getValue();
  float RStickHz = gpad.getSlider("RStickHz").getValue();
  boolean _A = gpad.getButton("A").pressed();
  boolean _B = gpad.getButton("B").pressed();
  
  
  Speed = 1+Speed* Triggers;
  if(_A)
  {
    background(0);
  }
  println(RStickVt);
  
  pos.y += RStickVt*Speed;
  pos.x += RStickHz*Speed;
}

void draw()
{
  GamePad();
  ellipse(pos.x,pos.y,20,20);
}