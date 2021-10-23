int rabbit_pos_init_x = 840;
int rabbit_pos_init_y = 480;

int rabbit_pos_second_x = 150;
int rabbit_pos_second_y = 500;

String front_filename = "rabbit_front2.png";
String left_filename = "rabbit_side_left.png";
String right_filename = "rabbit_side_right.png";


class Rabbit extends Animal {
  Rabbit(float _scale) {
    img_front = loadImage(front_filename);
    img_left = loadImage(left_filename);
    img_right = loadImage(right_filename);

    img_pos_x = rabbit_pos_init_x;
    img_pos_y = rabbit_pos_init_y;
    initialize(_scale);
  }
  
  void toggle_position(){
    if(direction == 0) face_left();
    else if(direction == 1) face_right();
    else if(direction == 2) face_front();
    
    if(position.x == rabbit_pos_init_x) position.x = rabbit_pos_second_x;
    else position.x = rabbit_pos_init_x;
  }
  
  void moving_left(){
    direction = 1;
    
  }
  
}
