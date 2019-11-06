import java.util.LinkedList;
class Controller
{
  private LinkedList<Bullet> b = new LinkedList<Bullet>();
  Bullet TempBullet;
  Bullet TempBullet2;
  PlayerTank myTank;
  EnemyTank enemyTank;
  
  public Controller(PlayerTank myTank)
  {
    this.myTank = myTank;
  }
  public Controller(EnemyTank enemyTank)
  {
    this.enemyTank = enemyTank;
  }
  
  
  public void update()
  {
    for(int i = 0; i < b.size(); i++)
    {
      TempBullet = b.get(i);
      TempBullet.updatePosition();
      collisionCheck();
    //}
    
    //for(int i = 0; i < b.size(); i++)
    //{
      if(TempBullet.getSpeed() == 0 && true)//differentiate between enemy bullets and your bullets as well as what side you are shooting from
      {
        getBList().get(i).addCollisionToCount();
        int TempCollisionCount = getBList().get(i).getNumOfCollisions();
        System.out.println("Bullet " + i + " "  + getBList().get(i).getNumOfCollisions());
        if(getBList().get(i).getNumOfCollisions() < 5)
          
          myController.getBList().set(i, new Bullet(
          /*Number of collisions*/TempCollisionCount, 
          myTank.bullet_size, 
          myTank.bullet_speed, 
          /*spawnpoint x*/getBList().get(i).getRealPosition()[0], 
          /*spawnpoint y*/getBList().get(i).getRealPosition()[1], 
          /*Direction of Bullet*/3.14159/2, 
          /*spawn distance from center of rotation*/getBList().get(i).getSpeed(), 
          /*player_shot_collision_with_body allowed*/false, 
          /*enemy_shot_collision_with_body allowed*/true, 
          /*player_bullet_collide allowed*/false, 
          /*enemy_bullet_collide allowed*/true, 
          /*Bullet color...*/myTank.turret_color[0], myTank.turret_color[1], myTank.turret_color[2], 
          /*Bullet outline color...*/myTank.tank_color[0], myTank.tank_color[1], myTank.tank_color[2]));
          
          //(size, speed, spawnpoint x, spawnpoint y, direction of shot, spawn distance from center, player_shot_collision_with_body allowed, enemy_shot_collision_with_body allowed, player_bullet_collide allowed, enemy_bullet_collide allowed, bullet_color_red, bullet_color_green, bullet_color_blue, outline_color_red, outline_color_green, outline_color_blue)
        else
          removeBullet(getBList().get(i));
      }
    }
  }
  
  public void collisionCheck()//combines all the checks
  {
    collisionBulletBulletCheck();
    collisionBulletWallCheck();
  }
  
  public void collisionBulletBulletCheck()//checks the collisions between different bullets
  {
    for(int i = 0; i < getBList().size(); i++) //cycles through all the bullets
    {
      for(int a = 1; a < getBList().size(); a++) //cycles through the bullets in front of i bullet in the list
      {  
        if(dist(getBList().get(a).getRealPosition()[0], getBList().get(a).getRealPosition()[1], getBList().get(i).getRealPosition()[0], getBList().get(i).getRealPosition()[1])
        <= getBList().get(a).getSize() / 2 + getBList().get(i).getSize() / 2)//checks if the bullets are within range of eachother
        {
          if(getBList().get(i).playerBulletCollision() && getBList().get(a).enemyBulletCollision()
          || getBList().get(i).enemyBulletCollision() && getBList().get(a).playerBulletCollision())//If bullet collision is enabled remove bullets
          {
            removeBullet(getBList().get(i));
            removeBullet(getBList().get(a-1));
          }
        }
      }
    }
  }
 
  public void collisionBulletWallCheck()//checks collisions between bullets and walls
  {
    for(int i = 0; i < getBList().size(); i++) //cycles through all the bullets    
    {
      for(int a = 0; a < myWorld.getNumWalls(); a++)//cycles through all of the walls
      {
      //checks if the bullet collides with on a bullets right side, wall left side  
        if ((myWorld.getWalls()[a][0]) - (getBList().get(i).getRealPosition()[0] + getBList().get(i).getSize() * sqrt(2) / 4) <= 0 //scans if the collision box overlaps with a rectangle along a vertical line
        && (myWorld.getWalls()[a][0]) - (getBList().get(i).getRealPosition()[0]) >= 0 //Makes sure that this collision box does not affect the other side of the box
        && (getBList().get(i).getRealPosition()[1] - getBList().get(i).getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) <= 0 //makes sure that the tank bullet is within the right vertical segment of the rectangle
        && (getBList().get(i).getRealPosition()[1] + getBList().get(i).getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1]) >= 0 //makes sure that the tank bullet is within the right vertical segment of the rectangle
        || (1900) - (getBList().get(i).getRealPosition()[0] + getBList().get(i).getSize() * sqrt(2) / 4 / 2) <= 0) //makes sure the tank bullet cannot go off-screen
        {
          getBList().get(i).rightWallCollisionTrue();
          getBList().get(i).updateBulletSpeedDirection();
          //getBList().get(i).addCollisionToCount();
          //if(getBList().get(i).getNumOfCollisions() < 5)
          //{
            //
            //removeBullet(getBList().get(i+1));
          //}
         // else
            //removeBullet(getBList().get(i));
        }
        else
          getBList().get(i).rightWallCollisionFalse();


      
      //vertical wall check left_collision
        if ((myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) - (getBList().get(i).getRealPosition()[0] - getBList().get(i).getSize() * sqrt(2) / 4) >= 0 
        && (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) - (getBList().get(i).getRealPosition()[0]) <= 0
        && (getBList().get(i).getRealPosition()[1] - getBList().get(i).getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) <= 0 
        && (getBList().get(i).getRealPosition()[1] + getBList().get(i).getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1]) >= 0
        || (getBList().get(i).getRealPosition()[0] - getBList().get(i).getSize() * sqrt(2) / 4 / 2) <= 0)
        {
          getBList().get(i).leftWallCollisionTrue();
          getBList().get(i).updateBulletSpeedDirection();
        }
        else
          getBList().get(i).leftWallCollisionFalse();

      
      //horizontal wall check above_collision
        if ((myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) - (getBList().get(i).getRealPosition()[1] - getBList().get(i).getSize() * sqrt(2) / 4) >= 0 
        && (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) - (getBList().get(i).getRealPosition()[1]) <= 0
        && (getBList().get(i).getRealPosition()[0] - getBList().get(i).getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) <= 0 
        && (getBList().get(i).getRealPosition()[0] + getBList().get(i).getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0]) >= 0
        || (getBList().get(i).getRealPosition()[1] - getBList().get(i).getSize() * sqrt(2) / 4 / 2) <= 0)
        {
          getBList().get(i).aboveWallCollisionTrue();
          getBList().get(i).updateBulletSpeedDirection();
        }
        else
          getBList().get(i).aboveWallCollisionFalse();

      
      //horizontal wall check below_collision
        if ((myWorld.getWalls()[a][1]) - (getBList().get(i).getRealPosition()[1] + getBList().get(i).getSize() * sqrt(2) / 4) <= 0 
        && (myWorld.getWalls()[a][1]) - (getBList().get(i).getRealPosition()[1]) >= 0
        && (getBList().get(i).getRealPosition()[0] - getBList().get(i).getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) <= 0 
        && (getBList().get(i).getRealPosition()[0] + getBList().get(i).getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0]) >= 0
        || (900) - (getBList().get(i).getRealPosition()[1] + getBList().get(i).getSize() * sqrt(2) / 4 / 2) <= 0)
        {  
          getBList().get(i).belowWallCollisionTrue();
          getBList().get(i).updateBulletSpeedDirection();
        }
        else
          getBList().get(i).belowWallCollisionFalse();
      }
    }
  }

  public void render()
  {
    for(int i = 0; i < b.size(); i++)
    {
      TempBullet = b.get(i);
      TempBullet.renderBullet();
    }
  }
  
  public void addBullet(Bullet block)
  {
    b.add(block);
  }
  
  public void removeBullet(Bullet block)
  {
    b.remove(block);
  }

  public LinkedList<Bullet> getBList()
  {
    return b;
  }
  
}
