  ///*Sound Stuff
  import processing.sound.*; //install the sound library from processing
  private String path;
  SoundFile background_music;
  SoundFile shot_sound;
  SoundFile level_background_music1;
  SoundFile level_background_music2;
  SoundFile level_background_music3;
  SoundFile level_background_music4;
  //*/
  
  //updated AIv2 to only aim at the closest bullet within 20 px of size
  
  private UI myUI;
  private boolean runGame = false;
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

  private World myWorld = new World(); //just declares the world name, nothing else
  private BulletController bulletController = new BulletController();
  private TankController enemyController = new TankController(); //set how many enemies spawn, they are randomly placed (standardEnemy, strongSlowEnemy) PS this is only used to instantiate
  
  private int[] background_color = {50, 50, 50};
  private boolean start_home_music = true;
  public int tickCount = 0;
  
void setup() 
{
  myUI = new UI(0); //instantiate it here so it can inherit the width and height
  ///*Sound Stuff

  //Sound setup
  path = sketchPath("Audio Files/TankHomeMusic.mp3");
  background_music = new SoundFile(this, path);
  path = sketchPath("Audio Files/TankLevelMusic1_edited.mp3");  
  level_background_music1 = new SoundFile(this, path);
  path = sketchPath("Audio Files/TankLevelMusic2_edited.mp3");
  level_background_music2 = new SoundFile(this, path);
  path = sketchPath("Audio Files/TankLevelMusic3_edited.mp3");
  level_background_music3 = new SoundFile(this, path);
  path = sketchPath("Audio Files/TankLevelMusic4_edited.mp3");
  level_background_music4 = new SoundFile(this, path);
  
  path = sketchPath("Audio Files/Shot_Sound.mp3"); 
  shot_sound = new SoundFile(this, path); //in playertank and enemy tank shoot() methods, be sure to comment out if you do not have the library installed
  
  //*/
  
  //GAME SETUP
  //size(1900, 900); //for testing game breaking stuff
  fullScreen();
  frameRate(80); //60fps for testing, 80fps for gameplay, 120fps for fast speed, 240fps for insane speed
  
  myTank  = new PlayerTank(
  /*tank_width*/75, //typically 75
  /*tank_height*/75, 
  /*tank_health*/4.1, //typically 4.1
  /*tank_speed*/2, //typically 2
  /*bullet_size*/20, //typically 20
  /*bullet_speed*/4, //typically 4
  /*bullet_health/pentration/damage*/1,//typically 1
  /*bullet_frequency*/36, //typically 36
  /*number of times bullets bounce*/1,
  /*spawn_x*/600, 
  /*spawn_y*/500,
  /*Tank Color           r/g/b*/8, 247, 254,
  /*Tank Outline Color   r/g/b*/0, 0, 0,
  /*Tank Stroke Weight*/5,
  /*Turret Color         r/g/b*/0, 0, 0,
  /*Turret Outline Color r/g/b*/0, 0, 0,
  /*Turret Stroke Weight*/3);
  
  myTank.updateCollisionPermissions(
  /*player_shot_collision_with_body allowed*/ false, 
  /*enemy_shot_collision_with_body allowed*/ true, 
  /*player_bullet_collide allowed*/ false, 
  /*enemy_bullet_collide allowed*/ true,
  /*collision_bullet_with_wall_allowed*/ true,
  /*collision_body_with_wall_allowed*/ true);
  
  //Only turn on if self-damage is on: //myTank.setBulletSpawnFromLength(14);//add or subtract extra distance from turret length
}  
  
void draw() 
{
  background(background_color[0], background_color[1], background_color[2]);
  if(!runGame)
  {
    if(start_home_music)
      background_music.loop();
    start_home_music = false;
    //System.out.println(myUI.trigger_text); //for testing the UI
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

  if(runGame)
  {  
    if(!(myUI.trigger_int == -1) && !(myUI.trigger_int == 0)) //discludes random world and test grounds
      background_music.stop();
    myUI.runGame();
    myUI.endGameCheck();//if player health reaches zero or num of enemies reach zero, resets the game
  }
}

void keyReleased()
{
  if(key == 'a' || key == 'A' || keyCode == LEFT)
    move_left = false;
  if (key == 'd' || key == 'D' || keyCode == RIGHT)
    move_right = false;
  if(key == 'w' || key == 'W' || keyCode == UP)
    move_up = false;
  if (key == 's' || key == 'S' || keyCode == DOWN)
    move_down = false;
}

void keyPressed()
{
  if(key == 'a' || key == 'A' || keyCode == LEFT)
    move_left = true;
  if (key == 'd' || key == 'D' || keyCode == RIGHT)
    move_right = true;
  if(key == 'w' || key == 'W' || keyCode == UP)
    move_up = true;
  if (key == 's' || key == 'S' || keyCode == DOWN)
    move_down = true;
  if (key == 'p' || key == 'P' && runGame)
    myTank.setTankHealthZero();
  //System.out.println(frameCount);
}


void mousePressed() 
{
  if(runGame)
    shoot_input = true;
  if(!runGame)
  {
    //on click: sets everything to not displaying
    displayHome = false;
    displayAbout = false;
    displayControls = false;
    displayLevelSelect = false;
    displayGameOver = false;
    displayYouWon = false;
    runGame = false;
    
    switch (myUI.trigger_text)//navigates to a new screen using the click placement
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
    
    switch (myUI.trigger_int)//navigates to a new game using the click placement and int associated with it
    {
      case -2:
        myWorld.generateTestGrounds();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case -1:
        myWorld.generateRandomWorld(20, 0, 3, 2, 0, 0); //(num_of_walls, standstill, regular enemies, slowstrong, boss1, boss2)
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
        myWorld.generateLevel4();
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
      case 23:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);
        runGame = true;
        break;
      case 24:
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
