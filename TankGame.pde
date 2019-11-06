  private PlayerTank myTank = new PlayerTank(60, 50, 2.5, 20, 6, 600, 500);//(tank_width, tank_height, tank_speed, bullet_size, bullet_speed, spawn_x, spawn_y)
  private EnemyTank enemy1 = new EnemyTank(100, 100, 1, 50, 2, 100, 200);//(tank_width, tank_height, tank_speed, bullet_size, bullet_speed, spawn_x, spawn_y)
  private EnemyTank enemy2 = new EnemyTank(100, 100, 1, 30, 4, 1000, 900);
  private EnemyTank enemy3 = new EnemyTank(100, 100, 1, 30, 4, 0, 900);
  private EnemyTank enemy4 = new EnemyTank(100, 100, 1, 30, 4, 0, 0);
  private EnemyTank enemy5 = new EnemyTank(100, 100, 1, 30, 4, 1800, 500);
  private EnemyTank enemy6 = new EnemyTank(100, 100, 1, 30, 4, 1000, 500);
  private EnemyAI eai = new EnemyAI(enemy1, myTank);//AI applied to enemy1 targeting myTank

  private World myWorld = new World(30);
  private Controller myController = new Controller(myTank);
  private boolean move_left = false;
  private boolean move_right = false;
  private boolean move_up = false;
  private boolean move_down = false;
  private int tickCount = 0;
  
void setup() 
{
  size(1900, 900);
  frameRate(60);
  myWorld.generateWorld();
}

void draw() 
{
  tickCount++;
  if (move_left)
  {
    myTank.updatePosition();
  }
  if (move_right)
  {
    myTank.updatePosition();
  }
  if (move_up)
  {
    myTank.updatePosition();
  }
  if (move_down)
  {
    myTank.updatePosition();
  }
  background(130, 130, 130);
  myWorld.displayWorld();
  myTank.renderTank();
    myTank.setTankColor(255, 50, 50);
    myTank.setTurretColor(0, 50, 50);
  myTank.collisionCheck();
  
  enemy1.renderTank(myTank.getPosition()[0], myTank.getPosition()[1]); //aiming at the player's position
    enemy1.setTankColor(255, 255, 255);
    enemy1.setTurretColor(240, 90, 0);
    enemy1.updatePosition();
  enemy2.renderTank(myTank.getPosition()[0], myTank.getPosition()[1]);
  enemy3.renderTank(myTank.getPosition()[0], myTank.getPosition()[1]);
  enemy4.renderTank(myTank.getPosition()[0], myTank.getPosition()[1]);
  enemy5.renderTank(myTank.getPosition()[0], myTank.getPosition()[1]);
  enemy6.renderTank(myTank.getPosition()[0], myTank.getPosition()[1]);
  
  enemy1.collisionCheck();
  enemy2.collisionCheck();
  enemy3.collisionCheck();
  enemy4.collisionCheck();
  enemy5.collisionCheck();
  enemy6.collisionCheck();
  
  eai.shootCheck();//AI of enemy1 checks if its safe to shoot
  boolean shootON = false;
  if(eai.canShoot())
    if(tickCount % 64 == 0 && shootON)
    {
      enemy1.shoot();
      enemy2.shoot();
      enemy3.shoot();
      enemy4.shoot();
      enemy5.shoot();
      enemy6.shoot();
    }
  myController.update();//updates the bullets and checks for bullet collisions
  myController.render();//renders the bullets
}

void keyReleased()
{
  if(key == 'a')
  {
    move_left = false;
  }
  if (key == 'd')
  {
    move_right = false;
  }
  if(key == 'w')
  {
    move_up = false;
  }
  if (key == 's')
  {
    move_down = false;
  }
}

void keyPressed()
{
  if(key == 'a')
  {
    move_left = true;
  }
  if (key == 'd')
  {
    move_right = true;
  }
  if(key == 'w')
  {
    move_up = true;
  }
  if (key == 's')
  {
    move_down = true;
  }
}

void mousePressed() 
{
  myTank.shoot();
}

void mouseReleased() 
{

}

/*
mouseX
mouseY
pmouseX
pmouseY
mousePressed
mousePressed()
mouseReleased()
mouseMoved()
mouseDragged()
mouseButton
mouseWheel()
*/
