import java.util.LinkedList;
class Controller
{
  private LinkedList<Bullet> b = new LinkedList<Bullet>();
  Bullet TempBullet;
  private LinkedList<PlayerTank> players = new LinkedList<PlayerTank>(); 
  PlayerTank myTank;
  private LinkedList<EnemyTank> enemies = new LinkedList<EnemyTank>();
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
      
      if (TempBullet.getVelocity().mag() == 0)
        myController.removeBullet(b.get(i));
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
        if(dist(getBList().get(a).getPosition().x, getBList().get(a).getPosition().y, getBList().get(i).getPosition().x, getBList().get(i).getPosition().y)
        <= getBList().get(a).getSize() / 3 + getBList().get(i).getSize() / 3)//checks if the bullets are within range of eachother, divide by 3 if want to look realistic, divide by 2 to be logically accurate
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
        if ((myWorld.getWalls()[a][0]) - (getBList().get(i).getPosition().x + getBList().get(i).getSize() * sqrt(2) / 4) <= 0 //scans if the collision box overlaps with a rectangle along a vertical line
        && (myWorld.getWalls()[a][0]) - (getBList().get(i).getPosition().x) >= 0 //Makes sure that this collision box does not affect the other side of the box
        && (getBList().get(i).getPosition().y - getBList().get(i).getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) <= 0 //makes sure that the tank bullet is within the right vertical segment of the rectangle
        && (getBList().get(i).getPosition().y + getBList().get(i).getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1]) >= 0 //makes sure that the tank bullet is within the right vertical segment of the rectangle
        || (1900) - (getBList().get(i).getPosition().x + getBList().get(i).getSize() * sqrt(2) / 4 / 2) <= 0) //makes sure the tank bullet cannot go off-screen
        {
          getBList().get(i).rightWallCollisionTrue();
          getBList().get(i).updateBulletDirectionPosition();
        }
        else
          getBList().get(i).rightWallCollisionFalse();


      
      //vertical wall check left_collision
        if ((myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) - (getBList().get(i).getPosition().x - getBList().get(i).getSize() * sqrt(2) / 4) >= 0 
        && (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) - (getBList().get(i).getPosition().x) <= 0
        && (getBList().get(i).getPosition().y - getBList().get(i).getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) <= 0 
        && (getBList().get(i).getPosition().y + getBList().get(i).getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1]) >= 0
        || (getBList().get(i).getPosition().x - getBList().get(i).getSize() * sqrt(2) / 4 / 2) <= 0)
        {
          getBList().get(i).leftWallCollisionTrue();
          getBList().get(i).updateBulletDirectionPosition();
        }
        else
          getBList().get(i).leftWallCollisionFalse();

      
      //horizontal wall check above_collision
        if ((myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) - (getBList().get(i).getPosition().y - getBList().get(i).getSize() * sqrt(2) / 4) >= 0 
        && (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) - (getBList().get(i).getPosition().y) <= 0
        && (getBList().get(i).getPosition().x - getBList().get(i).getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) <= 0 
        && (getBList().get(i).getPosition().x + getBList().get(i).getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0]) >= 0
        || (getBList().get(i).getPosition().y - getBList().get(i).getSize() * sqrt(2) / 4 / 2) <= 0)
        {
          getBList().get(i).aboveWallCollisionTrue();
          getBList().get(i).updateBulletDirectionPosition();
        }
        else
          getBList().get(i).aboveWallCollisionFalse();

      
      //horizontal wall check below_collision
        if ((myWorld.getWalls()[a][1]) - (getBList().get(i).getPosition().y + getBList().get(i).getSize() * sqrt(2) / 4) <= 0 
        && (myWorld.getWalls()[a][1]) - (getBList().get(i).getPosition().y) >= 0
        && (getBList().get(i).getPosition().x - getBList().get(i).getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) <= 0 
        && (getBList().get(i).getPosition().x + getBList().get(i).getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0]) >= 0
        || (900) - (getBList().get(i).getPosition().y + getBList().get(i).getSize() * sqrt(2) / 4 / 2) <= 0)
        {  
          getBList().get(i).belowWallCollisionTrue();
          getBList().get(i).updateBulletDirectionPosition();
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
