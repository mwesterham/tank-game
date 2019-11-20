  private UI myUI = new UI(0);
  private boolean runGame = false;
  //private boolean pauseGame = false;
  private boolean displayGameOver = false;
  private boolean displayYouWon = false;
  private boolean displayHome = true;
  private boolean displayLevelSelect = false;
  private boolean displayAbout = false;
  private boolean displayControls = false;
  
  private PlayerTank myTank;
  private boolean move_left = false;
  private boolean move_right = false;
  private boolean move_up = false;
  private boolean move_down = false;
  private boolean shoot_input = false;

  private World myWorld = new World();//set how many walls spawn (need at least 1), they are randomly placed
  private BulletController bulletController = new BulletController();
  private TankController enemyController = new TankController(0, 0); //set how many enemies spawn, they are randomly placed (standardEnemy, strongSlowEnemy) PS this is only used to instantiate
  
  public int tickCount = 0;
  
void setup() 
{
  size(1900, 900); //the width and height variables not working in tankcontroller for some reason /: BE SURE TO UPDATE IF CHANGING SIZE (typical is 1900, 900)
  frameRate(60);
  
  myTank  = new PlayerTank(
  /*tank_width*/75, 
  /*tank_height*/75, 
  /*tank_health*/4.1, //typically 4.1
  /*tank_speed*/2, 
  /*bullet_size*/20, 
  /*bullet_speed*/4, //typically 4
  /*bullet_health/pentration/damage*/1,//typically 1
  /*bullet_frequency*/36, //typically 36
  /*number of times bullets bounce*/1,
  /*spawn_x*/600, 
  /*spawn_y*/500);
  
  myTank.updateCollisionPermissions(
  /*player_shot_collision_with_body allowed*/ true, 
  /*enemy_shot_collision_with_body allowed*/ true, 
  /*player_bullet_collide allowed*/ false, 
  /*enemy_bullet_collide allowed*/ true,
  /*collision_bullet_with_wall_allowed*/ true);
  
  //myTank.setBulletSpawnFromLength(14);//add extra distance
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
    if(displayControls)
      myUI.displayControls();
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
  if(key == 'a' || key == 'A')
    move_left = false;
  if (key == 'd' || key == 'D')
    move_right = false;
  if(key == 'w' || key == 'W')
    move_up = false;
  if (key == 's' || key == 'S')
    move_down = false;
}

void keyPressed()
{
  if(key == 'a' || key == 'A')
    move_left = true;
  if (key == 'd' || key == 'D')
    move_right = true;
  if(key == 'w' || key == 'W')
    move_up = true;
  if (key == 's' || key == 'S')
    move_down = true;
  if (key == 'p' || key == 'P' && runGame)
    myTank.setTankHealthZero();


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
    displayControls = false;
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
      case "Controls":
        displayControls = true;
        break;
      case "Game Over":
        displayGameOver = true;
        break;
      case "You Won":
        displayYouWon = true;
        break;
    }
    
    switch (myUI.trigger_int)//navigates to a screen using the click placement and int associated with it
    {
      case -2:
        myWorld.generateTestGrounds();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case -1:
        myWorld.generateRandomWorld(20, 3, 2); //(num_of_walls, num_of_regular enemies, num_of_slowstrong)
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      //case 0:
        //myUI.setTriggerText("Home Page");
        //break;
      case 1:
        myWorld.generateLevel1();
        myUI = new UI(myUI.trigger_int + 1);//makes it so that the next button references the level ahead of it
        runGame = true;
        break;
      case 2:
        myWorld.generateLevel2();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 3:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 4:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 5:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 6:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 7:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 8:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 9:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 10:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 11:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 12:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 13:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 14:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 15:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 16:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 17:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 18:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 19:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 20:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 21:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 22:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
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
