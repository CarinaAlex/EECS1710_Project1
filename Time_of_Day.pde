class Time_of_Day {
  

  // loads images necessary for time of day
  boolean isDay = true;
  boolean isWheatEaten = false;
  color day_color = color(128, 210, 224);
  color night_color = color(0, 0, 60);
  color current_color = day_color;
  color target_color;
  PImage sun_img = loadImage("sun2.png");
  PImage moon_img = loadImage("moon2.png");
  PImage wheat_img = loadImage("wheat.png");
  PImage grass_img = loadImage("grass.png");
  PImage img_blank = loadImage("blank.png");
  PImage wheat_display_img = wheat_img;

  // sun scale and position
  float sun_scale = 4.3;
  float sun_width = sun_img.width / sun_scale;
  float sun_height = sun_img.height / sun_scale;
  PVector sun_pos = new PVector(100,100);
  
  // moon scale and position
  float moon_scale = 3;
  float moon_width = moon_img.width / moon_scale;
  float moon_height = moon_img.height / moon_scale;
  PVector moon_pos = new PVector(100,100);
  
  // wheat scale and position
  float wheat_scale = 7;
  float wheat_width = wheat_img.width / wheat_scale;
  float wheat_height = wheat_img.height / wheat_scale;
  int wheat_pos_x = (int)random(50,900);
  int wheat_pos_y = (int)random(300,630);

  
  // grass scale and position
  float grass_scale = 5;
  float grass_width = grass_img.width / (grass_scale * 0.3);
  float grass_height = grass_img.height / (grass_scale * 0.5);
  int grass_pos_x = 0;
  int grass_pos_y = 550;

  
  Time_of_Day() {

  }
  // draws the colour of sky, moon and sun
  void draw_scene(){
    background(current_color);
    if(isDay)
      image(sun_img, sun_pos.x, sun_pos.y, sun_width, sun_height);
    else
      image(moon_img, moon_pos.x, moon_pos.y, moon_width, moon_height);
    image(grass_img, grass_pos_x, grass_pos_y, grass_width, grass_height);
    draw_wheat();

  }
  
  void make_daytime(){
    current_color = day_color;
    isDay = true;
    wheat_grows_back();
    draw_scene();
  }
  
  void make_nighttime(){
    current_color = night_color;
    isDay = false;
    draw_scene();
  }

  // when wheat gets eaten displays blank image
  void wheat_gets_eaten(){
    isWheatEaten = true;
    wheat_display_img = img_blank;
  }

  // wheat grows back in random place
  void wheat_grows_back(){
    isWheatEaten = false;
    wheat_display_img = wheat_img;
    wheat_pos_x = (int)random(50,900);
    wheat_pos_y = (int)random(300,800);
  }

  // sets the parameters of where wheat is drawn
  void draw_wheat(){
    image(wheat_display_img, wheat_pos_x, wheat_pos_y, wheat_width, wheat_height);
    image(wheat_display_img, wheat_pos_x + 20, wheat_pos_y - 10, wheat_width + 30, wheat_height);
    image(wheat_display_img, wheat_pos_x - 35, wheat_pos_y - 15, wheat_width, wheat_height - 30);
  }

  // sets the parameters necessary for rabbit to eat wheat
  boolean isRabbitEating(PVector rabbit_position){
    float distance = dist(rabbit_position.x, rabbit_position.y, wheat_pos_x, wheat_pos_y);

    if(distance < 40)
      return true;
    else
      return false;
  }


  }
  


