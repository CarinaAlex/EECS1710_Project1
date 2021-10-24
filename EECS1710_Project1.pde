Time_of_Day time;
House rabbit_house;
Rabbit bob;
Fox alice;

float house_scale = 1.3;
float rabbit_scale = 20;
float fox_scale = 3;


void setup() {
  size(1080, 800);

  // calling the constructors of the scene
  rabbit_house = new House(house_scale);
  bob = new Rabbit(rabbit_scale);
  alice = new Fox(fox_scale);
  time = new Time_of_Day();
 
}


void draw() {
  time.draw_scene(); // drawing the scene and the time of day 
  rabbit_house.display();

  // sets rabbit's position - left, right, front
  if(bob.isMoving) bob.change_position(5, 0.2);
  bob.display();

  // if cursor is within the garage door, and door is open, rabbit disappears
  if(bob.inGarage() && rabbit_house.isOpen) bob.disappear(); 

  // sets fox's position - right, left, front, sleep
  if(alice.isMoving) alice.change_position(0, 0);
  alice.display();

  // if rabbit eats the wheat, then wheat disappears
  if(time.isRabbitEating(bob.position)) time.wheat_gets_eaten();


  // if it is day time and rabbit is out of garage or if wheat is eaten at night, then fox chases rabbit
  if((!time.isDay && time.isWheatEaten) || (time.isDay && (!bob.inGarage()))) alice.move(bob.position);
  if(bob.didFoxCatchRabbit(alice.position)){
    bob.disappear(); // if fox catches rabbit, then rabbit disappears; and respawns back in house.
  }

  if(!time.isDay) alice.FoxSleep(); // if it is nightime, then fox is sleeping

}


void keyPressed(){
  if(key == 'o') // o = open garage door
    rabbit_house.open_door();
  else if(key == 'c') // c = close garage door
    rabbit_house.close_door();
  else if(key == 'd') // d = daytime
    time.make_daytime();
  else if(key == 'n') // n = nightime
    time.make_nighttime();
  else if(key == 'r') // r = move rabbit
    bob.move(new PVector(pmouseX,pmouseY));
  else if(key == 'f') // f = move fox
    alice.move(new PVector(pmouseX,pmouseY));



}
