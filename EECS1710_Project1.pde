import sprites.*; //<>//
import sprites.maths.*;
import sprites.utils.*;


Time_of_Day time;

House rabbit_house;
float house_scale = 1.3;

void setup() {
  size(1080, 800);
  rabbit_house = new House(house_scale);
  
  time = new Time_of_Day();
 
}


void draw() {
  time.draw_scene();
  rabbit_house.display();
}


void keyPressed(){
  if(key == 'o')
    rabbit_house.open_door();
  else if(key == 'c')
    rabbit_house.close_door();
  else if(key == 'd')
    time.make_daytime();
  else if(key == 'n')
    time.make_nighttime();
}
