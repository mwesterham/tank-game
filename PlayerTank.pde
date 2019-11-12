class PlayerTank
{
  private PVector location;
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
  private float tank_width;
  private float tank_height;
  private float turret_cir_width;
  private float turret_cir_height;
  private float turret_rec_width;
  private float turret_rec_height;
  private int[] tank_color = {0, 0, 255};
  private int[] turret_color = {255, 0, 0};
  private int[] tank_outline_color = {0, 0, 0};
  private float right_collision_dist;
  private float left_collision_dist;
  private float above_collision_dist;
  private float below_collision_dist;
  
  private float bullet_size;
  private float bullet_speed;
  private float bullet_health;
  private int bullet_frequency;
  private int num_bullet_bounce;
  private int shot_cool_down = 0;
  private int tempTickCount = 0;
  
  public PlayerTank(
  float tank_width, 
  float tank_height, 
  float tank_health,
  float tank_speed, 
  float bullet_size, 
  float bullet_speed, 
  float bullet_health, 
  int bullet_frequency, 
  int num_bullet_bounce, 
  float spawnX, float spawnY)
  {
    location = new PVector(spawnX, spawnY);
    this.tank_width = tank_width;
    this.tank_height = tank_height;
    this.original_tank_health = tank_health;
    this.tank_health = tank_health;
    this.bullet_health = bullet_health;
    velocity = new PVector(tank_speed, tank_speed);
    this.tank_speed = tank_speed;
    
    this.turret_cir_width = tank_width * 1/3;
    this.turret_cir_height = tank_height * 1/3;
    this.turret_rec_width = tank_width * 2/5 ;
    this.turret_rec_height = tank_height * 1/3;
    this.right_collision_dist = tank_width * sqrt(2) / 4; //distance from middle of tank to the right 
    this.left_collision_dist = tank_width * sqrt(2) / 4; //distance from middle of tank to the left
    this.above_collision_dist = tank_width * sqrt(2) / 4; //distance from middle of tank to above
    this.below_collision_dist = tank_width * sqrt(2) / 4; //distance from middle of tank to below
    this.bullet_size = bullet_size;
    this.bullet_speed = bullet_speed;
    this.bullet_frequency = bullet_frequency;
    this.num_bullet_bounce = num_bullet_bounce;
  }
  
  public void update()
  {
    collisionCheck();    
    updatePosition();
    shootCheck();
    if(shoot_input)
      tempTickCount++;

    
  }
  
  private void collisionCheck()
  {
    //do not do World myWorld = new World(6) here, it already sees it from the TankGame file
    for(int i = 0; i < myWorld.getNumWalls(); i++) //loops through all of the walls
    {
    //vertical wall check right_collision
      if ((myWorld.getWalls()[i][0]) - (location.x + right_collision_dist) <= 0 //scans if the collision box overlaps with a rectangle along a vertical line
      && (myWorld.getWalls()[i][0]) - (location.x) >= 0 //Makes sure that this collision box does not affect the other side of the box
      && (location.y - above_collision_dist) - (myWorld.getWalls()[i][1] + myWorld.getWalls()[i][3]) <= 0 //makes sure that the tank is within the right vertical segment of the rectangle
      && (location.y + below_collision_dist) - (myWorld.getWalls()[i][1]) >= 0 //makes sure that the tank is within the right vertical segment of the rectangle
      || (1900) - (location.x + right_collision_dist / 2) <= 0) //makes sure the tank cannot go off-screen
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
      || (location.y - tank_height / 2) <= 0)
        above_collision = true;
    
    //horizontal wall check below_collision
      if ((myWorld.getWalls()[i][1]) - (location.y + below_collision_dist) <= 0 
      && (myWorld.getWalls()[i][1]) - (location.y) >= 0
      && (location.x - left_collision_dist) - (myWorld.getWalls()[i][0] + myWorld.getWalls()[i][2]) <= 0 
      && (location.x + right_collision_dist) - (myWorld.getWalls()[i][0]) >= 0
      || (900) - (location.y + tank_height / 2) <= 0)
        below_collision = true;
    }
    
    if(right_collision)
    {
      location.x -= tank_speed;
      right_collision = false;
    }
    if(left_collision)
    {
      location.x += tank_speed;
      left_collision = false;
    }
    if(above_collision)
    {
      location.y += tank_speed;
      above_collision = false;
    }
    if(below_collision)
    {
      location.y -= tank_speed;
      below_collision = false;
    }

    //bullet collision with tank check
    for(int i = 0; i < bulletController.getBList().size(); i++)
    {
      if(dist(location.x, location.y, bulletController.getBList().get(i).getPosition().x, bulletController.getBList().get(i).getPosition().y) 
      <= tank_width / 2 + bulletController.getBList().get(i).getSize() / 2
      && bulletController.getBList().get(i).playerCollision())
      {
        this.tank_health -= bulletController.getBList().get(i).getHealth();
        bulletController.removeBullet(bulletController.getBList().get(i));
      }
    }
  }
  
  public void updatePosition()
  {
    if(move_left)
      location.x -= velocity.x;
    if(move_right)
      location.x += velocity.x;
    if(move_up)
      location.y -= velocity.y;
    if(move_down)
      location.y += velocity.y;
  }
  
  public void renderTank()
  {
    stroke(tank_outline_color[0],tank_outline_color[1], tank_outline_color[0]);
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
    fill(tank_color[0], tank_color[1], tank_color[2]);
    stroke(0, 0, 0);
    ellipse(0, 0, tank_width, tank_height);
    popMatrix();
  }
  
  private void renderTurret()
  {
    //turret rendering
    pushMatrix();
    translate(location.x, location.y);
    rotate(atan2(mouseY - location.y, mouseX - location.x));
    fill(turret_color[0], turret_color[1], turret_color[2]);
    rect(0,0 - (turret_cir_height) * 1/2, turret_rec_width, turret_rec_height);
    ellipse(0, 0, turret_cir_width, turret_cir_height);
    popMatrix();
  }
  
  private void renderHealthBar()
  {
    pushMatrix();
    translate(location.x, location.y);
    stroke(0, 0, 0);
    fill(255, 0, 0);
    rect( -(tank_width) * 1/2, -(tank_height) * 2/3, tank_width, 10);//renders the red bar first
    fill(0, 255, 0);
    stroke(0, 0, 0, 0); //4th parameter sets opacity at 0
    rect( -(tank_width) * 1/2, -(tank_height) * 2/3, tank_width * (tank_health / original_tank_health), 10);//renders the red bar and overlaps
    popMatrix();
  }
  
  public void shootCheck()
  {
    if(tempTickCount % bullet_frequency == 0 && shoot_input)//regulates how fast player can shoot
      {
          myTank.shoot();
          shot_cool_down = bullet_frequency;
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
    /*spawn distance from center of rotation*/ getTurretLength(), 
    /*player_shot_collision_with_body allowed*/ false, 
    /*enemy_shot_collision_with_body allowed*/ true, 
    /*player_bullet_collide allowed*/ false, 
    /*enemy_bullet_collide allowed*/ true, 
    /*Bullet color...*/ turret_color[0], turret_color[1], turret_color[2], 
    /*Bullet outline color...*/ tank_color[0], tank_color[1], tank_color[2]));
  }
  
  public void setTurretSize(float tank_width, float tank_height)
  {
    this.turret_cir_width = tank_width * 1/3;
    this.turret_cir_height = tank_height * 1/3;
    this.turret_rec_width = tank_width * 2/5 ;
    this.turret_rec_height = tank_height * 1/3;
  }
  
  public void setTankColor(int red, int green, int blue)
  {
    this.tank_color[0] = red;
    this.tank_color[1] = green;
    this.tank_color[2] = blue;
  }
  
  public void setTurretColor(int red, int green, int blue)
  {
    this.turret_color[0] = red;
    this.turret_color[1] = green;
    this.turret_color[2] = blue;
  }
  
  public PVector getPosition()
  {
    return location;
  }
  
  public float getDirection()
  {
    return atan2(mouseY - location.y, mouseX - location.x) - (float)Math.PI / 2;

  }
  
  public float getSpeed()
  {
    return tank_speed; 
  }
  
  public float getTurretLength()
  {
    return turret_rec_width;
  }
}
