  private UI myUI = new UI();
  private boolean runGame = false;
  private boolean displayGameOver = false;
  private boolean displayYouWon = false;
  private boolean displayHome = true;
  private boolean displayLevelSelect = false;
  private boolean displayAbout = false;
  
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

  private World myWorld = new World();//set how many walls spawn (need at least 1), they are randomly placed
  private BulletController bulletController = new BulletController();
  private TankController enemyController = new TankController(0, 0); //set how many enemies spawn, they are randomly placed (standardEnemy, strongSlowEnemy) PS this is only used to instantiate

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
    //System.out.println(myUI.trigger_text);
    if(displayHome)//displays the screen indicated
      myUI.displayHome();
    if(displayAbout)
      myUI.displayAbout();
    if(displayLevelSelect)
      myUI.displayLevelSelect();
    if(displayGameOver)
      myUI.displayGameOver();
    if(displayYouWon)
      myUI.displayYouWon();
  }

  if(runGame) //runs the game
  {  
    myUI.runGame();
    myUI.endGameCheck();//if player health reaches zero or num of enemies reach zero, resets the game
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
    //now displaying none of the pages
    displayHome = false;
    displayAbout = false;
    displayLevelSelect = false;
    displayGameOver = false;
    displayYouWon = false;
    runGame = false;
    
    switch (myUI.trigger_text)//navigates to a screen using the click placement
    {
      case "Home Page":
        displayHome = true;
        break;
      case "Level Select":
        displayLevelSelect = true;
        break;
      case "About":
        displayAbout = true;
        break;
      case "Game Over":
        displayGameOver = true;
        break;
      case "You Won":
        displayYouWon = true;
        break;
      case "Start Game": //start game is default random world and with non-randomized tanks
        myWorld.generateRandomWorld(10, 2, 1); //(num_of_walls, num_of_regular enemies, num_of_slowstrong)
        runGame = true;
        break;
      case "TestGrounds":
        myWorld.generateTestGrounds();
        runGame = true;
        break;
      case "Level1": //start game is default random world and with non-randomized tanks
        myWorld.generateLevel1();
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
