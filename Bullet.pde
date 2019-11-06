class Bullet
{
  private float bullet_width;
  private float bullet_height;
  private int[] bullet_color = {0, 0, 0};
  private int[] bullet_outline_color = {0, 0, 0};
  
  private float spawn_x;
  private float spawn_y;
  private float[] bullet_position = {0, 0};
  private float[] bullet_real_position = {0, 0};
  private float bullet_speed;
  private float bullet_direction;
  
  private float turret_length;
  private boolean player_collision_allowed;
  private boolean enemy_collision_allowed;
  private boolean player_bullet_collide_allowed;
  private boolean enemy_bullet_collide_allowed;
  
  private boolean right_wall_collision;
  private boolean left_wall_collision;
  private boolean above_wall_collision;
  private boolean below_wall_collision;
  private int number_of_collisions;
  
  public Bullet(int number_of_collisions, float size, float speed, float spawn_x, float spawn_y, float direction, float turret_length, boolean player_collision_allowed, boolean enemy_collision_allowed, boolean player_bullet_collide_allowed, boolean enemy_bullet_collide_allowed, int bullet_color_red, int bullet_color_green, int bullet_color_blue, int outline_color_red, int outline_color_green, int outline_color_blue)
  {
    this.bullet_width = size;
    this.bullet_height = size;
    this.bullet_color[0] = bullet_color_red;
    this.bullet_color[1] = bullet_color_green;
    this.bullet_color[2] = bullet_color_blue;
    this.bullet_outline_color[0] = outline_color_red;
    this.bullet_outline_color[1] = outline_color_green;
    this.bullet_outline_color[2] = outline_color_blue;
    
    this.bullet_speed = speed;
    this.spawn_x = spawn_x;
    this.spawn_y = spawn_y;
    this.bullet_position[0] = 0;
    this.bullet_position[1] = 0;
    this.bullet_direction = direction;
    
    this.turret_length = turret_length;
    this.player_collision_allowed = player_collision_allowed;
    this.enemy_collision_allowed = enemy_collision_allowed;
    this.player_bullet_collide_allowed = player_bullet_collide_allowed;
    this.enemy_bullet_collide_allowed = enemy_bullet_collide_allowed;
    
    this.right_wall_collision = false;
    this.left_wall_collision = false;
    this.above_wall_collision = false;
    this.below_wall_collision = false;
    this.number_of_collisions = number_of_collisions;
  }
  
  public void renderBullet()
  {
    //bullet rendering
    pushMatrix();
    translate(spawn_x, spawn_y);
    rotate(bullet_direction);
    translate(0, turret_length + bullet_height * 4 / 7);
    fill(bullet_color[0], bullet_color[1], bullet_color[2]);
    stroke(bullet_outline_color[0], bullet_outline_color[1], bullet_outline_color[2]);
    ellipse(bullet_position[0], bullet_position[1], bullet_width, bullet_height);
    popMatrix();
  }
  
  public void updatePosition()
  {
    this.bullet_position[1] += this.bullet_speed;
  }
  
  public void updateBulletSpeedDirection()
  {    
      this.bullet_speed = 0;
      
//      myController.addBullet(new Bullet(
//      /*Number of collisions*/getNumOfCollisions(), 
//      myTank.bullet_size, 
//      myTank.bullet_speed, 
//      /*spawnpoint x*/getRealPosition()[0], 
//      /*spawnpoint y*/getRealPosition()[1], 
//      /*Direction of Bullet*/3.14159/2, 
//      /*spawn distance from center of rotation*/ getSpeed(), 
//      /*player_shot_collision_with_body allowed*/false, 
//      /*enemy_shot_collision_with_body allowed*/true, 
//      /*player_bullet_collide allowed*/false, 
//      /*enemy_bullet_collide allowed*/true, 
//      /*Bullet color...*/myTank.turret_color[0], myTank.turret_color[1], myTank.turret_color[2], 
//      /*Bullet outline color...*/myTank.tank_color[0], myTank.tank_color[1], myTank.tank_color[2]));
      
      //(size, speed, spawnpoint x, spawnpoint y, direction of shot, spawn distance from center, player_shot_collision_with_body allowed, enemy_shot_collision_with_body allowed, player_bullet_collide allowed, enemy_bullet_collide allowed, bullet_color_red, bullet_color_green, bullet_color_blue, outline_color_red, outline_color_green, outline_color_blue)
      
  }

  public void calcRealPosition()
  {
    bullet_real_position[0] = (bullet_position[1] + turret_length) * cos(bullet_direction + (float) Math.PI / 2) + spawn_x;
    bullet_real_position[1] = (bullet_position[1] + turret_length) * sin(bullet_direction + (float) Math.PI / 2) + spawn_y;
  }
  
  public void rightWallCollisionTrue()
  {
      right_wall_collision = true;
  }
 public boolean rightWallCollision()
 {
   return right_wall_collision;
 }
  
  public void rightWallCollisionFalse()
  {
      right_wall_collision = false;
  }
  
  public void leftWallCollisionTrue()
  {
      left_wall_collision = true;
  }
  
  public void leftWallCollisionFalse()
  {
      left_wall_collision = false;
  }
  
  public void aboveWallCollisionTrue()
  {
      above_wall_collision = true;
  }
  
  public void aboveWallCollisionFalse()
  {
      above_wall_collision = false;
  }
  
  public void belowWallCollisionTrue()
  {
      below_wall_collision = true;
  }
  
  public void belowWallCollisionFalse()
  {
      below_wall_collision = false;
  }
  
  public void addCollisionToCount()
  {
    number_of_collisions += 1;
  }
  
  public int getNumOfCollisions()
  {
    return number_of_collisions;
  }

  public float[] getRealPosition()
  {
    calcRealPosition();
    return bullet_real_position;
  }
  
  public boolean playerCollision()
  {
    return player_collision_allowed;
  }

  public boolean enemyCollision()
  {
    return enemy_collision_allowed;
  }
  
  public boolean playerBulletCollision()
  {
    return player_bullet_collide_allowed;
  }
  
  public boolean enemyBulletCollision()
  {
    return enemy_bullet_collide_allowed;
  }
  
  public float getSize()
  {
    return bullet_width;
  }
  
  public float getSpeed()
  {
     return bullet_speed; 
  }
}
