  private UI myUI = new UI();
  private boolean runGame = false;
  private boolean displayGameOver = false;
  private boolean displayYouWon = false;
  private boolean displayHome = true;
  private boolean displayLevelSelect = false;
  
  private PlayerTank myTank = new PlayerTank(
  /*tank_width*/60, 
  /*tank_height*/50, 
  /*tank_health*/5.1,
  /*tank_speed*/2.5, 
  /*bullet_size*/20, 
  /*bullet_speed*/4, 
  /*bullet_health/pentration/damage*/1,
  /*bullet_frequency*/24, 
  /*number of times bullets bounce*/1,
  /*spawn_x*/600, 
  /*spawn_y*/500);

  private boolean move_left = false;
  private boolean move_right = false;
  private boolean move_up = false;
  private boolean move_down = false;
  private boolean shoot_input = false;

  private World myWorld = new World(10);//set how many walls spawn (need at least 1), they are randomly placed
  private BulletController bulletController = new BulletController();
  private TankController enemyController = new TankController(5, 3); //set how many enemies spawn, they are randomly placed (standardEnemy, strongSlowEnemy)

  private int tickCount = 0;
  
void setup() 
{
  size(1900, 900); //the width and height variables not working in tankcontroller for some reason /: BE SURE TO UPDATE IF CHANGING SIZE (typical is 1900, 900)
  frameRate(60);
}  
  
void draw() 
{
  background(130, 130, 130);
  if(!runGame)
  {
    //displays the screen indicated
    if(displayHome)
      myUI.displayHome();
    if(displayLevelSelect)
      myUI.displayLevelSelect();
    if(displayGameOver)
      myUI.displayGameOver();
    if(displayYouWon)
      myUI.displayYouWon();
    
    myWorld.generateWorld();
    myTank.resetTank();
    enemyController.resetEnemies();
    enemyController = new TankController(1, 0);
    bulletController.resetBullets();
    bulletController = new BulletController();
  }
  
  if(runGame)
  {
    
    tickCount++;
    myWorld.displayWorld();
    enemyController.update();
    bulletController.update();//updates the bullets and checks for bullet collisions
    
    myTank.update();
    if(myTank.tank_health <= 0)
    {
      runGame = false;
      displayGameOver = true;
    }
    if(enemyController.enemies.size() == 0)
    {
      runGame = false;
      displayYouWon = true;
    }
    myTank.renderTank();
    myTank.setTankColor(255, 50, 50);
    myTank.setTurretColor(0, 50, 50);

  }
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
  if(runGame)
    shoot_input = true;
  if(!runGame)
  {
    displayHome = false;//sets all the screens to not displaying
    displayLevelSelect = false;
    displayGameOver = false;
    displayYouWon = false;
    runGame = false;
    System.out.print(myUI.clickArea());
    switch (myUI.clickArea())//navigates a series of screens by detecting click placement
    {
      case "Display Home":    
        displayHome = true;
        break;
      case "Level Select":
        displayLevelSelect = true;
        break;
      case "Test":
        displayHome = true;
        break;
      case "Return to home":
        displayHome = true;
        break;
      case "Start Game":
        runGame = true;
        break;
    }
  }
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
