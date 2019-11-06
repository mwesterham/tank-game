class EnemyTank
{
  private float[] position = {0, 0};
  boolean orientation_updown = false;
  boolean orientation_leftright = true;
  boolean orientation_upright = false;
  boolean orientation_upleft = false;
  private float tank_speed;
  private boolean right_collision = false;
  private boolean left_collision = false;
  private boolean above_collision = false;
  private boolean below_collision = false;
  
  private float tank_width;
  private float tank_height;
  private float turret_cir_width;
  private float turret_cir_height;
  private float turret_rec_width;
  private float turret_rec_height;
  private int[] tank_color = {0, 255, 123};
  private int[] turret_color = {0, 0, 0};
  private int[] tank_outline_color = {0, 255, 123};
  private float right_collision_dist;
  private float left_collision_dist;
  private float above_collision_dist;
  private float below_collision_dist;
  
  private float bullet_size;
  private float bullet_speed;
  private float target_position_x;
  private float target_position_y;
  
  public EnemyTank(float tank_width, float tank_height, float tank_speed, float bullet_size, float bullet_speed, float spawnX, float spawnY)
  {
    this.position[0] = spawnX;
    this.position[1] = spawnY;
    this.tank_width = tank_width;
    this.tank_height = tank_height;
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
  }
  
  public void updatePosition()
  {
    //ellipse(mouseX, mouseY, tank_diameter, tank_diameter);
    
    collisionCheck();
    if(right_collision)
    {
      position[0] -= tank_speed;
      right_collision = false;
    }
    if(left_collision)
    {
      position[0] += tank_speed;
      left_collision = false;
    }
    if(above_collision)
    {
      position[1] += tank_speed;
      above_collision = false;
    }
    if(below_collision)
    {
      position[1] -= tank_speed;
      below_collision = false;
    }
    position[0] += tank_speed;
    position[1] += tank_speed;

    
  }
  
  private void collisionCheck()
  {
    //do not do World myWorld = new World(6) here, it already sees it from the TankGame file
    for(int i = 0; i < myWorld.getNumWalls(); i++) //loops through all of the walls
    {
    //vertical wall check right_collision
      if ((myWorld.getWalls()[i][0]) - (position[0] + right_collision_dist) <= 0 //scans if the collision box overlaps with a rectangle along a vertical line
      && (myWorld.getWalls()[i][0]) - (position[0]) >= 0 //Makes sure that this collision box does not affect the other side of the box
      && (position[1] - above_collision_dist) - (myWorld.getWalls()[i][1] + myWorld.getWalls()[i][3]) <= 0 //makes sure that the tank is within the right vertical segment of the rectangle
      && (position[1] + below_collision_dist) - (myWorld.getWalls()[i][1]) >= 0 //makes sure that the tank is within the right vertical segment of the rectangle
      || (1900) - (position[0] + right_collision_dist / 2) <= 0) //makes sure the tank cannot go off-screen
        right_collision = true;
    
    //vertical wall check left_collision
      if ((myWorld.getWalls()[i][0] + myWorld.getWalls()[i][2]) - (position[0] - left_collision_dist) >= 0 
      && (myWorld.getWalls()[i][0] + myWorld.getWalls()[i][2]) - (position[0]) <= 0
      && (position[1] - above_collision_dist) - (myWorld.getWalls()[i][1] + myWorld.getWalls()[i][3]) <= 0 
      && (position[1] + below_collision_dist) - (myWorld.getWalls()[i][1]) >= 0
      || (position[0] - left_collision_dist / 2) <= 0)
        left_collision = true;
    
    //horizontal wall check above_collision
      if ((myWorld.getWalls()[i][1] + myWorld.getWalls()[i][3]) - (position[1] - above_collision_dist) >= 0 
      && (myWorld.getWalls()[i][1] + myWorld.getWalls()[i][3]) - (position[1]) <= 0
      && (position[0] - left_collision_dist) - (myWorld.getWalls()[i][0] + myWorld.getWalls()[i][2]) <= 0 
      && (position[0] + right_collision_dist) - (myWorld.getWalls()[i][0]) >= 0
      || (position[1] - tank_height / 2) <= 0)
        above_collision = true;
    
    //horizontal wall check below_collision
      if ((myWorld.getWalls()[i][1]) - (position[1] + below_collision_dist) <= 0 
      && (myWorld.getWalls()[i][1]) - (position[1]) >= 0
      && (position[0] - left_collision_dist) - (myWorld.getWalls()[i][0] + myWorld.getWalls()[i][2]) <= 0 
      && (position[0] + right_collision_dist) - (myWorld.getWalls()[i][0]) >= 0
      || (900) - (position[1] + tank_height / 2) <= 0)
        below_collision = true;
    }
    
    //bullet collision with tank check
    for(int i = 0; i < myController.getBList().size(); i++)
    {
      if(dist(position[0], position[1], myController.getBList().get(i).getRealPosition()[0], myController.getBList().get(i).getRealPosition()[1]) 
      <= tank_width / 2 + myController.getBList().get(i).getSize() / 2
      && myController.getBList().get(i).enemyCollision())
        myController.removeBullet(myController.getBList().get(i));
    }
  }

  public void renderTank(float aim_x, float aim_y)
  {
    this.target_position_x = aim_x;
    this.target_position_y = aim_y;
    
    stroke(tank_outline_color[0], tank_outline_color[1], tank_outline_color[2]);
    //body render call
    renderBody();
    //turret render call
    renderTurret(aim_x, aim_y);
  }
  
  private void renderBody()
  {
    //body rendering
    pushMatrix();
    translate(position[0], position[1]);
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
    stroke(tank_color[0], tank_color[1], tank_color[2]);
    ellipse(0, 0, tank_width, tank_height);
    popMatrix();
  }
  
  private void renderTurret(float target_x, float target_y)
  {
    
    //turret rendering
    pushMatrix();
    translate(position[0], position[1]);
    rotate(atan2(target_y - position[1], target_x - position[0]));
    fill(turret_color[0], turret_color[1], turret_color[2]);
    rect(0,0 - (turret_cir_height) * 1/2, turret_rec_width, turret_rec_height);
    ellipse(0, 0, turret_cir_width, turret_cir_height);
    popMatrix();
  }
  
  public void shoot()
  {
    myController.addBullet(new Bullet(
    /*Number of collisions*/ 0, 
    bullet_size, 
    bullet_speed, 
    /*spawnpoint x*/ getPosition()[0], 
    /*spawnpoint y*/ getPosition()[1], 
    /*Direction of Bullet*/ getDirection(), 
    /*spawn distance from center of rotation*/ getTurretLength(), 
    /*player_shot_collision_with_body allowed*/ true, 
    /*enemy_shot_collision_with_body allowed*/ false, 
    /*player_bullet_collide allowed*/ true, 
    /*enemy_bullet_collide allowed*/ false, 
    /*Bullet color...*/ turret_color[0], turret_color[1], turret_color[2], 
    /*Bullet outline color...*/ tank_color[0], tank_color[1], tank_color[2]));
    
    //(number of collisions occured, size, speed, spawnpoint x, spawnpoint y, direction of shot, spawn distance from center, player_shot_collision_with_body allowed, enemy_shot_collision_with_body allowed, player_bullet_collide allowed, enemy_bullet_collide_allowed, bullet_color_red, bullet_color_green, bullet_color_blue, outline_color_red, outline_color_green, outline_color_blue)
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
  
  public float getDirection()
  {
    return -atan2(target_position_x - position[0], target_position_y - position[1]);
  }
  
  public float[] getPosition()
  {
    return position;
  }
  
  public float getTurretLength()
  {
    return turret_rec_width;
  }
}
