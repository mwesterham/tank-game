  private PlayerTank myTank = new PlayerTank(
  /*tank_width*/60, 
  /*tank_height*/50, 
  /*tank_speed*/2.5, 
  /*bullet_size*/20, 
  /*bullet_speed*/6, 
  /*bullet_health*/2,
  /*bullet_frequency*/24, 
  /*spawn_x*/600, 
  /*spawn_y*/500);
  
  //(tank_width, tank_height, tank_speed, bullet_size, bullet_speed, bullet_frequency in terms of ticks per bullet, spawn_x, spawn_y)
  private boolean move_left = false;
  private boolean move_right = false;
  private boolean move_up = false;
  private boolean move_down = false;
  private boolean shoot_input = false;

  private World myWorld = new World(20);//set how many walls spawn (need at least 1), they are randomly placed
  private BulletController bulletController = new BulletController();
  private TankController enemyController = new TankController(7); //set how many enemies spawn, they are randomly placed

  private int tickCount = 0;
  
void setup() 
{
  size(1900, 900); //the width and height variables not working in tankcontroller for some reason /: BE SURE TO UPDATE IF CHANGING SIZE (typical is 1900, 900)
  frameRate(60);
  myWorld.generateWorld();
}  
  
void draw() 
{
  background(130, 130, 130);
  tickCount++;
  myWorld.displayWorld();
  enemyController.update();
  bulletController.update();//updates the bullets and checks for bullet collisions
  
  myTank.update();
    myTank.renderTank();
    myTank.setTankColor(255, 50, 50);
    myTank.setTurretColor(0, 50, 50);
  
}

void keyReleased()
{
  if(key == 'a')
    move_left = false;
  if (key == 'd')
    move_right = false;
  if(key == 'w')
    move_up = false;
  if (key == 's')
    move_down = false;
}

void keyPressed()
{
  if(key == 'a')
    move_left = true;
  if (key == 'd')
    move_right = true;
  if(key == 'w')
    move_up = true;
  if (key == 's')
    move_down = true;
}


void mousePressed() 
{
  shoot_input = true;
}

void mouseReleased() 
{
  shoot_input = false;
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
