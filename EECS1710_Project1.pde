 //<>//
Time_of_Day time;
House rabbit_house;
Rabbit bob;

float house_scale = 1.3;
float rabbit_scale = 20;



void setup() {
  size(1080, 800);
  rabbit_house = new House(house_scale);
  bob = new Rabbit(rabbit_scale);
  
  time = new Time_of_Day();
 
}


void draw() {
  time.draw_scene();
  rabbit_house.display();
  if(bob.isMoving) bob.change_position();
  bob.display();
}


void keyPressed(){
  if(key == 'o')
    rabbit_house.open_door();
  else if(key == 'c')
    rabbit_house.close_door();
    // thread("rabbit_house.close_door()");
  else if(key == 'd')
    time.make_daytime();
  else if(key == 'n')
    time.make_nighttime();
  else if(key == 'r')
    bob.face_right();
  else if(key == 'l')
    bob.face_left();
  else if(key == 'f')
    bob.face_front();
  else if(key == 't')
    bob.toggle_position();
  else if(key == 'm'){
    PVector shithead = new PVector(pmouseX,pmouseY);
    bob.move(shithead);
  }
  
}
