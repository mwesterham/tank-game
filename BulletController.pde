import java.util.LinkedList;
class BulletController
{
  private LinkedList<Bullet> b = new LinkedList<Bullet>();
  Bullet TempBullet;
  private int TempPos; //integer value
  
  public BulletController()
  {
    
  }

  public void sudoUpdate()
  {
    for(int i = 0; i < b.size(); i++) //updates position, checks for collisions and deletes accordingly
    {
      TempPos = i;
      TempBullet = b.get(i);
      TempBullet.updatePosition();
      collisionBulletBulletCheck();
      collisioinBulletOuterWallCheck();
      if(TempBullet.collision_bullet_with_wall_allowed)
        collisionBulletWallCheck();

      if (TempBullet.getVelocity().mag() == 0)//  || TempBullet.bullet_health <= 0)//if the bullet collides more than twice vel = 0 and removed, if health reaches 0, it is removed
        bulletController.removeBullet(b.get(i));
      //TempBullet.renderBullet();
    }
  }

  public void update()
  {
    for(int i = 0; i < b.size(); i++) //updates position, checks for collisions and deletes accordingly
    {
      TempPos = i;
      TempBullet = b.get(i);
      TempBullet.updatePosition();
      collisionBulletBulletCheck();
      collisioinBulletOuterWallCheck();
      if(TempBullet.collision_bullet_with_wall_allowed)
        collisionBulletWallCheck();

      if (TempBullet.getVelocity().mag() == 0)//  || TempBullet.bullet_health <= 0)//if the bullet collides more than twice vel = 0 and removed, if health reaches 0, it is removed
        bulletController.removeBullet(b.get(i));
    }

    for(int i = 0; i < b.size(); i++) //Renders the bullets
    {
      TempBullet = b.get(i);
      TempBullet.renderBullet();
    }
  }
  
  public void collisionBulletBulletCheck()//checks the collisions between different bullets
  {
    for(int a = TempPos + 1; a < getBList().size(); a++) //cycles through the bullets in front of i bullet in the list
    {  
      if(dist(getBList().get(a).getPosition().x, getBList().get(a).getPosition().y, TempBullet.getPosition().x, TempBullet.getPosition().y)
      <= getBList().get(a).getSize() / 2 + TempBullet.getSize() / 2)//checks if the bullets are within range of eachother, divide by 3 if want to look realistic, divide by 2 to be logically accurate
      {
        if(TempBullet.playerBulletCollision() && getBList().get(a).enemyBulletCollision()
        || TempBullet.enemyBulletCollision() && getBList().get(a).playerBulletCollision())//If bullet collision is enabled, move on to bullet interaction
        {
          float currentHealth = TempBullet.getHealth();
          float currentHealthA = getBList().get(a).getHealth();
          
          TempBullet.bulletHealthMinus(currentHealthA);//getBList().get(a).bullet_health); //subtracts health of a from tempbullet
          if(TempBullet.getHealth() <= 0)
            TempBullet.prepDelete();//careful! if bullets overlap and one makes the health nagative, another bullet will gain health since it is subtracting the bullet with negative health
          
          getBList().get(a).bulletHealthMinus(currentHealth);//TempBullet.bullet_health); //subtracts health of tempbullet from a
          if(getBList().get(a).getHealth() <= 0)
            getBList().get(a).prepDelete();//ditto as above ^^
          
          //if(TempBullet.getHealth() > 0)
            //TempBullet.original_bullet_health = getBList().get(a).getHealth();
          //if(getBList().get(a).getHealth() > 0)
            //getBList().get(a).original_bullet_health = getBList().get(a).getHealth();
        }
      }
    }
  }
 
  public void collisioinBulletOuterWallCheck()
  {
    //MUST CHECK OUTER WALL COLLISIONS SEPERATELY, NOT ON A WALL-TO-WALL BASIS
    
    //Checks the outline walls on the left and right side
    if (TempBullet.getPosition().x + TempBullet.getSize() * sqrt(2) / 4 / 2 < 0 || (TempBullet.getPosition().x + TempBullet.getSize() * sqrt(2) / 4 / 2) > width)
    {
      TempBullet.leftWallCollisionTrue(); //could be left or right
      TempBullet.addCollisionToCount();
      TempBullet.updateBulletDirection();
    }
    else
      TempBullet.leftWallCollisionFalse();
    
    //checks the outline walls on the above and below sides
    if((TempBullet.getPosition().y - TempBullet.getSize() * sqrt(2) / 4 / 2) <= 0 || (TempBullet.getPosition().y + TempBullet.getSize() * sqrt(2) / 4 / 2) >= height)
    {  
      TempBullet.aboveWallCollisionTrue(); //could be above or below
      TempBullet.addCollisionToCount();
      TempBullet.updateBulletDirection();
    }
    else
      TempBullet.aboveWallCollisionFalse();
  }
  
  public void collisionBulletWallCheck()//checks collisions between bullets and walls
  {
    //Loop to check each stand-alone wall with each bullet
    for(int a = 0; a < myWorld.getNumWalls(); a++)//cycles through all of the walls
    {
      float innerRim = TempBullet.getVelocity().mag() + 1;
      float thisCollisionCount = 0;
      //PVector original_velocity = TempBullet.getVelocity();
      
      //checks if the bullet collides with bullets' right side, wall left side  
      if ((myWorld.getWalls()[a][0]) - (TempBullet.getPosition().x + TempBullet.getSize() * sqrt(2) / 4) <= 0 //scans if the collision box overlaps with a rectangle along a vertical line
      && (myWorld.getWalls()[a][0]) - (TempBullet.getPosition().x) >= -innerRim //Makes sure that this collision box does not affect the other side of the box
      && (TempBullet.getPosition().y - TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) <= 0 //makes sure that the tank bullet is within the right vertical segment of the rectangle
      && (TempBullet.getPosition().y + TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1]) >= 0) //makes sure that the tank bullet is within the right vertical segment of the rectangle
      {
        TempBullet.leftWallCollisionTrue();
        TempBullet.addCollisionToCount();
        TempBullet.updateBulletDirection();
        thisCollisionCount++;
      }
      else
        TempBullet.leftWallCollisionFalse();


    
      //vertical wall check left_collision, bullet left side, wall right side
      if ((myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) - (TempBullet.getPosition().x - TempBullet.getSize() * sqrt(2) / 4) >= 0 
      && (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) - (TempBullet.getPosition().x) <= innerRim
      && (TempBullet.getPosition().y - TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) <= 0 
      && (TempBullet.getPosition().y + TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1]) >= 0)
      {
        TempBullet.rightWallCollisionTrue();
        TempBullet.addCollisionToCount();
        TempBullet.updateBulletDirection();
        thisCollisionCount++;
      }
      else
        TempBullet.rightWallCollisionFalse();
      
      //horizontal wall check above_collision
      if ((myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) - (TempBullet.getPosition().y - TempBullet.getSize() * sqrt(2) / 4) >= 0 
      && (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) - (TempBullet.getPosition().y) <= innerRim
      && (TempBullet.getPosition().x - TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) <= 0 
      && (TempBullet.getPosition().x + TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0]) >= 0)
      {
        TempBullet.aboveWallCollisionTrue();
        TempBullet.addCollisionToCount();
        TempBullet.updateBulletDirection();
        thisCollisionCount++;
      }
      else
        TempBullet.aboveWallCollisionFalse();

    
      //horizontal wall check below_collision
      if ((myWorld.getWalls()[a][1]) - (TempBullet.getPosition().y + TempBullet.getSize() * sqrt(2) / 4) <= 0 
      && (myWorld.getWalls()[a][1]) - (TempBullet.getPosition().y) >= -innerRim
      && (TempBullet.getPosition().x - TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) <= 0 
      && (TempBullet.getPosition().x + TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0]) >= 0)
      {  
        TempBullet.belowWallCollisionTrue();
        TempBullet.addCollisionToCount();
        TempBullet.updateBulletDirection();
        thisCollisionCount++;
      }
      else
        TempBullet.belowWallCollisionFalse();
        
      if(thisCollisionCount > 1) //if it hits a corner go to this code
      {
        TempBullet.subtractCollisionFromCount();
      }
      
      //inside a wall check
      if ((TempBullet.getPosition().y - TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) <= -innerRim //makes sure that the tank bullet is within the right vertical segment of the rectangle
      && (TempBullet.getPosition().y + TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][1]) >= innerRim //makes sure that the tank bullet is within the right vertical segment of the rectangle
      && (TempBullet.getPosition().x - TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) <= -innerRim //makes sure that the tank bullet is within the right horizontal segment of the rectangle
      && (TempBullet.getPosition().x + TempBullet.getSize() * sqrt(2) / 4) - (myWorld.getWalls()[a][0]) >= innerRim) //makes sure that the tank bullet is within the right horizontal segment of the rectangle
      {  
        TempBullet.prepDelete();
        //System.out.print("DELETED");
      }
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
  
  public void resetBullets()
  {
    b = new LinkedList<Bullet>();
  }
}
