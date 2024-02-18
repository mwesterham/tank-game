class Bullet
{
  private float bullet_width;
  private float bullet_height;
  private float original_bullet_health;
  private float bullet_health;
  private int num_bullet_bounce;
  private int[] bullet_color = {0, 0, 0};
  private int[] bullet_outline_color = {0, 0, 0};
  
  private PVector location;
  private float turret_length;
  private float bullet_speed;
  private PVector velocity;
  private float bullet_direction;
  
  private boolean player_collision_allowed;
  private boolean enemy_collision_allowed;
  private boolean player_bullet_collide_allowed;
  private boolean enemy_bullet_collide_allowed;
  private boolean collision_bullet_with_wall_allowed;
  
  private boolean right_wall_collision;
  private boolean left_wall_collision;
  private boolean above_wall_collision;
  private boolean below_wall_collision;
  
  private int number_of_collisions;
  
  private boolean has_been_scanned = false;
  
  public Bullet(
  int number_of_collisions, 
  float size, 
  float speed, 
  float bullet_health, 
  int num_bullet_bounce, 
  float spawn_x, float spawn_y, 
  float direction, 
  float turret_length, 
  boolean player_collision_allowed, 
  boolean enemy_collision_allowed, 
  boolean player_bullet_collide_allowed, 
  boolean enemy_bullet_collide_allowed, 
  boolean collision_bullet_with_wall_allowed, 
  int bullet_color_red, int bullet_color_green, int bullet_color_blue, 
  int outline_color_red, int outline_color_green, int outline_color_blue)
  {
    this.bullet_width = width * size /1920;
    this.bullet_height = height * size / 1080;
    this.original_bullet_health = bullet_health;
    this.bullet_health = bullet_health;
    this.num_bullet_bounce = num_bullet_bounce;
    this.bullet_color[0] = bullet_color_red;
    this.bullet_color[1] = bullet_color_green;
    this.bullet_color[2] = bullet_color_blue;
    this.bullet_outline_color[0] = outline_color_red;
    this.bullet_outline_color[1] = outline_color_green;
    this.bullet_outline_color[2] = outline_color_blue;
    
    this.bullet_speed = speed * 80 / framerate;
    velocity = new PVector(width * bullet_speed / 1920 * sin(-direction), height * bullet_speed / 1080 * cos(direction));
    location = new PVector(spawn_x, spawn_y);
    this.turret_length = turret_length;
    
    this.bullet_direction = direction;
    
    this.player_collision_allowed = player_collision_allowed;
    this.enemy_collision_allowed = enemy_collision_allowed;
    this.player_bullet_collide_allowed = player_bullet_collide_allowed;
    this.enemy_bullet_collide_allowed = enemy_bullet_collide_allowed;
    this.collision_bullet_with_wall_allowed = collision_bullet_with_wall_allowed;
    
    this.right_wall_collision = false;
    this.left_wall_collision = false;
    this.above_wall_collision = false;
    this.below_wall_collision = false;
    this.number_of_collisions = number_of_collisions;
  }
  
  public void renderBullet()
  {
    //bullet rendering
    fill(bullet_color[0], bullet_color[1], bullet_color[2]);
    stroke(0, 0, 0);
    strokeWeight(3);
    ellipse(location.x + width * turret_length / 1920 * sin(-bullet_direction), location.y + height * turret_length / 1080 * cos(bullet_direction), bullet_width, bullet_height);
    //renderHealthBar(); //used for debugging
  }
  
  private void renderHealthBar()
  {
    pushMatrix();
    translate(location.x, location.y + 10);
    stroke(0, 0, 0);
    fill(255, 0, 0);
    rect( -(bullet_width) * 1/2, -(bullet_height) * 2/3, bullet_width, 10);//renders the red bar first
    fill(0, 255, 0);
    stroke(0, 0, 0); //4th parameter sets opacity at 0
    rect( -(bullet_width) * 1/2, -(bullet_height) * 2/3, bullet_width * (bullet_health / original_bullet_health), 10);//renders the green bar and overlaps
    popMatrix();
  }
  
  public void updatePosition()
  {
    location.add(velocity);
  }
  
  public void updateBulletDirection()
  {    
    if(right_wall_collision || left_wall_collision)
      velocity.x *= -1;
    if(above_wall_collision || below_wall_collision)
      velocity.y *= -1;
  }
  
  public void updateBulletSpeed(int speed)
  {
    this.bullet_speed = speed;
    velocity = new PVector(width * bullet_speed / 1920 * sin(-bullet_direction), height * bullet_speed / 1080 * cos(bullet_direction));
  }
  
  public void bulletHealthMinus(float damage)
  {
    bullet_health -= damage;
  }
  
  public void prepDelete()
  {
    velocity.sub(velocity); //sets velocity to zero
    this.bullet_health = 0;
  }
  
  public PVector getRealLocation()
  {
    PVector realLocation = new PVector(location.x + width * turret_length / 1920 * sin(-bullet_direction), location.y + height * turret_length / 1080 * cos(bullet_direction));
    return realLocation;
  }
}
