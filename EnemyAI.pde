class EnemyAI
{
  EnemyTank enemyTank;
  private PVector location;
  private PVector velocity_direction;
  private PVector aim_location;
  private PVector between_vector;
  Bullet sudoBullet;
  private boolean target_visible = false; //if it is visible, tank will shoot

  public EnemyAI(EnemyTank enemy)
  {
    this.enemyTank = enemy;
    location = new PVector(enemy.location.x, enemy.location.y);
    velocity_direction = new PVector();
    aim_location = myTank.location;
  }
  
  public void updateVelocity() //actual movement AI part
  {
    float current_move_direction_x = enemyTank.velocity.x;//-sin(enemyTank.getTowardMoveDirection());
    float current_move_direction_y = enemyTank.velocity.y;//cos(enemyTank.getTowardMoveDirection());

    //STANDARD MOVEMENT, ALL TANKS HAVE THIS: DESCRIPTIONS GIVEN BELOW
    
    //if target is visible, move towards tank, also this means that they move towards the tank when they see bullets
    if(target_visible)
      if (dist(location.x, location.y, myTank.location.x, myTank.location.y) >= 200) 
      {
        current_move_direction_x = -sin(enemyTank.getTowardMoveDirection());
        current_move_direction_y = cos(enemyTank.getTowardMoveDirection());
        velocity_direction = new PVector(current_move_direction_x, current_move_direction_y);
      }
      else if (dist(location.x, location.y, myTank.location.x, myTank.location.y) < 150)  //if distance between enemy and you is less than 150 move away from them
      {
        current_move_direction_x = sin(enemyTank.getTowardMoveDirection());
        current_move_direction_y = -cos(enemyTank.getTowardMoveDirection());
        velocity_direction = new PVector(current_move_direction_x, current_move_direction_y);
      }
      else //if inbetween 150 and 200, stay still
      {
        current_move_direction_x = 0;
        current_move_direction_y = 0;
        velocity_direction = new PVector(current_move_direction_x, current_move_direction_y);
      }
    else
      velocity_direction = new PVector(current_move_direction_x, current_move_direction_y);
    velocity_direction.normalize();
   
    //if tank is within 200 px move backwards
    //if(dist(location.x, location.y, myTank.location.x, myTank.location.y) < 200) //if distance between enemy and you is less than 400 move away from them
    //{
    //  velocity_direction.x *= -1;
    //  velocity_direction.y *= -1;
    //}
    
    //draws a vector between each tank and other tanks //if the tanks are within 50 px, add opposing velocity in direction of between vector
    for(int i = 0; i < enemyController.enemies.size(); i++)
    {
      if(dist(location.x, location.y, enemyController.getEList().get(i).location.x, enemyController.getEList().get(i).location.y) < 50
      && dist(location.x, location.y, enemyController.getEList().get(i).location.x, enemyController.getEList().get(i).location.y) > 0)
      {
        between_vector = new PVector(location.x - enemyController.getEList().get(i).location.x, location.y - enemyController.getEList().get(i).location.y);
        velocity_direction.add(between_vector); 
      }
    }
    
    //bullet reaction: move away from the bullet if bullet is within 50px of size
    for(int i = 0; i < bulletController.getBList().size(); i++)
    {
      if(bulletController.getBList().get(i).enemy_collision_allowed
      && dist(location.x, location.y, bulletController.getBList().get(i).location.x, bulletController.getBList().get(i).location.y) <= enemyTank.tank_width + 50)
      {  
        between_vector = new PVector(location.x - bulletController.getBList().get(i).location.x, location.y - bulletController.getBList().get(i).location.y);
        velocity_direction.add(between_vector);
      }
    }
 

    velocity_direction.normalize();
    enemyTank.setNewVelocityDirection(velocity_direction);
  }
  

  
  public void updateAimLocation()
  {
    //int bullets_within_range = 0;
    float closest_distance = 1000;
    //STANDARD AIM LOCATION, ALL TANKS START WITH THIS: AIM AT PLAYER
    aim_location = myTank.location;
    
    //AI LEVEL 2 AIMING: IF AN OPPOSING TEAM BULLET IS WITHIN 20 PX OF SIZE, AIM AT THE CLOSEST ONE
    if(enemyTank.AI_version == 2)
      for(int i = 0; i < bulletController.getBList().size(); i++)
      {
        if(dist(enemyTank.location.x, enemyTank.location.y, bulletController.getBList().get(i).getRealLocation().x, bulletController.getBList().get(i).getRealLocation().y) <= closest_distance
        && bulletController.getBList().get(i).enemy_collision_allowed
        && dist(enemyTank.location.x, enemyTank.location.y, bulletController.getBList().get(i).getRealLocation().x, bulletController.getBList().get(i).getRealLocation().y) <= 20 + enemyTank.tank_width / 2 + bulletController.getBList().get(i).bullet_width / 2)
          closest_distance = dist(enemyTank.location.x, enemyTank.location.y, bulletController.getBList().get(i).getRealLocation().x, bulletController.getBList().get(i).getRealLocation().y);
        
        //if bullet is within 20px of size, set the new aim location
        if(bulletController.getBList().get(i).enemy_collision_allowed
        && dist(enemyTank.location.x, enemyTank.location.y, bulletController.getBList().get(i).getRealLocation().x, bulletController.getBList().get(i).getRealLocation().y) == closest_distance
        && dist(enemyTank.location.x, enemyTank.location.y, bulletController.getBList().get(i).getRealLocation().x, bulletController.getBList().get(i).getRealLocation().y) <= 20 + enemyTank.tank_width / 2 + bulletController.getBList().get(i).bullet_width / 2)
          aim_location = bulletController.getBList().get(i).getRealLocation(); //forcibly overwrites the default aim direction
      }
    enemyTank.aimLocation = aim_location;
  }
  
  private void targetVisibleCheck() //creates a sudobullet and spawns a given number of iterations of it in a seperate bulletController, if intersects woth tank, shoot
  {
    sudoBullet = enemyTank.getBullet();
    float number_of_iterations =  2 / (1 * sudoBullet.bullet_speed * framerate / 80) * 80; //slowstrong enemy does 2 / 4 * 80 = 40 iterations, boss2 does 2 / 2 * 80 = 80 iterations
    if(enemyTank.AI_version == 2) //if AI version2: double the viewing range
      number_of_iterations =  4 / (1 * sudoBullet.bullet_speed * framerate / 80) * 80; //boss1 does 4 / 5 * 80 = 64 iterations
    sudoBullet.updateBulletSpeed(35); //sudo bullet goes way faster to do less calculations
    
    
    BulletController sudoBulletController = new BulletController();
    sudoBulletController.addBullet(sudoBullet);
    
    

    
    for(int i = 0; i < number_of_iterations; i++) //calculates 40 iterations of the sudobullet
    {      
      //STANDARD VISIBILITY DETECTION, ALL TANKS HAVE THIS: IF SUDO BULLET INTERSECTS PLAYER TANK THEN SHOOT
      sudoBulletController.sudoUpdate();
      if(dist(sudoBullet.getRealLocation().x, sudoBullet.getRealLocation().y, myTank.location.x, myTank.location.y) <= sudoBullet.bullet_width * Math.sqrt(2) / 4 + myTank.tank_width * Math.sqrt(2) / 4)
        target_visible = true;
      if(sudoBullet.number_of_collisions > sudoBullet.num_bullet_bounce 
      || sudoBullet.number_of_collisions > 0 && !sudoBullet.collision_bullet_with_wall_allowed) //if it is done bouncing, kill the loop, accounts for any tank bullet who go through walls
        break;

      //AI LEVEL 2 VISIBLITY DETECTION: IF BULLET OF OPPOSING TEAM INTERSECTS SUDO BULLET THEN SHOOT
      if(enemyTank.AI_version == 2) //if the enemyTankAI is 2 run this as well //if sudo bullet is colliding with real bullet target visible
        if(bulletController.getBList().size() > 0)
          for(int a = 0; a < bulletController.getBList().size(); a++)
            if(bulletController.getBList().get(a).enemy_collision_allowed
            && dist(bulletController.getBList().get(a).getRealLocation().x, bulletController.getBList().get(a).getRealLocation().y, sudoBullet.getRealLocation().x, sudoBullet.getRealLocation().y) 
                    <= sudoBullet.bullet_width + bulletController.getBList().get(a).bullet_width)
              target_visible = true;
      //target_visible = false; //turn off shooting
      //sudoBullet.renderBullet(); //helpful for debugging
      
    }

  }  

  public void collisionCheck()
  {
    boolean right_collision = false;
    boolean left_collision = false;
    boolean above_collision = false;
    boolean below_collision = false;
    
    //Wall collision check: only executes if collision with walls is allowed
    if(enemyTank.collision_body_with_wall_allowed)
    {
      for(int i = 0; i < myWorld.getNumWalls(); i++) //loops through all of the walls
      {
      //vertical wall check right_collision
        if ((myWorld.getWalls()[i][0]) - (enemyTank.location.x + enemyTank.right_collision_dist) <= 0 //scans if the collision box overlaps with a rectangle along a vertical line
        && (myWorld.getWalls()[i][0]) - (enemyTank.location.x) >= 0 //Makes sure that this collision box does not affect the other side of the box
        && (enemyTank.location.y - enemyTank.above_collision_dist) - (myWorld.getWalls()[i][1] + myWorld.getWalls()[i][3]) <= 0 //makes sure that the tank is within the right vertical segment of the rectangle
        && (enemyTank.location.y + enemyTank.below_collision_dist) - (myWorld.getWalls()[i][1]) >= 0 //makes sure that the tank is within the right vertical segment of the rectangle
        || (width) - (enemyTank.location.x + enemyTank.right_collision_dist / 2) <= 0) //makes sure the tank cannot go off-screen
          right_collision = true;
      
      //vertical wall check left_collision
        if ((myWorld.getWalls()[i][0] + myWorld.getWalls()[i][2]) - (enemyTank.location.x - enemyTank.left_collision_dist) >= 0 
        && (myWorld.getWalls()[i][0] + myWorld.getWalls()[i][2]) - (enemyTank.location.x) <= 0
        && (enemyTank.location.y - enemyTank.above_collision_dist) - (myWorld.getWalls()[i][1] + myWorld.getWalls()[i][3]) <= 0 
        && (enemyTank.location.y + enemyTank.below_collision_dist) - (myWorld.getWalls()[i][1]) >= 0
        || (enemyTank.location.x - enemyTank.left_collision_dist / 2) <= 0)
          left_collision = true;
      
      //horizontal wall check above_collision
        if ((myWorld.getWalls()[i][1] + myWorld.getWalls()[i][3]) - (enemyTank.location.y - enemyTank.above_collision_dist) >= 0 
        && (myWorld.getWalls()[i][1] + myWorld.getWalls()[i][3]) - (enemyTank.location.y) <= 0
        && (enemyTank.location.x - enemyTank.left_collision_dist) - (myWorld.getWalls()[i][0] + myWorld.getWalls()[i][2]) <= 0 
        && (enemyTank.location.x + enemyTank.right_collision_dist) - (myWorld.getWalls()[i][0]) >= 0
        || (enemyTank.location.y - enemyTank.tank_height / 2) <= 0)
          above_collision = true;
      
      //horizontal wall check below_collision
        if ((myWorld.getWalls()[i][1]) - (enemyTank.location.y + enemyTank.below_collision_dist) <= 0 
        && (myWorld.getWalls()[i][1]) - (enemyTank.location.y) >= 0
        && (enemyTank.location.x - enemyTank.left_collision_dist) - (myWorld.getWalls()[i][0] + myWorld.getWalls()[i][2]) <= 0 
        && (enemyTank.location.x + enemyTank.right_collision_dist) - (myWorld.getWalls()[i][0]) >= 0
        || (height) - (enemyTank.location.y + enemyTank.tank_height / 2) <= 0)
          below_collision = true;
      }
    }
    else //if collision with walls not allowed then only check side walls
    {
      if((width) - (enemyTank.location.x + enemyTank.right_collision_dist / 2) <= 0)
        right_collision = true;
      if((enemyTank.location.x - enemyTank.left_collision_dist / 2) <= 0)
        left_collision = true;
      if((enemyTank.location.y - enemyTank.tank_height / 2) <= 0)
        above_collision = true;
      if((height) - (enemyTank.location.y + enemyTank.tank_height / 2) <= 0)
        below_collision = true;
    }
    
    
    if(right_collision)
      enemyTank.location.x -= enemyTank.tank_speed;
    if(left_collision)
      enemyTank.location.x += enemyTank.tank_speed;
    if(above_collision)
      enemyTank.location.y += enemyTank.tank_speed;
    if(below_collision)
      enemyTank.location.y -= enemyTank.tank_speed;
    
    //bullet collision with tank check
    for(int i = 0; i < bulletController.getBList().size(); i++)
    {
      if(bulletController.getBList().get(i).enemy_bullet_collide_allowed
      && dist(location.x, location.y, bulletController.getBList().get(i).getRealLocation().x, bulletController.getBList().get(i).getRealLocation().y) 
      <= enemyTank.tank_width / 2 + bulletController.getBList().get(i).bullet_width / 2)
      {  
        float damage = enemyTank.tank_health;
        if(bulletController.getBList().get(i).bullet_health > 0)
          enemyTank.tank_health -= bulletController.getBList().get(i).bullet_health;
        bulletController.getBList().get(i).bullet_health -= damage;
        //bulletController.removeBullet(bulletController.getBList().get(i));
      }
    }
  }
}
