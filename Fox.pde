class Fox extends Animal {

  // fox starting position
  int fox_pos_init_x = 140;
  int fox_pos_init_y = 650;

  String front_filename = "fox_sit.png";
  String left_filename = "fox_left.png";
  String right_filename = "fox_right.png";
  String sleep_filename = "fox_sleep.png";
  PImage img_sleep;

  // loads fox images
  Fox(float _scale) {
    img_front = loadImage(front_filename);
    img_left = loadImage(left_filename);
    img_right = loadImage(right_filename);
    img_sleep = loadImage(sleep_filename); 

    img_pos_x = fox_pos_init_x;
    img_pos_y = fox_pos_init_y;
    speed = 3;
    initialize(_scale);
    
  }
  
  void FoxSleep(){
    current_img = img_sleep;
    change_img_dims(current_img);
  }

}
