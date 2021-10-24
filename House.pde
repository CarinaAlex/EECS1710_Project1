class House {
  
  // sets position, scale, and size of house
  PVector position;
  float scale;
  PImage house_img = loadImage("house.png");;
  float img_width;
  float img_height;
  boolean isOpen = false;
  int house_pos_x = 530;
  int house_pos_y = 340;
  int door_offset_x = 303;
  int door_offset_y = 180;
  int door_size_x = 110;
  int door_size_y = 50;
  int door_size_current = 0;
  int delay_time = 20;
  
  
  House() {
    this(1);
  }
  
   House(float _scale) {
    scale = _scale;
    
    img_width = house_img.width / scale;
    img_height = house_img.height / scale;
    position = new PVector(house_pos_x, house_pos_y);
  }

  void display() {  // draw a new house!
    image(house_img, position.x, position.y, img_width, img_height);
    fill(0);
    stroke(0);
    rect(house_pos_x + door_offset_x, house_pos_y + door_offset_y, door_size_x, door_size_current); 
  }  
  
  
  void open_door(){
    if(isOpen){
      return;
    }
    for(int i = 0; i <= door_size_y; i++){
      door_size_current++;
    }
    isOpen = true;
  }

  void close_door(){
    if(!isOpen){
      return;
    }
    for(int i = door_size_y; i >= 0; i--){
      door_size_current--;
    }
    isOpen = false;
  }
  
  
}
