class PlayerTank
{
  private PVector location;
  private float spawn_x;
  private float spawn_y;
  boolean orientation_updown = false;
  boolean orientation_leftright = true;
  boolean orientation_upright = false;
  boolean orientation_upleft = false;
  
  private PVector velocity;
  private float tank_speed;
  
  private boolean right_collision = false;
  private boolean left_collision = false;
  private boolean above_collision = false;
  private boolean below_collision = false;
  
  private float original_tank_health;
  private float tank_health;
  private float tank_health_regeneration;
  private int regeneration_kickin = 10;
  private int regeneration_cool_down = 0;
  private float tank_width;
  private float tank_height;
  private float turret_cir_width;
  private float turret_cir_height;
  private float turret_rec_width;
  private float turret_rec_height;
  private int[] tank_color = {0, 255, 0};
  private int[] tank_outline_color = {0, 0, 0};
  private int tank_stroke_weight = 1;
  private int[] turret_color = {0, 0, 0};
  private int[] turret_outline_color = {0, 0, 0};
  private int turret_stroke_weight = 1;
  
  private float right_collision_dist;
  private float left_collision_dist;
  private float above_collision_dist;
  private float below_collision_dist;
  
  private float bullet_size;
  private float bullet_speed;
  private float bullet_health;
  private int bullet_frequency;
  private float bullet_spawn_from_length = 0;
  private int num_bullet_bounce;
  private int shot_cool_down = 0;
  private boolean player_shot_collision_with_body_allowed = true; 
  private boolean enemy_shot_collision_with_body_allowed = false; 
  private boolean player_bullet_collide_allowed = true; 
  private boolean enemy_bullet_collide_allowed = false;
  private boolean collision_bullet_with_wall_allowed = true;
  private boolean collision_body_with_wall_allowed = true;
  private int tempTickCount = 0;
  
  public PlayerTank(
  float tank_width, 
  float tank_height, 
  float tank_health,
  float tank_health_regeneration,
  float tank_speed, 
  float bullet_size, 
  float bullet_speed, 
  float bullet_health, 
  int bullet_frequency, 
  int num_bullet_bounce, 
  float spawnX, float spawnY,
  int tank_color_red, int tank_color_green, int tank_color_blue,
  int tank_outline_red, int tank_outline_green, int tank_outline_blue,
  int tank_stroke_weight,
  int turret_color_red, int turret_color_green, int turret_color_blue,
  int turret_outline_red, int turret_outline_green, int turret_outline_blue,
  int turret_stroke_weight)
  {
    location = new PVector(spawnX, spawnY);
    this.spawn_x = spawnX;
    this.spawn_y = spawnY;
    this.tank_width = width * tank_width / 1920;
    this.tank_height = height * tank_height / 1080;
    this.original_tank_health = tank_health;
    this.tank_health = tank_health;
    this.tank_health_regeneration = tank_health_regeneration;
    this.bullet_health = bullet_health;
    velocity = new PVector(tank_speed  * 80 / framerate, tank_speed  * 80 / framerate);
    this.tank_speed = tank_speed * 80 / framerate;
    
    this.turret_cir_width = this.tank_height * 1/3;
    this.turret_cir_height = this.tank_height * 1/3;
    this.turret_rec_width = this.tank_height * 2/5 ;
    this.turret_rec_height = this.tank_height * 1/3;
    this.right_collision_dist = this.tank_width * sqrt(2) / 4; //distance from middle of tank to the right 
    this.left_collision_dist = this.tank_width * sqrt(2) / 4; //distance from middle of tank to the left
    this.above_collision_dist = this.tank_width * sqrt(2) / 4; //distance from middle of tank to above
    this.below_collision_dist = this.tank_width * sqrt(2) / 4; //distance from middle of tank to below
    this.bullet_size = bullet_size;
    this.bullet_speed = bullet_speed;
    this.bullet_frequency = bullet_frequency;
    this.num_bullet_bounce = num_bullet_bounce;
    
    this.tank_color[0] = tank_color_red;
    this.tank_color[1] = tank_color_green;
    this.tank_color[2] = tank_color_blue;
    this.tank_outline_color[0] = tank_outline_red;
    this.tank_outline_color[1] = tank_outline_green;
    this.tank_outline_color[2] = tank_outline_blue;
    this.tank_stroke_weight = tank_stroke_weight;
    
    this.turret_color[0] = turret_color_red;
    this.turret_color[1] = turret_color_green;
    this.turret_color[2] = turret_color_blue;
    this.turret_outline_color[0] = turret_outline_red;
    this.turret_outline_color[1] = turret_outline_green;
    this.turret_outline_color[2] = turret_outline_blue;
    this.turret_stroke_weight = turret_stroke_weight;
  }
  
  public void update()
  {
    collisionCheck();    
    updatePosition();
    shootCheck();
    if(shoot_input)
      tempTickCount++;
    regeneration_cool_down--;
  }
  
  private void collisionCheck()
  {
    //do not do World myWorld = new World(6) here, it already sees it from the TankGame file
    if(collision_body_with_wall_allowed)
    {
      for(int i = 0; i < myWorld.getNumWalls(); i++) //loops through all of the walls
      {
      //vertical wall check right_collision
        if ((myWorld.getWalls()[i][0]) - (location.x + right_collision_dist) <= 0 //scans if the collision box overlaps with a rectangle along a vertical line
        && (myWorld.getWalls()[i][0]) - (location.x) >= 0 //Makes sure that this collision box does not affect the other side of the box
        && (location.y - above_collision_dist) - (myWorld.getWalls()[i][1] + myWorld.getWalls()[i][3]) <= 0 //makes sure that the tank is within the right vertical segment of the rectangle
        && (location.y + below_collision_dist) - (myWorld.getWalls()[i][1]) >= 0 //makes sure that the tank is within the right vertical segment of the rectangle
        || (width) - (location.x + right_collision_dist / 2) <= 0) //makes sure the tank cannot go off-screen
          right_collision = true;
      
      //vertical wall check left_collision
        if ((myWorld.getWalls()[i][0] + myWorld.getWalls()[i][2]) - (location.x - left_collision_dist) >= 0 
        && (myWorld.getWalls()[i][0] + myWorld.getWalls()[i][2]) - (location.x) <= 0
        && (location.y - above_collision_dist) - (myWorld.getWalls()[i][1] + myWorld.getWalls()[i][3]) <= 0 
        && (location.y + below_collision_dist) - (myWorld.getWalls()[i][1]) >= 0
        || (location.x - left_collision_dist / 2) <= 0)
          left_collision = true;
      
      //horizontal wall check above_collision
        if ((myWorld.getWalls()[i][1] + myWorld.getWalls()[i][3]) - (location.y - above_collision_dist) >= 0 
        && (myWorld.getWalls()[i][1] + myWorld.getWalls()[i][3]) - (location.y) <= 0
        && (location.x - left_collision_dist) - (myWorld.getWalls()[i][0] + myWorld.getWalls()[i][2]) <= 0 
        && (location.x + right_collision_dist) - (myWorld.getWalls()[i][0]) >= 0
        || (location.y - this.tank_height / 2) <= 0)
          above_collision = true;
      
      //horizontal wall check below_collision
        if ((myWorld.getWalls()[i][1]) - (location.y + below_collision_dist) <= 0 
        && (myWorld.getWalls()[i][1]) - (location.y) >= 0
        && (location.x - left_collision_dist) - (myWorld.getWalls()[i][0] + myWorld.getWalls()[i][2]) <= 0 
        && (location.x + right_collision_dist) - (myWorld.getWalls()[i][0]) >= 0
        || (height) - (location.y + this.tank_height / 2) <= 0)
          below_collision = true;
      }
      
      for(int i = 0; i < enemyController.enemies.size(); i++)
      {
        //draws a vector between each tank and other tanks
        PVector between_vector = new PVector(location.x - enemyController.getEList().get(i).location.x, location.y - enemyController.getEList().get(i).location.y);
        between_vector.normalize();
        between_vector.x *= this.tank_speed;
        between_vector.y *= this.tank_speed;
        
        if(dist(location.x, location.y, enemyController.getEList().get(i).location.x, enemyController.getEList().get(i).location.y) < this.tank_width)
          location.add(between_vector); //if the tanks' centers are within the range the size of tank_width, add opposing velocity
      }
    }
    {
      if((width) - (location.x + right_collision_dist / 2) <= 0)
        right_collision = true;
      if((location.x - left_collision_dist / 2) <= 0)
        left_collision = true;
      if((location.y - this.tank_height / 2) <= 0)
        above_collision = true;
      if((height) - (location.y + this.tank_height / 2) <= 0)
        below_collision = true;
    }
    if(right_collision)
    {
      location.x -= this.tank_speed;
      right_collision = false;
    }
    if(left_collision)
    {
      location.x += this.tank_speed;
      left_collision = false;
    }
    if(above_collision)
    {
      location.y += this.tank_speed;
      above_collision = false;
    }
    if(below_collision)
    {
      location.y -= this.tank_speed;
      below_collision = false;
    }

    //bullet collision with tank check
    for(int i = 0; i < bulletController.getBList().size(); i++)
    {
      if(dist(location.x, location.y, bulletController.getBList().get(i).getRealLocation().x, bulletController.getBList().get(i).getRealLocation().y) 
      <= this.tank_width / 2 + bulletController.getBList().get(i).bullet_width / 2
      && bulletController.getBList().get(i).player_bullet_collide_allowed)
      {
        this.tank_health -= bulletController.getBList().get(i).bullet_health;
        bulletController.removeBullet(bulletController.getBList().get(i));
        regeneration_cool_down = framerate * regeneration_kickin; //sets it so that the player cannot regenerate for a certain amount of time
      }
    }
    
    //passive regeneration
    if(tank_health < original_tank_health && regeneration_cool_down <= 0) //if below original health, regenerate specified amt every number of frames given by framecount
      tank_health += tank_health_regeneration / framerate;
    if(tank_health > original_tank_health) //set health to 100 percent if over 100 percent
      tank_health = original_tank_health;
  }
  
  public void updatePosition()
  {
     PVector direction = new PVector(0, 0);
    if(move_left)
      direction.x = -1;
    if(move_right)
      direction.x = 1;
    if(move_up)
      direction.y = -1;
    if(move_down)
      direction.y = 1;
 
    velocity = new PVector(this.tank_speed * direction.x, this.tank_speed * direction.y);  
      location.add(velocity);
  }
  
  public void renderTank()
  {
    renderBody();
    renderTurret();
    renderHealthBar();
  }
  
  private void renderBody()
  {
    
    //body rendering
    pushMatrix();
    translate(location.x, location.y);
    if ((move_up || move_down) && !move_left && !move_right)
    {
      orientation_updown = true;
      orientation_leftright = false;
      orientation_upright = false;
      orientation_upleft = false;
    }
    if ((move_left || move_right) && !move_up && !move_down)
    {
      orientation_updown = false;
      orientation_leftright = true;
      orientation_upright = false;
      orientation_upleft = false;
    }
        if (move_up && move_right || move_down && move_left)
    {
      orientation_updown = false;
      orientation_leftright = false;
      orientation_upright = true;
      orientation_upleft = false;
    }
    if (move_up && move_left || move_down && move_right)
    {
      orientation_updown = false;
      orientation_leftright = false;
      orientation_upright = false;
      orientation_upleft = true;
    }
    
    if(orientation_updown)
      rotate(atan2(1, 0));
    if(orientation_leftright)
      rotate(atan2(0, 1));
    if(orientation_upright)
      rotate(atan2(-1, 1));
    if(orientation_upleft)
      rotate(atan2(1, 1));
    fill(this.tank_color[0], this.tank_color[1], this.tank_color[2]);
    stroke(this.tank_outline_color[0], this.tank_outline_color[1], this.tank_outline_color[2]);
    strokeWeight(this.tank_stroke_weight);
    ellipse(0, 0, this.tank_width, this.tank_height);
    popMatrix();
  }
  
  private void renderTurret()
  {
    //turret rendering
    pushMatrix();
    translate(location.x, location.y);
    rotate(atan2(mouseY - location.y, mouseX - location.x));
    fill(this.turret_color[0], this.turret_color[1], this.turret_color[2]);
    stroke(this.turret_outline_color[0], this.turret_outline_color[1], this.turret_outline_color[2]);
    strokeWeight(this.turret_stroke_weight);
    rect(0,0 - (turret_cir_height) * 1/2, turret_rec_width, turret_rec_height);
    ellipse(0, 0, turret_cir_width, turret_cir_height);
    popMatrix();
  }
  
  private void renderHealthBar()
  {
    pushMatrix();
    translate(location.x, location.y);
    stroke(0, 0, 0);
    fill(0, 0, 0);
    strokeWeight(5);
    rect( -(this.tank_width) * 1/2, -(this.tank_height) * 2/3, this.tank_width, 10);//renders the red bar first
    fill(0, 255, 0);
    stroke(0, 0, 0, 0); //4th parameter sets opacity at 0
    rect( -(this.tank_width) * 1/2, -(this.tank_height) * 2/3, this.tank_width * (tank_health / original_tank_health), 10);//renders the green bar and overlaps
    popMatrix();
  }
  
  public void shootCheck()
  {
    if(tempTickCount % (int)(bullet_frequency * framerate / 80) == 0 && shoot_input)//regulates how fast player can shoot
      {
          myTank.shoot();
          shot_cool_down = (int)(bullet_frequency * framerate / 80);
      }
    if(shot_cool_down > 0)//counts the counter down for a "reload" of the next shot
      shot_cool_down--;
    if(shot_cool_down == 0 && !shoot_input)//Resets the counter if the player stops shooting and the counter is over counting (prevents re-clicking to get faster shooting)
        tempTickCount = 0;
  }
  
  public void shoot()
  {
    bulletController.addBullet(new Bullet(
    /*Number of collisions*/ 0, 
    bullet_size, 
    bullet_speed, 
    bullet_health,
    /*Number of times bullets bounce*/num_bullet_bounce,
    /*spawnpoint x*/ location.x, 
    /*spawnpoint y*/ location.y, 
    /*Direction of Bullet*/ getDirection(), 
    /*spawn distance from center of rotation*/ getTurretLength() + bullet_spawn_from_length, 
    /*player_shot_collision_with_body allowed*/ player_shot_collision_with_body_allowed, 
    /*enemy_shot_collision_with_body allowed*/ enemy_shot_collision_with_body_allowed, 
    /*player_bullet_collide allowed*/ player_bullet_collide_allowed, 
    /*enemy_bullet_collide allowed*/ enemy_bullet_collide_allowed, 
    /*collision_bullet_with_wall_allowed*/ collision_bullet_with_wall_allowed,
    /*Bullet color...*/ this.tank_color[0], this.tank_color[1], this.tank_color[2],
    /*Bullet outline color...*/ this.turret_color[0], this.turret_color[1], this.turret_color[2]));
    
    //shot_sound.play();
  }
  
  public void updateCollisionPermissions(boolean a, boolean b, boolean c, boolean d, boolean e, boolean f)
  {
    player_shot_collision_with_body_allowed = a;
    enemy_shot_collision_with_body_allowed = b;
    player_bullet_collide_allowed = c;
    enemy_bullet_collide_allowed = d;
    collision_bullet_with_wall_allowed = e;
    collision_body_with_wall_allowed = f;
  }
  
  public void setTurretSize(float tank_width, float tank_height)
  {
    this.turret_cir_width = width * tank_width / 1920 * 1/3;
    this.turret_cir_height = height * tank_height / 1080 * 1/3;
    this.turret_rec_width = width * tank_width / 1920 * 2/5 ;
    this.turret_rec_height = height * tank_height / 1080 * 1/3;
  }
  
  public void setSpawn(float spawnX, float spawnY)
  {
    location = new PVector(spawnX, spawnY);
  }
  
  public void setTankHealthNegative()
  {
    tank_health = -1;
  }
  
  public void resetTank()
  {
    tank_health = original_tank_health;
    location = new PVector(spawn_x, spawn_y);
  }
  
  public void setBulletSpawnFromLength(int extra_distance)
  {
    bullet_spawn_from_length = extra_distance;
  }
  
  public float getDirection()
  {
    return atan2(mouseY - location.y, mouseX - location.x) - (float)Math.PI / 2;

  }
  
  public float getTurretLength()
  {
    return turret_rec_width;
  }
  
  
  
  public void addTankSpeed(float percent_speed_increase)
  {
    tank_speed *= 1 + percent_speed_increase / 100;
    velocity = new PVector(width * tank_speed / 1920, height * tank_speed / 1080);
  }  
  
  public void addTankHealth(float health_increase)
  {
    original_tank_health += health_increase;
  }
  
  public void addBulletSpeed(float speed_increase)
  {
    bullet_speed += speed_increase;
  }
  
  public void addBulletPenetration(float health_increase)
  {
    bullet_health += health_increase;
  }
  
  public void addBulletSize(float size_increase)
  {
    bullet_size += size_increase;
  }
  
  public void increaseBulletFrequency(int ticks)
  {
    bullet_frequency += ticks;
  }
  
  public void addBulletBounce(int num_bullet_bounce)
  {
    this.num_bullet_bounce += num_bullet_bounce;
  }
}
