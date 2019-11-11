import java.util.LinkedList;
class BulletController
{
  private LinkedList<Bullet> b = new LinkedList<Bullet>();
  Bullet TempBullet;
  
  public BulletController()
  {
    
  }
  
  public void update()
  {
    for(int i = 0; i < b.size(); i++) //updates position, checks for collisions and deletes accordingly
    {
      TempBullet = b.get(i);
      TempBullet.updatePosition();
      collisionCheck();

      if (TempBullet.getVelocity().mag() == 0  || TempBullet.bullet_health <= 0)//if the bullet collides more than twice vel = 0 and removed, if health reaches 0, it is removed
        bulletController.removeBullet(b.get(i));
    }
    
    for(int i = 0; i < b.size(); i++) //Renders the bullets
    {
      TempBullet = b.get(i);
      TempBullet.renderBullet();
    }
  }
  
  public void collisionCheck()//combines all the checks
  {
    collisionBulletBulletCheck();
    collisionBulletWallCheck();
  }
  
  public void collisionBulletBulletCheck()//checks the collisions between different bullets
  {
    for(int a = 1; a < getBList().size(); a++) //cycles through the bullets in front of i bullet in the list
    {  
      if(dist(getBList().get(a).getPosition().x, getBList().get(a).getPosition().y, TempBullet.getPosition().x, TempBullet.getPosition().y)
      <= getBList().get(a).getSize() / 2 + TempBullet.getSize() / 2)//checks if the bullets are within range of eachother, divide by 3 if want to look realistic, divide by 2 to be logically accurate
      {
        if(TempBullet.playerBulletCollision() && getBList().get(a).enemyBulletCollision()
        || TempBullet.enemyBulletCollision() && getBList().get(a).playerBulletCollision())//If bullet collision is enabled remove bullets
        {
          TempBullet.bulletHealthMinus(); //deals 1 damage to the bullet 
          getBList().get(a).bulletHealthMinus(); //ditto ^
        }
      }
    }
  }
 
  public void collisionBulletWallCheck()//checks collisions between bullets and walls
  {
    //MUST CHECK OUTER WALL COLLISIONS SEPERATELY, NOT ON A WALL-TO-WALL BASIS
    
    //Checks the edge walls on the left and right side
    if (TempBullet.getPosition().x + TempBullet.getSize() * sqrt(2) / 4 / 2 < 0 || (TempBullet.getPosition().x + TempBullet.getSize() * sqrt(2) / 4 / 2) > width)
    {
      TempBullet.sideWallCollisionTrue();
      TempBullet.addCollisionToCount();
      TempBullet.updateBulletDirection();
    }
    else
      TempBullet.sideWallCollisionFalse();
    
    //checks the edge walls on the above and below sides
    if((TempBullet.getPosition().y - TempBullet.getSize() * sqrt(2) / 4 / 2) <= 0 || (TempBullet.getPosition().y + TempBullet.getSize() * sqrt(2) / 4 / 2) >= height)
    {  
      TempBullet.aboveBelowWallCollisionTrue();
      TempBullet.addCollisionToCount();
      TempBullet.updateBulletDirection();
    }
    else
      TempBullet.aboveBelowWallCollisionFalse();
    
    //Loop to check each stand-alone wall with each bullet
    for(int a = 0; a < myWorld.getNumWalls(); a++)//cycles through all of the walls
    {
      //checks if the bullet collides with bullets' right side, wall left side  
      if ((myWorld.getWalls()[a][0]) - (TempBullet.getPosition().x + TempBullet.getSize() * sqrt(2) / 4) <= 0 //scans if the collision box overlaps with a rectangle along a vertical line
      && (myWorld.getWalls()[a][0]) - (TempBullet.getPosition().x) >= 0 //Makes sure that this collision box does not affect the other side of the box
      && (TempBullet.getPosition().y - TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) <= 0 //makes sure that the tank bullet is within the right vertical segment of the rectangle
      && (TempBullet.getPosition().y + TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1]) >= 0) //makes sure that the tank bullet is within the right vertical segment of the rectangle
      {
        TempBullet.sideWallCollisionTrue();
        TempBullet.addCollisionToCount();
        TempBullet.updateBulletDirection();
      }
      else
        TempBullet.sideWallCollisionFalse();


    
      //vertical wall check left_collision, bullet left side, wall right side
      if ((myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) - (TempBullet.getPosition().x - TempBullet.getSize() * sqrt(2) / 4) >= 0 
      && (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) - (TempBullet.getPosition().x) <= 0
      && (TempBullet.getPosition().y - TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) <= 0 
      && (TempBullet.getPosition().y + TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1]) >= 0)
      {
        TempBullet.sideWallCollisionTrue();
        TempBullet.addCollisionToCount();
        TempBullet.updateBulletDirection();
      }
      else
        TempBullet.sideWallCollisionFalse();
      
      //horizontal wall check above_collision
      if ((myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) - (TempBullet.getPosition().y - TempBullet.getSize() * sqrt(2) / 4) >= 0 
      && (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) - (TempBullet.getPosition().y) <= 0
      && (TempBullet.getPosition().x - TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) <= 0 
      && (TempBullet.getPosition().x + TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0]) >= 0)
      {
        TempBullet.aboveBelowWallCollisionTrue();
        TempBullet.addCollisionToCount();
        TempBullet.updateBulletDirection();
      }
      else
        TempBullet.aboveBelowWallCollisionFalse();

    
      //horizontal wall check below_collision
      if ((myWorld.getWalls()[a][1]) - (TempBullet.getPosition().y + TempBullet.getSize() * sqrt(2) / 4) <= 0 
      && (myWorld.getWalls()[a][1]) - (TempBullet.getPosition().y) >= 0
      && (TempBullet.getPosition().x - TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) <= 0 
      && (TempBullet.getPosition().x + TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0]) >= 0)
      {  
        TempBullet.aboveBelowWallCollisionTrue();
        TempBullet.addCollisionToCount();
        TempBullet.updateBulletDirection();
      }
      else
        TempBullet.aboveBelowWallCollisionFalse();
    }
  }
  /*
  public void render()
  {
    for(int i = 0; i < b.size(); i++)
    {
      TempBullet = b.get(i);
      TempBullet.renderBullet();
    }
  }
  */
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
