class EnemyAI
{
  EnemyTank enemyTank;
  private PVector location;
  private PVector velocity_direction;
  private PVector aimLocation;
  private PVector between_vector;
  
  Bullet sudoBullet;
  private boolean target_visible = false;
  private boolean shoot = false;
  
  public EnemyAI(EnemyTank enemy)
  {
    this.enemyTank = enemy;
    location = new PVector(enemy.location.x, enemy.location.y);
    velocity_direction = new PVector();
    aimLocation = myTank.location;
  }
  
  public void updateVelocity() //actual movement AI part
  {
    float current_move_direction_x = enemyTank.velocity.x;//-sin(enemyTank.getTowardMoveDirection());
    float current_move_direction_y = enemyTank.velocity.y;//cos(enemyTank.getTowardMoveDirection());

    
    
    //if target is visible, move towards
    if(target_visible) 
    {
      current_move_direction_x = -sin(enemyTank.getTowardMoveDirection());
      current_move_direction_y = cos(enemyTank.getTowardMoveDirection());
      velocity_direction = new PVector(current_move_direction_x, current_move_direction_y);
    }
    else
      velocity_direction = new PVector(current_move_direction_x, current_move_direction_y);
    velocity_direction.normalize();
    
    //if tank is within 200 ox move backwards
    if(dist(location.x, location.y, myTank.location.x, myTank.location.y) < 200) //if distance between enemy and you is less than 400 move away from them
    {
      velocity_direction.x *= -1;
      velocity_direction.y *= -1;
    }
    
    for(int i = 0; i < enemyController.enemies.size(); i++)
    {
      //draws a vector between each tank and other tanks
      between_vector = new PVector(location.x - enemyController.getEList().get(i).location.x, location.y - enemyController.getEList().get(i).location.y);
      
      if(dist(location.x, location.y, enemyController.getEList().get(i).location.x, enemyController.getEList().get(i).location.y) < 50
      && dist(location.x, location.y, enemyController.getEList().get(i).location.x, enemyController.getEList().get(i).location.y) > 0)
        velocity_direction.add(between_vector); //if the tanks are within 50 px, add opposing velocity
    }
    
    //bullet reaction: move away from the bullet on the path parrallel to line between the center of bullet and center of the tank
    for(int i = 0; i < bulletController.getBList().size(); i++)
    {
      //draws a vector between bullet and tank
      between_vector = new PVector(location.x - bulletController.getBList().get(i).location.x, location.y - bulletController.getBList().get(i).location.y); 
      
      //if bullet is within 50px of size, add vector moving opposite direction
      if(dist(location.x, location.y, bulletController.getBList().get(i).location.x, bulletController.getBList().get(i).location.y) <= enemyTank.tank_width + 50
      && bulletController.getBList().get(i).enemy_collision_allowed)
        velocity_direction.add(between_vector);
    }
    
    
    
    


    velocity_direction.normalize();
    enemyTank.setNewVelocityDirection(velocity_direction);
  }
  
  public void collisionCheck()
  {
    boolean right_collision = false;
    boolean left_collision = false;
    boolean above_collision = false;
    boolean below_collision = false;
    
    //Wall collision checks
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
      if(dist(location.x, location.y, bulletController.getBList().get(i).getRealLocation().x, bulletController.getBList().get(i).getRealLocation().y) 
      <= enemyTank.tank_width / 2 + bulletController.getBList().get(i).getSize() / 2
      && bulletController.getBList().get(i).enemyCollision())
      {  
        enemyTank.tank_health -= bulletController.getBList().get(i).getHealth();
        bulletController.removeBullet(bulletController.getBList().get(i));
      }
    }
  }
  
  public void updateAimLocation()
  {
    aimLocation = myTank.location;
    //aimLocation = new PVector(0, 0);
    enemyTank.setNewAimLocation(aimLocation);
  }
  
  public void shootCheck()
  {
    targetVisible();
    if(target_visible)
      shoot = true;
  }
  
  private void targetVisible() //creates a sudobullet and spawns a given number of iterations of it in a seperate bulletController, if intersects woth tank, shoot
  {
    sudoBullet = enemyTank.getBullet();
    sudoBullet.updateBulletSpeed(35); //sudo bullet goes way faster to do less calculations
    BulletController sudoBulletController = new BulletController();
    sudoBulletController.addBullet(sudoBullet);
    
    for(int i = 0; i < 40; i++) //calculates 40 iterations of the sudobullet
    {      
      sudoBulletController.sudoUpdate();
      if(dist(sudoBullet.location.x, sudoBullet.location.y, myTank.location.x, myTank.location.y) <= sudoBullet.bullet_width * Math.sqrt(2) / 4 + myTank.tank_width * Math.sqrt(2) / 4)
        target_visible = true;
      //sudoBullet.renderBullet(); //helpful for debugging
    }
  }

  public boolean canShoot()
  {
    return shoot;
  }
  
}
