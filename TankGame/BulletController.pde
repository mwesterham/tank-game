import java.util.LinkedList;
class BulletController
{
  private LinkedList<Bullet> b = new LinkedList<Bullet>();
  Bullet TempBullet;
  private int TempPos; //integer value
  private int screen_section_x;
  private int screen_section_y;

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
      collisionBulletOuterWallCheck();
      if(TempBullet.collision_bullet_with_wall_allowed)
        collisionBulletWallCheck();
      if(TempBullet.number_of_collisions > TempBullet.num_bullet_bounce)
        TempBullet.prepDelete(); //makes the velocity zero so it can be deleted in the controller class and health zero
        
      if (TempBullet.velocity.mag() == 0)//  || TempBullet.bullet_health <= 0)//if the bullet collides more than twice vel = 0 and removed, if health reaches 0, it is removed
        bulletController.removeBullet(b.get(i));
      //TempBullet.renderBullet();
    }
  }

  public void update()
  {
    for(int i = 0; i < b.size(); i++) //resets all the bullets to "have not been scanned"
    {
      TempBullet = b.get(i);
      TempBullet.has_been_scanned = false;
    }

    //sorts it into 8 sections horizontally accross the screen, 3 sections vertically, then checks the bullets in their respective sections
    for(int section_x = -50; section_x < width; section_x += width / 8) //-100 because it detects the bullet a little behind the wall and updates it even if it is behind so its like 36 calculations not 24
      for(int section_y = -50; section_y < height; section_y += height / 3)
        for(int i = 0; i < b.size(); i++) //updates position, checks for collisions and deletes accordingly
        {
          screen_section_x = section_x;
          screen_section_y = section_y;
          TempPos = i;
          TempBullet = b.get(i);
          if(screen_section_y <= TempBullet.getRealLocation().y && TempBullet.getRealLocation().y <= screen_section_y + height / 3 + 50
          && screen_section_x <= TempBullet.getRealLocation().x && TempBullet.getRealLocation().x <= screen_section_x + width / 8 + 50) //scans bullets seperately to account for big bullets largest width / 2 = 50
            collisionBulletBulletCheck(); //Lags the game
          if (TempBullet.bullet_health <= 0)// || TempBullet.number_of_collisions == 0)//if the bullet health reaches 0 or below, it is removed
          {  
            bulletController.removeBullet(b.get(i));
            break; //if removed dont do any more calculations for this bullet
          }
          
          if(screen_section_y <= TempBullet.getRealLocation().y && TempBullet.getRealLocation().y <= screen_section_y + height / 3
          && screen_section_x <= TempBullet.getRealLocation().x && TempBullet.getRealLocation().x <= screen_section_x + width / 8
          && !TempBullet.has_been_scanned) //so that it does not double scan bullets
          {
            TempBullet.has_been_scanned = true; //dont double scan!!
            TempBullet.updatePosition();
            collisionBulletOuterWallCheck();
            if(TempBullet.collision_bullet_with_wall_allowed)
              collisionBulletWallCheck();
            if(TempBullet.number_of_collisions > TempBullet.num_bullet_bounce)
              TempBullet.prepDelete(); //makes the velocity and health zero so it can be deleted in the controller class 
          }
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
      if(screen_section_y <= getBList().get(a).getRealLocation().y && getBList().get(a).getRealLocation().y <= screen_section_y + height / 3 + 50 
      && screen_section_x <= getBList().get(a).getRealLocation().x && getBList().get(a).getRealLocation().x <= screen_section_x + width / 8 + 50) //largest width / 2 = 50 so add it to the width and height of each section to scan properly
        if(dist(getBList().get(a).getRealLocation().x, getBList().get(a).getRealLocation().y, TempBullet.getRealLocation().x, TempBullet.getRealLocation().y)
        <= getBList().get(a).bullet_width / 2 + TempBullet.bullet_width / 2)//checks if the bullets are within range of eachother, divide by 3 if want to look realistic, divide by 2 to be logically accurate
        {
          if(TempBullet.player_collision_allowed && getBList().get(a).enemy_bullet_collide_allowed
          || TempBullet.enemy_bullet_collide_allowed && getBList().get(a).player_bullet_collide_allowed)//If bullet collision is enabled, move on to bullet interaction
          {
            float currentHealth = TempBullet.bullet_health;
            float currentHealthA = getBList().get(a).bullet_health;
            
            TempBullet.bulletHealthMinus(currentHealthA);//subtracts health of a from tempbullet
            if(TempBullet.bullet_health <= 0)
              TempBullet.prepDelete();//careful! if bullets overlap and one makes the health nagative, another bullet will gain health since it is subtracting the bullet with negative health
            
            getBList().get(a).bulletHealthMinus(currentHealth);//TempBullet.bullet_health); //subtracts health of tempbullet from a
            if(getBList().get(a).bullet_health <= 0)
              getBList().get(a).prepDelete();//ditto as above ^^
            
          }
        }
    }
  }
 
  public void collisionBulletOuterWallCheck()
  {
    //MUST CHECK OUTER WALL COLLISIONS SEPERATELY, NOT ON A WALL-TO-WALL BASIS
    
    //Checks the outline walls on the left and right side
    if (TempBullet.getRealLocation().x + TempBullet.bullet_width * sqrt(2) / 4 / 2 < 0 || (TempBullet.getRealLocation().x + TempBullet.bullet_width * sqrt(2) / 4 / 2) > width)
    {
      TempBullet.left_wall_collision = true; //could be left or right
      TempBullet.number_of_collisions++;
      TempBullet.updateBulletDirection();
    }
    else
      TempBullet.left_wall_collision = false;
    
    //checks the outline walls on the above and below sides
    if((TempBullet.getRealLocation().y - TempBullet.bullet_width * sqrt(2) / 4 / 2) <= 0 || (TempBullet.getRealLocation().y + TempBullet.bullet_width * sqrt(2) / 4 / 2) >= height)
    {  
      TempBullet.above_wall_collision = true; //could be above or below
      TempBullet.number_of_collisions++;
      TempBullet.updateBulletDirection();
    }
    else
      TempBullet.above_wall_collision = false;
  }
  
  public void collisionBulletWallCheck()//checks collisions between bullets and walls
  {
    //Loop to check each stand-alone wall with each bullet
    for(int a = 0; a < myWorld.getNumWalls(); a++)//cycles through all of the walls
    {
      float innerRim = TempBullet.velocity.mag();
      float thisCollisionCount = 0;
      
      //checks if the bullet collides with bullets' right side, wall left side  
      if ((myWorld.getWalls()[a][0]) - (TempBullet.getRealLocation().x + TempBullet.bullet_width * sqrt(2) / 4) <= 0 //scans if the collision box overlaps with a rectangle along a vertical line
      && (myWorld.getWalls()[a][0]) - (TempBullet.getRealLocation().x) >= -innerRim //Makes sure that this collision box does not affect the other side of the box
      && (TempBullet.getRealLocation().y - TempBullet.bullet_width * sqrt(2) / 4) - (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) <= 0 //makes sure that the tank bullet is within the right vertical segment of the rectangle
      && (TempBullet.getRealLocation().y + TempBullet.bullet_width * sqrt(2) / 4) - (myWorld.getWalls()[a][1]) >= 0) //makes sure that the tank bullet is within the right vertical segment of the rectangle
      {
        TempBullet.left_wall_collision = true;
        TempBullet.number_of_collisions++;
        TempBullet.updateBulletDirection();
        thisCollisionCount++;
      }
      else
        TempBullet.left_wall_collision = false;
        
        
      //vertical wall check left_collision, bullet left side, wall right side
      if ((myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) - (TempBullet.getRealLocation().x - TempBullet.bullet_width * sqrt(2) / 4) >= 0 
      && (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) - (TempBullet.getRealLocation().x) <= innerRim
      && (TempBullet.getRealLocation().y - TempBullet.bullet_width * sqrt(2) / 4) - (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) <= 0 
      && (TempBullet.getRealLocation().y + TempBullet.bullet_width * sqrt(2) / 4) - (myWorld.getWalls()[a][1]) >= 0)
      {
        TempBullet.right_wall_collision = true;
        TempBullet.number_of_collisions++;
        TempBullet.updateBulletDirection();
        thisCollisionCount++;
      }
      else
        TempBullet.right_wall_collision = false;
        
      
      //horizontal wall check above_collision
      if ((myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) - (TempBullet.getRealLocation().y - TempBullet.bullet_width * sqrt(2) / 4) >= 0 
      && (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) - (TempBullet.getRealLocation().y) <= innerRim
      && (TempBullet.getRealLocation().x - TempBullet.bullet_width * sqrt(2) / 4) - (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) <= 0 
      && (TempBullet.getRealLocation().x + TempBullet.bullet_width * sqrt(2) / 4) - (myWorld.getWalls()[a][0]) >= 0)
      {
        TempBullet.above_wall_collision = true;
        TempBullet.number_of_collisions++;
        TempBullet.updateBulletDirection();
        thisCollisionCount++;
      }
      else
        TempBullet.above_wall_collision = false;
        
    
      //horizontal wall check below_collision
      if ((myWorld.getWalls()[a][1]) - (TempBullet.getRealLocation().y + TempBullet.bullet_width * sqrt(2) / 4) <= 0 
      && (myWorld.getWalls()[a][1]) - (TempBullet.getRealLocation().y) >= -innerRim
      && (TempBullet.getRealLocation().x - TempBullet.bullet_width * sqrt(2) / 4) - (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) <= 0 
      && (TempBullet.getRealLocation().x + TempBullet.bullet_width * sqrt(2) / 4) - (myWorld.getWalls()[a][0]) >= 0)
      {  
        TempBullet.below_wall_collision = true;
        TempBullet.number_of_collisions++;
        TempBullet.updateBulletDirection();
        thisCollisionCount++;
      }
      else
        TempBullet.below_wall_collision = false;
        
      if(thisCollisionCount > 1) //if it hits a corner go to this code
        TempBullet.number_of_collisions--;
      
      //inside a wall check
      if ((TempBullet.getRealLocation().y - TempBullet.bullet_width * sqrt(2) / 4) - (myWorld.getWalls()[a][1] + myWorld.getWalls()[a][3]) <= -innerRim //makes sure that the tank bullet is within the right vertical segment of the rectangle
      && (TempBullet.getRealLocation().y + TempBullet.bullet_width * sqrt(2) / 4) - (myWorld.getWalls()[a][1]) >= innerRim //makes sure that the tank bullet is within the right vertical segment of the rectangle
      && (TempBullet.getRealLocation().x - TempBullet.bullet_width * sqrt(2) / 4) - (myWorld.getWalls()[a][0] + myWorld.getWalls()[a][2]) <= -innerRim //makes sure that the tank bullet is within the right horizontal segment of the rectangle
      && (TempBullet.getRealLocation().x + TempBullet.bullet_width * sqrt(2) / 4) - (myWorld.getWalls()[a][0]) >= innerRim) //makes sure that the tank bullet is within the right horizontal segment of the rectangle
        TempBullet.prepDelete();
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
  
  public void resetBullets()
  {
    b = new LinkedList<Bullet>();
  }
}
