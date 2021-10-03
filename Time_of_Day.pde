class Time_of_Day {
  
  boolean isDay = true;
  color day_color = color(128, 210, 224);
  color night_color = color(0, 0, 60);
  PImage sun_img = loadImage("sun2.png");
  PImage moon_img = loadImage("moon2.png");
  
  float sun_scale = 4.3;
  float sun_width = sun_img.width / sun_scale;
  float sun_height = sun_img.height / sun_scale;
  int sun_pos_x = 100;
  int sun_pos_y = 100;
  
  float moon_scale = 3;
  float moon_width = moon_img.width / moon_scale;
  float moon_height = moon_img.height / moon_scale;
  int moon_pos_x = 100;
  int moon_pos_y = 100;
  
  
  Time_of_Day() {
    //draw_scene();
  }
  
  void draw_scene(){
    if(isDay){
      background(day_color);
      image(sun_img, sun_pos_x, sun_pos_y, sun_width, sun_height);
    }
    else{
      background(night_color);
      image(moon_img, moon_pos_x, moon_pos_y, moon_width, moon_height);
    }
  }
  
  void toggle_daytime(){
    if(isDay) // if daytime, make nighttime
      isDay = false;
    else  // if nighttime, make daytime
      isDay = true;
      
    draw_scene();
  }
  
  void make_daytime(){
    isDay = true;
    draw_scene();
  }
  
  void make_nighttime(){
    isDay = false;
    draw_scene();
  }
  
}
