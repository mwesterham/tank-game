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
  
  public Bullet(float size, float speed, float spawn_x, float spawn_y, float direction, float turret_length, boolean player_collision_allowed, boolean enemy_collision_allowed, boolean player_bullet_collide_allowed, boolean enemy_bullet_collide_allowed, int bullet_color_red, int bullet_color_green, int bullet_color_blue, int outline_color_red, int outline_color_green, int outline_color_blue)
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

  public void calcRealPosition()
  {
    bullet_real_position[0] = (bullet_position[1] + turret_length) * cos(bullet_direction + (float) Math.PI / 2) + spawn_x;
    bullet_real_position[1] = (bullet_position[1] + turret_length) * sin(bullet_direction + (float) Math.PI / 2) + spawn_y;
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
