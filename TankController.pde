import java.util.LinkedList;
class TankController
{
  private LinkedList<EnemyTank> enemies = new LinkedList<EnemyTank>();
  EnemyTank TempEnemyTank;
  EnemyAI AI;
  private int num_of_enemies;
  
  public TankController(int num_of_enemies)
  {
    this.num_of_enemies = num_of_enemies;
    for(int i = 0; i < this.num_of_enemies; i++)
    {
      addStandardEnemy();
    }
  }
  
  public void update()
  {
    for(int i = 0; i < enemies.size(); i++)
    {
      TempEnemyTank = enemies.get(i);
      AI = new EnemyAI(TempEnemyTank); //applies AI to the tank in the enemies list
      AI.shootCheck(); //checks if should shoot
      TempEnemyTank.update();
      if(AI.canShoot() && tickCount % TempEnemyTank.getBulletFrequency() == 0)
        TempEnemyTank.shoot();
    }
    
    for(int i = 0; i < enemies.size(); i++)
    {
      TempEnemyTank = enemies.get(i);
      TempEnemyTank.renderTank();
    }
  }
  
  public void addStandardEnemy()
  {

    Random rand = new Random();
    TempEnemyTank = new EnemyTank(
    /*tank_width*/75, 
    /*tank_height*/75, 
    /*tank_speed*/1, 
    /*bullet_size*/30, 
    /*bullet_speed*/5, 
    /*bullet_health*/1,
    /*bullet frequency measured in ticks per shot*/ 64,
    /*spawn_x*/rand.nextInt(1900), 
    /*spawn_y*/rand.nextInt(900), 
    /*target_location_x*/myTank.getPosition().x, 
    /*target_location_y*/myTank.getPosition().y);
    
    //(tank_width, tank_height, tank_speed, bullet_size, bullet_speed, spawn_x, spawn_y, target_location_x, target_location_y)
    
    enemies.add(TempEnemyTank);
  }
  
  public void addAnyEnemy(EnemyTank enemyTank)
  {
    enemies.add(enemyTank);
  }
  
  public void removeAnyEnemy(EnemyTank enemyTank)
  {
    enemies.remove(enemyTank);
  }
  
  public LinkedList<EnemyTank> getEList()
  {
    return enemies;
  }
  
}
