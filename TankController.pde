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
      
      if(tickCount % 64 == 0 && rand.nextInt(3) == 0) //every 64 ticks give it a 1/3 chance of changing direction
      {
        PVector velocity_direction = new PVector(rand.nextInt(), rand.nextInt());
        velocity_direction.normalize();
        TempEnemyTank.setNewVelocityDirection(velocity_direction);
      }
      
      AI.targetVisibleCheck(); //checks if should shoot
      AI.updateAimLocation(); //updates the aiming location
      AI.updateVelocity(); //updates where the tank is gonna move next
      AI.collisionCheck();
      TempEnemyTank.update(); //only updates position and renders the tank
      
      if(AI.target_visible)
        TempEnemyTank.local_tick_count++;
      if(AI.target_visible && TempEnemyTank.local_tick_count % TempEnemyTank.bullet_frequency == 0)
        TempEnemyTank.shoot();
      if(TempEnemyTank.tank_health <= 0)
        removeEnemy(TempEnemyTank);
    }
  }
  
  //STANDARD ENEMIES
  public void addDummyEnemy(float spawnX, float spawnY)
  {
    TempEnemyTank = new EnemyTank(
    /*tank_width*/75, 
    /*tank_height*/75, 
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
    /*Tank Color         r/g/b*/0, 123, 255,
    /*Turret Color       r/g/b*/255, 255, 255,
    /*Tank Outline Color r/g/b*/255, 123, 255);

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
    /*bullet_speed*/4, 
    /*bullet_health/pentration/damage*/.8,
    /*bullet frequency measured in ticks per shot*/ 100,
    /*number of times bullets bounce*/1,
    /*spawn_x*/spawnX, 
    /*spawn_y*/spawnY, 
    /*target_location_x*/myTank.location.x, 
    /*target_location_y*/myTank.location.y,
    /*Tank Color         r/g/b*/124, 107, 78,
    /*Turret Color       r/g/b*/135, 120, 95,
    /*Tank Outline Color r/g/b*/0, 0, 0);
    
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
    /*tank_height*/75, 
    /*tank_speed*/1, 
    /*tank_health*/3,
    /*bullet_size*/20, 
    /*bullet_speed*/4, 
    /*bullet_health/pentration/damage*/.8,
    /*bullet frequency measured in ticks per shot*/ 64,
    /*number of times bullets bounce*/1,
    /*spawn_x*/spawnX, 
    /*spawn_y*/spawnY, 
    /*target_location_x*/myTank.location.x, 
    /*target_location_y*/myTank.location.y,
    /*Tank Color         r/g/b*/80, 70, 50,
    /*Turret Color       r/g/b*/90, 80, 70,
    /*Tank Outline Color r/g/b*/0, 0, 0);
    
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
    /*bullet_health/pentration/damage*/3,
    /*bullet frequency measured in ticks per shot*/ 100,
    /*number of times bullets bounce*/0,
    /*spawn_x*/spawnX, 
    /*spawn_y*/spawnY, 
    /*target_location_x*/myTank.location.x, 
    /*target_location_y*/myTank.location.y,
    /*Tank Color         r/g/b*/50, 40, 30,
    /*Turret Color       r/g/b*/70, 60, 50,
    /*Tank Outline Color r/g/b*/0, 0, 0);
    
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
  
  
  
  
  //BOSS ENEMIES
  public void addBossEnemy1(float spawnX, float spawnY)
  {
    TempEnemyTank = new EnemyTank(
    /*tank_width*/50, 
    /*tank_height*/50, 
    /*tank_speed*/4.5, //your bullet speed is 4
    /*tank_health*/.5,
    /*bullet_size*/10, 
    /*bullet_speed*/5, 
    /*bullet_health/pentration/damage*/.30,
    /*bullet frequency measured in ticks per shot*/ 8,
    /*number of times bullets bounce*/0,
    /*spawn_x*/spawnX, 
    /*spawn_y*/spawnY, 
    /*target_location_x*/myTank.location.x, 
    /*target_location_y*/myTank.location.y,
    /*Tank Color         r/g/b*/0, 255, 255,
    /*Turret Color       r/g/b*/255, 255, 255,
    /*Tank Outline Color r/g/b*/255, 255, 255);

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
    /*Tank Color         r/g/b*/0, 255, 255,
    /*Turret Color       r/g/b*/255, 255, 255,
    /*Tank Outline Color r/g/b*/255, 255, 255);

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
