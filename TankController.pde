import java.util.LinkedList;
class TankController
{
  private LinkedList<EnemyTank> enemies = new LinkedList<EnemyTank>();
  EnemyTank TempEnemyTank;
  EnemyAI AI;

  
  public TankController(int num_of_stand_still_enemies, int num_of_standard_enemies, int num_of_slow_strong_enemies, int num_boss1_enemies, int num_boss2_enemies)
  {
    Random rand = new Random();
    for(int i = 0; i < num_of_stand_still_enemies; i++)
      addNoMovingEnemy(rand.nextInt(width), rand.nextInt(height));
    
    for(int i = 0; i < num_of_standard_enemies; i++)
      addStandardEnemy(rand.nextInt(width), rand.nextInt(height));
    
    for(int i = 0; i < num_of_slow_strong_enemies; i++)
      addSlowStrongEnemy(rand.nextInt(width), rand.nextInt(height));
      
    for(int i = 0; i < num_boss1_enemies; i++)
      addBossEnemy1(rand.nextInt(width), rand.nextInt(height));
      
    for(int i = 0; i < num_boss2_enemies; i++)
      addBossEnemy2(rand.nextInt(width), rand.nextInt(height));
  }
  
  public TankController()
  {
    //doesn't spawn anything
  }
  
  public void update()
  {
    for(int i = 0; i < enemies.size(); i++)
    {
      Random rand = new Random();
      TempEnemyTank = enemies.get(i);
      AI = new EnemyAI(TempEnemyTank); //applies AI to the tank in the enemies list with new velocity
      
      if(tickCount % (int)(64 * framerate / 80) == 0 && rand.nextInt(3) == 0) //every 64 ticks give it a 1/3 chance of changing direction
      {
        PVector velocity_direction = new PVector(rand.nextInt(), rand.nextInt());
        velocity_direction.normalize();
        TempEnemyTank.setNewVelocityDirection(velocity_direction);
      }
      
      AI.targetVisibleCheck(); //checks if should shoot
      AI.updateAimLocation(); //updates the aiming location
      AI.updateVelocity(); //updates where the tank is gonna move next

      if (!AI.wall_collision_occured) //does not render the tank if it is inside of a wall
        TempEnemyTank.renderTank();
      TempEnemyTank.updatePosition(); //only updates position 
      
      AI.collisionCheck();


      TempEnemyTank.shot_cooldown--;
      if(AI.target_visible && TempEnemyTank.shot_cooldown <= 0)
      {  
        if(TempEnemyTank.AI_version == 1)
        {
          TempEnemyTank.pause--;
          if(TempEnemyTank.pause <= 0)
          {
            TempEnemyTank.shoot();
            TempEnemyTank.shot_cooldown = (int)(TempEnemyTank.bullet_frequency * framerate / 80);
          }
        }
        if(TempEnemyTank.AI_version == 2) //AI versioin two does not have a pause
        {
          TempEnemyTank.shoot();
          TempEnemyTank.shot_cooldown = (int)(TempEnemyTank.bullet_frequency * framerate / 80);
        }
      }
      if(!AI.target_visible)
        TempEnemyTank.pause = 6; //initial pause after seeing the target (hesitation), does not apply if target is in sight
      if(TempEnemyTank.tank_health <= 0)
      {
        removeEnemy(TempEnemyTank);
      }
    }
  }
  
  //STANDARD ENEMIES
  public void addDummyEnemy(float spawnX, float spawnY)
  {
    TempEnemyTank = new EnemyTank(
    /*tank_width*/100, //ratioed to screen resolution
    /*tank_height*/100, 
    /*tank_speed*/1, 
    /*tank_health*/3,
    /*bullet_size*/20, 
    /*bullet_speed*/4, 
    /*bullet_health/pentration/damage*/1,
    /*bullet frequency measured in ticks per shot*/ 36,
    /*number of times bullets bounce*/1,
    /*spawn_x*/spawnX, 
    /*spawn_y*/spawnY, 
    /*target_location_x*/myTank.location.x, 
    /*target_location_y*/myTank.location.y,
    /*Tank Color           r/g/b*/0, 0, 0,
    /*Tank Outline Color   r/g/b*/50, 40, 30,
    /*Tank Stroke Weight*/1,
    /*Turret Color         r/g/b*/0,0, 0,
    /*Turret Outline Color r/g/b*/70, 60, 50,
    /*Turret Stroke Weight*/1);

    TempEnemyTank.updateCollisionPermissions(
    /*player_shot_collision_with_body allowed*/ true, 
    /*enemy_shot_collision_with_body allowed*/ false, 
    /*player_bullet_collide allowed*/ true, 
    /*enemy_bullet_collide allowed*/ false,
    /*collision_bullet_with_wall_allowed*/ true,
    /*collision_body_with_wall_allowed*/ true);
    
    TempEnemyTank.setAIVersion(1);
    
    enemies.add(TempEnemyTank);
  }
  
  public void addNoMovingEnemy(float spawnX, float spawnY)
  {
    TempEnemyTank = new EnemyTank(
    /*tank_width*/75, 
    /*tank_height*/75, 
    /*tank_speed*/0, 
    /*tank_health*/3,
    /*bullet_size*/20, 
    /*bullet_speed*/3, 
    /*bullet_health/pentration/damage*/1.3,
    /*bullet frequency measured in ticks per shot*/ 100,
    /*number of times bullets bounce*/1,
    /*spawn_x*/spawnX, 
    /*spawn_y*/spawnY, 
    /*target_location_x*/myTank.location.x, 
    /*target_location_y*/myTank.location.y,
    /*Tank Color           r/g/b*/204, 57, 3,
    /*Tank Outline Color   r/g/b*/0, 0, 0,
    /*Tank Stroke Weight*/3,
    /*Turret Color         r/g/b*/0, 0, 0,//254, 57, 03,
    /*Turret Outline Color r/g/b*/0, 0, 0,
    /*Turret Stroke Weight*/2);

    TempEnemyTank.updateCollisionPermissions(
    /*player_shot_collision_with_body allowed*/ true, 
    /*enemy_shot_collision_with_body allowed*/ false, 
    /*player_bullet_collide allowed*/ true, 
    /*enemy_bullet_collide allowed*/ false,
    /*collision_bullet_with_wall_allowed*/ true,
    /*collision_body_with_wall_allowed*/ true);
    
    TempEnemyTank.setAIVersion(1);    
    
    enemies.add(TempEnemyTank);
  }  

  public void addStandardEnemy(float spawnX, float spawnY)
  {
    TempEnemyTank = new EnemyTank(
    /*tank_width*/75, 
    /*tank_height*/68, 
    /*tank_speed*/1, 
    /*tank_health*/3,
    /*bullet_size*/20, 
    /*bullet_speed*/3, 
    /*bullet_health/pentration/damage*/1.1,
    /*bullet frequency measured in ticks per shot*/ 64,
    /*number of times bullets bounce*/1,
    /*spawn_x*/spawnX, 
    /*spawn_y*/spawnY, 
    /*target_location_x*/myTank.location.x, 
    /*target_location_y*/myTank.location.y,
    /*Tank Color           r/g/b*/254, 117, 33,
    /*Tank Outline Color   r/g/b*/0, 0, 0,
    /*Tank Stroke Weight*/3,
    /*Turret Color         r/g/b*/0, 0, 0, //254, 57, 03,
    /*Turret Outline Color r/g/b*/0, 0, 0,
    /*Turret Stroke Weight*/2);
    
    TempEnemyTank.updateCollisionPermissions(
    /*player_shot_collision_with_body allowed*/ true, 
    /*enemy_shot_collision_with_body allowed*/ false, 
    /*player_bullet_collide allowed*/ true, 
    /*enemy_bullet_collide allowed*/ false,
    /*collision_bullet_with_wall_allowed*/ true,
    /*collision_body_with_wall_allowed*/ true);
    
    TempEnemyTank.setAIVersion(1);    
    
    enemies.add(TempEnemyTank);
  }
  
  public void addSlowStrongEnemy(float spawnX, float spawnY)
  {
    TempEnemyTank = new EnemyTank(
    /*tank_width*/100, 
    /*tank_height*/100, 
    /*tank_speed*/.5, 
    /*tank_health*/5,
    /*bullet_size*/40, 
    /*bullet_speed*/2, 
    /*bullet_health/pentration/damage*/3.3,
    /*bullet frequency measured in ticks per shot*/ 100,
    /*number of times bullets bounce*/0,
    /*spawn_x*/spawnX, 
    /*spawn_y*/spawnY, 
    /*target_location_x*/myTank.location.x, 
    /*target_location_y*/myTank.location.y,
    /*Tank Color           r/g/b*/242, 26, 29,
    /*Tank Outline Color   r/g/b*/0, 0, 0,
    /*Tank Stroke Weight*/5,
    /*Turret Color         r/g/b*/0, 0, 0,//212, 26, 29,
    /*Turret Outline Color r/g/b*/0, 0, 0,
    /*Turret Stroke Weight*/5);
    
    TempEnemyTank.updateCollisionPermissions(
    /*player_shot_collision_with_body allowed*/ true, 
    /*enemy_shot_collision_with_body allowed*/ false, 
    /*player_bullet_collide allowed*/ true, 
    /*enemy_bullet_collide allowed*/ false,
    /*collision_bullet_with_wall_allowed*/ true,
    /*collision_body_with_wall_allowed*/ true);
    
    TempEnemyTank.setAIVersion(1);    
    
    enemies.add(TempEnemyTank);
  }
  
  public void addSniperEnemy(float spawnX, float spawnY)
  {
    TempEnemyTank = new EnemyTank(
    /*tank_width*/70, 
    /*tank_height*/63, 
    /*tank_speed*/.3, 
    /*tank_health*/2,
    /*bullet_size*/15, 
    /*bullet_speed*/6, 
    /*bullet_health/pentration/damage*/2.5,
    /*bullet frequency measured in ticks per shot*/ 120,
    /*number of times bullets bounce*/0,
    /*spawn_x*/spawnX, 
    /*spawn_y*/spawnY, 
    /*target_location_x*/myTank.location.x, 
    /*target_location_y*/myTank.location.y,
    /*Tank Color           r/g/b*/255, 153, 255,
    /*Tank Outline Color   r/g/b*/0, 0, 0,
    /*Tank Stroke Weight*/3,
    /*Turret Color         r/g/b*/0, 0, 0,
    /*Turret Outline Color r/g/b*/0, 0, 0,
    /*Turret Stroke Weight*/2);
    
    TempEnemyTank.updateCollisionPermissions(
    /*player_shot_collision_with_body allowed*/ true, 
    /*enemy_shot_collision_with_body allowed*/ false, 
    /*player_bullet_collide allowed*/ true, 
    /*enemy_bullet_collide allowed*/ false,
    /*collision_bullet_with_wall_allowed*/ true,
    /*collision_body_with_wall_allowed*/ true);
    
    TempEnemyTank.setAIVersion(2);    
    //TempEnemyTank.setTurretSize(80, 63); //width, height
    
    enemies.add(TempEnemyTank);
  }
  
  
  //BOSS ENEMIES
  public void addBossEnemy1(float spawnX, float spawnY)
  {
    TempEnemyTank = new EnemyTank(
    /*tank_width*/50, 
    /*tank_height*/50, 
    /*tank_speed*/4.5, //your bullet speed is 4
    /*tank_health*/.01,
    /*bullet_size*/10, 
    /*bullet_speed*/5, 
    /*bullet_health/pentration/damage*/.34,
    /*bullet frequency measured in ticks per shot*/ 8,
    /*number of times bullets bounce*/0,
    /*spawn_x*/spawnX, 
    /*spawn_y*/spawnY, 
    /*target_location_x*/myTank.location.x, 
    /*target_location_y*/myTank.location.y,
    /*Tank Color           r/g/b*/0, 255, 255,
    /*Tank Outline Color   r/g/b*/50, 40, 30,
    /*Tank Stroke Weight*/1,
    /*Turret Color         r/g/b*/255, 255, 255,
    /*Turret Outline Color r/g/b*/255, 255, 255,
    /*Turret Stroke Weight*/1);

    TempEnemyTank.updateCollisionPermissions(
    /*player_shot_collision_with_body allowed*/ true, 
    /*enemy_shot_collision_with_body allowed*/ false, 
    /*player_bullet_collide allowed*/ true, 
    /*enemy_bullet_collide allowed*/ false,
    /*collision_bullet_with_wall_allowed*/ true,
    /*collision_body_with_wall_allowed*/ true);
    
    TempEnemyTank.setAIVersion(2);
    
    enemies.add(TempEnemyTank);
  }
  
  public void addBossEnemy2(float spawnX, float spawnY)
  {
    TempEnemyTank = new EnemyTank(
    /*tank_width*/100, 
    /*tank_height*/100, 
    /*tank_speed*/.5, 
    /*tank_health*/20,
    /*bullet_size*/100, 
    /*bullet_speed*/1, 
    /*bullet_health/pentration/damage*/100,
    /*bullet frequency measured in ticks per shot*/ 100,
    /*number of times bullets bounce*/20,
    /*spawn_x*/spawnX, 
    /*spawn_y*/spawnY, 
    /*target_location_x*/myTank.location.x, 
    /*target_location_y*/myTank.location.y,
    /*Tank Color           r/g/b*/0, 255, 255,
    /*Tank Outline Color   r/g/b*/50, 40, 30,
    /*Tank Stroke Weight*/1,
    /*Turret Color         r/g/b*/255, 255, 255,
    /*Turret Outline Color r/g/b*/255, 255, 255,
    /*Turret Stroke Weight*/1);

    TempEnemyTank.updateCollisionPermissions(
    /*player_shot_collision_with_body allowed*/ true, 
    /*enemy_shot_collision_with_body allowed*/ false, 
    /*player_bullet_collide allowed*/ true, 
    /*enemy_bullet_collide allowed*/ false,
    /*collision_bullet_with_wall_allowed*/ false,
    /*collision_body_with_wall_allowed*/ false);
    
    TempEnemyTank.setAIVersion(1);
    
    enemies.add(TempEnemyTank);
  }  
  
  
  
  public void addEnemy(EnemyTank enemyTank)
  {
    enemies.add(enemyTank);
  }
  
  public void removeEnemy(EnemyTank enemyTank)
  {
    enemies.remove(enemyTank);
  }
  
  public LinkedList<EnemyTank> getEList()
  {
    return enemies;
  }
  
  public void resetEnemies()
  {
    enemies = new LinkedList<EnemyTank>();
  }
}
