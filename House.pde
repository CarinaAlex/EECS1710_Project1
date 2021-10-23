class House {
  
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
  
  //void draw_open_door(){  // draw fully open door
  //  display();
  //  fill(0);
  //  stroke(0);
  //  rect(house_pos_x + door_offset_x, house_pos_y + door_offset_y, door_size_x, door_size_y); 
  //}
  
  //void draw_opening_door(){
  //  for(int i = 0; i < (int)door_size_y; i++){
  //    //display();
  //    delay(delay_time);
  //    rect(house_pos_x + door_offset_x, house_pos_y + door_offset_y, door_size_x, i); 
  //  }
  //}
  
  //void draw_closing_door(){
  //  for(int i = (int)door_size_y; i >= 0; i--){
  //    //display();
  //    delay(delay_time);
  //    rect(house_pos_x + door_offset_x, house_pos_y + door_offset_y, door_size_x, i); 
  //  }
  //}
  
  //void draw_closed_door(){  // draw fully closed door
  //  display();
  //  fill(255);
  //  stroke(0);
  //  rect(house_pos_x + door_offset_x, house_pos_y + door_offset_y, door_size_x, 0); 
  //}
  
  //void animate_door() {  // door opening/closing animation
  //  if(isOpen){  // if door is open
  //    //draw_closing_door();
  //    draw_closed_door();
  //  }
  //  else{  // if door is closed
  //    //draw_opening_door();
  //    draw_open_door();
  //  }
  //}
  
  void open_door(){
    if(isOpen){
      return;
    }
    for(int i = 0; i <= door_size_y; i++){
      door_size_current++;
    }
    isOpen = true;
  }
  
  // public void close_door_thread(){
  //   if(!isOpen){
  //     return;
  //   }
  //   for(int i = door_size_y; i >= 0; i--){
  //     door_size_current--;
  //   }
  //   isOpen = false;
  // }

  // void close_door(){
  //   thread("close_door_thread");
  // }

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
