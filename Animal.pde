class Animal {
  
  // sets the scale and position for animal class
  PVector position;
  float scale;
  PImage img_front;
  PImage img_left;
  PImage img_right;
  PImage img_blank = loadImage("blank.png");
  PImage current_img;
  float img_width;
  float img_height;
  int img_pos_x;
  int img_pos_y;

  char direction = 0; // 0 = front, 1 = left, 2 = right

  boolean isMoving = false;
  PVector hypotenuse_norm = new PVector(0, 0);
  PVector hypotenuse = new PVector(0, 0);
  PVector target;
  float  distance_to_target;
  float speed = 5;

  Animal() {
  }

  void initialize(float _scale){
    scale = _scale;
    position = new PVector(img_pos_x, img_pos_y);
    current_img = img_front;
    change_img_dims();
  }
  
  void display() {
    image(current_img, position.x, position.y, img_width, img_height);
  }
  
  void face_front(){
    direction = 0;
    current_img = img_front;
    change_img_dims();
  }
  
  void face_left(){
    direction = 1;
    current_img = img_left;
    change_img_dims();
  }
  
  void face_right(){
    direction = 2;
    current_img = img_right;
    change_img_dims();
  }

  void disappear(){
    direction = 3;
    current_img = img_blank;
    change_img_dims();
    isMoving = false;
  }
  

  // ensures all image scales are consistent
  void change_img_dims(){
    if(direction == 0){
      img_width = img_front.width / scale;
      img_height = img_front.height / scale;
    }
    else if(direction == 1){
      img_width = img_left.width / scale;
      img_height = img_left.height / scale;
    }
    else if(direction == 2){
      img_width = img_right.width / scale;
      img_height = img_right.height / scale;
    }
  }

  void change_img_dims(PImage img){
    img_width = img.width / scale;
    img_height = img.height / scale;
  }

  // changes image displayed based on direction animal is moving, and moves position of animal
  void change_position(float amplitude, float period){
    distance_to_target = dist(position.x, position.y, target.x, target.y);
    if (distance_to_target < 10){
      isMoving = false;
      face_front();
      return;
    }
    hypotenuse_norm.normalize();
    hypotenuse_norm.mult(speed);

    if(hypotenuse_norm.x > 0) face_right();
    else face_left();

    position.x += hypotenuse_norm.x;
    position.y += hypotenuse_norm.y + amplitude * sin(position.x * period);
  
    // sets the boundaries of where animal can move
    if(position.x < 0) position.x = 0;
    if(position.x > width - img_width) position.x = width - img_width;
    if(position.y < 0) position.y = 0;
    if(position.y > height - img_height) position.y = height - img_height;


  }

  // calculates line along which the animal is moving
  void move(PVector b){
    target = b;
    isMoving = true;
    hypotenuse.x = target.x - position.x;
    hypotenuse.y = target.y - position.y;

    hypotenuse_norm = hypotenuse;
  }

  void stop(){
    isMoving = false;
    hypotenuse.x = 0;
    hypotenuse.y = 0;
    hypotenuse_norm = hypotenuse;
    face_front();
  }

}
