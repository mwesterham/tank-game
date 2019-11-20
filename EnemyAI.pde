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
    location = new PVector(enemy.getPosition().x, enemy.getPosition().y);
    velocity_direction = new PVector();
    aimLocation = myTank.getPosition();
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
    
    //if tank is within 200 ox move backwards
    if(dist(location.x, location.y, myTank.location.x, myTank.location.y) < 200) //if distance between enemy and you is less than 400 move away from them
    {
      velocity_direction.x *= -1;
      velocity_direction.y *= -1;
    }
    
    for(int i = 0; i < enemyController.enemies.size(); i++)
    {
      //draws a vector between each tank and other tanks
      between_vector = new PVector(location.x - enemyController.getEList().get(i).getPosition().x, location.y - enemyController.getEList().get(i).getPosition().y);
      
      if(dist(location.x, location.y, enemyController.getEList().get(i).getPosition().x, enemyController.getEList().get(i).getPosition().y) < 50
      && dist(location.x, location.y, enemyController.getEList().get(i).getPosition().x, enemyController.getEList().get(i).getPosition().y) > 0)
        velocity_direction.add(between_vector); //if the tanks are within 50 px, add opposing velocity
    }
    
    //bullet reaction: move away from the bullet on the path parrallel to line between the center of bullet and center of the tank
    for(int i = 0; i < bulletController.getBList().size(); i++)
    {
      //draws a vector between bullet and tank
      between_vector = new PVector(location.x - bulletController.getBList().get(i).getPosition().x, location.y - bulletController.getBList().get(i).getPosition().y); 
      
      //if bullet is within 50px of size, add vector moving opposite direction
      if(dist(location.x, location.y, bulletController.getBList().get(i).getPosition().x, bulletController.getBList().get(i).getPosition().y) <= enemyTank.tank_width + 50
      && bulletController.getBList().get(i).enemy_collision_allowed)
        velocity_direction.add(between_vector);
    }

    velocity_direction.normalize();
    enemyTank.setNewVelocityDirection(velocity_direction);
  }
  
  public void updateAimLocation()
  {
    aimLocation = myTank.getPosition();
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
