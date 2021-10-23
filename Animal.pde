class Animal {
  
  PVector position;
  float scale;
  PImage img_front;
  PImage img_left;
  PImage img_right;
  PImage current_img;
  float img_width;
  float img_height;
  int img_pos_x;
  int img_pos_y;

  char direction = 0; // 0 = front, 1 = left, 2 = right

  boolean isMoving = false;
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

  void change_position(){
    distance_to_target = dist(position.x, position.y, target.x, target.y);
    if (distance_to_target < 2){
      isMoving = false;
      return;
    }
    hypotenuse.normalize();
    hypotenuse.mult(speed);

    position.x += hypotenuse.x;
    position.y += hypotenuse.y;
  }

  void move(PVector b){
    target = b;
    isMoving = true;
    hypotenuse.x = target.x - position.x;
    hypotenuse.y = target.y - position.y;
  }

}
