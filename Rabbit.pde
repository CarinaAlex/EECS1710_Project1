class Rabbit extends Animal {

  // sets rabbit starting position
  int rabbit_pos_init_x = 840;
  int rabbit_pos_init_y = 510;

  String front_filename = "rabbit_front2.png";
  String left_filename = "rabbit_side_left.png";
  String right_filename = "rabbit_side_right.png";

  Rabbit(float _scale) {
    img_front = loadImage(front_filename);
    img_left = loadImage(left_filename);
    img_right = loadImage(right_filename);

    img_pos_x = rabbit_pos_init_x;
    img_pos_y = rabbit_pos_init_y;
    initialize(_scale);
    current_img = img_blank;
  }

  // determines if rabbit is in the garage, and sets the parameters 
  boolean inGarage(){
    if((position.x > 800) && (position.x < 960) && (position.y > 500) && (position.y < 600))
      return true;
    else
      return false;
  }

  // determines if the fox caught the rabbit, and sets the parameters
  boolean didFoxCatchRabbit(PVector fox_position){
    float distance = dist(fox_position.x, fox_position.y, position.x, position.y);

    if(distance < 30){
      position.x = rabbit_pos_init_x;
      position.y = rabbit_pos_init_y;
      return true;
    }
    else
      return false;
  }
  

}
