  /*Sound Stuff
  import processing.sound.*; //install the sound library from processing
  private String path;
  SoundFile background_music;
  SoundFile shot_sound;
  //*/
  
  private UI myUI;
  private boolean runGame = false;
  private boolean displayGameOver = false;
  private boolean displayUpgrades = false;
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
  private boolean upgrades_on;
  private boolean keep_upgrades;
  public int tickCount = 0;
  public int click_protection_timer = 0;
  private int framerate;
  private int FRAMERATE;
  
void setup() 
{
  /*Sound Stuff

  //Sound setup
  path = sketchPath("Audio Files/TankGameBoringMusic_Trebel.mp3"); 
  background_music = new SoundFile(this, path);
  background_music.amp(.2);
  
  path = sketchPath("Audio Files/Shot_Sound.mp3"); 
  shot_sound = new SoundFile(this, path); //in playertank and enemy tank shoot() methods, be sure to comment out if you do not have the library installed
  shot_sound.amp(1);
  
  background_music.loop();
  //*/

  //GAME SETUP
  //size(1900, 900); //for testing game breaking stuff
  fullScreen();
  framerate = 25; // 25, how many frames the game thinks the game is running at, cannot go below 3 
  FRAMERATE = 30; //30, actual framerate of the game, base frame rate is 80 fps
  frameRate(FRAMERATE); 
  //speed of the game is dependent on ratio between the two framerates: FRAMERATE / framerate = game speed
  //but make sure your FRAMERATE is within your cpu's capabilities 
 
  myUI = new UI(0); 
  
  myTank  = new PlayerTank(
  /*tank_width*/75, //typically 75
  /*tank_height*/68, 
  /*tank_health*/3 + .3*(0), //typically 3, 0 intial upgrades
  /*tank_health_regeneration*/0, //typically 0, .25 could be original
  /*Number of lives*/3,
  /*tank_speed*/2 + .2*(0), //typically 2, 0 intial upgrades
  /*bullet_size*/20 + 2*(0), //typically 20, 0 intial upgrades
  /*bullet_speed*/4 + .4*(0), //typically 4, 0 intial upgrades
  /*bullet_health/pentration/damage*/1 + .1*(0),//typically 1
  /*bullet_frequency*/48 - 2 * (0), //typically 48, cannot go below 3 since (int)(80 / framerate) = 0
  /*number of times bullets bounce*/1,
  /*spawn_x*/600, 
  /*spawn_y*/500,
  /*Tank Color           r/g/b*/8, 247, 254,
  /*Tank Outline Color   r/g/b*/0, 0, 0,
  /*Tank Stroke Weight*/5,
  /*Turret Color         r/g/b*/0, 0, 0,
  /*Turret Outline Color r/g/b*/0, 0, 0,
  /*Turret Stroke Weight*/3);
  myTank.regeneration_kickin = 10;
  
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
  tickCount++;
  click_protection_timer--;
  background(background_color[0], background_color[1], background_color[2]);
  if(!runGame)
  {
    //if(start_home_music)
    //  background_music.loop();
    //start_home_music = false;
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
    if(displayUpgrades)
      myUI.displayUpgrades();
    if(displayYouWon)
      myUI.displayYouWon();

  }

  if(runGame)
  {  

    //if(!(myUI.trigger_int == -1) && !(myUI.trigger_int == 0)) //discludes random world and test grounds
    //  background_music.stop();
    
    upgrades_on = true;
    keep_upgrades = false;
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
  if ((key == 'p' || key == 'P') && runGame)
    myTank.setTankHealthNegative();
}

void mousePressed() 
{
  if(runGame)
    shoot_input = true;
  if(!runGame && click_protection_timer <= 0)
  {
    if(upgrades_on)
    {
      switch (myUI.upgrade_text)
      {
        case "Return to Home Page":
          if (upgrades_on && !keep_upgrades) 
            myTank.resetEntireTank();
          break;
        case "No Upgrade":
          break;
        case "TankSpeed +2":
          myTank.addTankSpeed(.2);
          break;
        case "TankHealth +3":
          myTank.addTankHealth(.3); 
          break;
        case "BulletSpeed +4":
          myTank.addBulletSpeed(.4); 
          break;
        case "BulletDamage +1":
          myTank.addBulletPenetration(.1); 
          break;
        case "BulletSize +2":
          myTank.addBulletSize(2); 
          break;
        case "BulletSize -2":
          myTank.addBulletSize(-2); 
          break;
        case "BulletFrequency -2 tick/shot":
          myTank.increaseBulletFrequency(-2); //reduce by 2 tick, original 36, cannot go below 3
          break;
        case "BulletBounce +1 (-20% everything else)":
          myTank.addBulletBounce(1);
          myTank.addTankSpeed(-.4); //decreases 20 percent of original
          myTank.addTankHealth(-.6); //decreases 20 percent of original
          myTank.addBulletSpeed(-.8); //decreases 20 percent of original
          myTank.addBulletPenetration(-.2); //decreases 20 percent of original
          myTank.addBulletSize(-2); //decreases by 10 percent
          myTank.increaseBulletFrequency(4); //increases by 8 ticks per shot
          break;
        case "Lives +1":
          myTank.lives++;
          break;
      }
      if(myTank.bullet_frequency < 3) //minimum is 1
        myTank.bullet_frequency = 3;
    }
    
    
    //on click: sets everything to not displaying
    displayHome = false;
    displayAbout = false;
    displayControls = false;
    displayLevelSelect = false;
    displayGameOver = false;
    displayUpgrades = false;
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
      case "Upgrades":
        displayUpgrades = true;
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
        myUI = new UI(myUI.trigger_int + 1);//makes it so that the next button references the level ahead of it
        runGame = true;
        break;
      case 3:
        myWorld.generateLevel3();
        myUI = new UI(myUI.trigger_int + 1);//makes it so that the next button references the level ahead of it
        runGame = true;
        break;
      case 4:
        myWorld.generateLevel4();
        myUI = new UI(myUI.trigger_int + 1);//makes it so that the next button references the level ahead of it
        runGame = true;
        break;
      case 5:
        myWorld.generateLevel5();
        myUI = new UI(myUI.trigger_int + 1);//makes it so that the next button references the level ahead of it
        runGame = true;
        break;
      case 6:
        myWorld.generateLevel6();
        myUI = new UI(myUI.trigger_int + 1);//makes it so that the next button references the level ahead of it
        runGame = true;
        break;
      case 7:
        myWorld.generateLevel7();
        myUI = new UI(myUI.trigger_int + 1);//makes it so that the next button references the level ahead of it
        runGame = true;
        break;
      case 8:
        myWorld.generateLevel8();
        myUI = new UI(myUI.trigger_int + 1);//makes it so that the next button references the level ahead of it
        runGame = true;
        break;
      case 9:
        myWorld.generateLevel9();
        myUI = new UI(myUI.trigger_int + 1);//makes it so that the next button references the level ahead of it
        runGame = true;
        break;
      case 10:
        myWorld.generateLevel10();
        myUI = new UI(myUI.trigger_int + 1);//makes it so that the next button references the level ahead of it
        runGame = true;
        break;
      case 11:
        myWorld.generateLevel11();
        myUI = new UI(myUI.trigger_int + 1);//makes it so that the next button references the level ahead of it
        runGame = true;
        break;
      case 12:
        myWorld.generateLevel12();
        myUI = new UI(myUI.trigger_int + 1);//makes it so that the next button references the level ahead of it
        runGame = true;
        break;
      case 13:
        myWorld.generateLevel12();
        myUI = new UI(myUI.trigger_int + 1);//makes it so that the next button references the level ahead of it
        runGame = true;
        break;
      case 14:
        myWorld.generateLevel12();
        myUI = new UI(myUI.trigger_int + 1);//makes it so that the next button references the level ahead of it
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
