import java.util.Random;
class World
{
  private int num_of_walls;
  private float[][] walls;
  private int[] wall_color = {0, 0, 0};
  private int[] wall_outline_color = {0, 0, 0};
  
  private int i;
  private float wall_x;
  private float wall_y;
  private float wall_width;
  private float wall_height;
  private float spawn_x;
  private float spawn_y;
  
  public World()
  {
    
  }
  
  public void displayWorld()
  {
    fill(wall_color[0], wall_color[1], wall_color[2]);
    stroke(wall_outline_color[0], wall_outline_color[1], wall_outline_color[2]);
    for(int i = 0; i < num_of_walls; i++)
      rect(walls[i][0], walls[i][1], walls[i][2], walls[i][3]);
      
    fill(255, 255, 255);
    textSize(20);
    text("Lives: " + myTank.lives, 1600, 20);
    
    if(myUI.trigger_int == 2) //trigger int = 2 when on level 1
    {
      textSize(40);
      text("Movement", 120, 250);
      text("    Up: W", 120, 300);
      text("    Down: S", 120, 350);
      text("    Left: A", 120, 400);
      text("    Right: D", 120, 450);
      text("Shooting/Aiming", 120, 550);
      text("    Aim: mouse", 120, 600);
      text("    Shoot: mouse click", 120, 650);
      text("Restart level: p", 120, 750);
    }
  }
  
  public void setWallColor(int red, int green, int blue)
  {
    wall_color[0] = red;
    wall_color[1] = green;
    wall_color[2] = blue;
  }
  
  public void setWallOutlineColor(int red, int green, int blue)
  {
    wall_outline_color[0] = red;
    wall_outline_color[1] = green;
    wall_outline_color[2] = blue;
  }
  
  public float[][] getWalls()
  {
    return walls;
  }
  
  public int getNumWalls()
  {
    return num_of_walls; 
  }
  
  
  
  
  //In these worlds, I built them manually so I divided by my screen size 1920 x 1080 in order to keep it ratio-ed on any full screen
  public void generateTestGrounds()
  {
    myUI.resetGame();
    this.num_of_walls = 6;
    float[][] walls = new float[num_of_walls][4]; 
    this.walls = walls;

    {i = 0; //left border
    wall_x = 0;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 1; //right border
    wall_x = 1820;
    wall_y = 0;
    wall_width = 100; //max is 1920
    wall_height = 1080; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 2; //top border
    wall_x = 0;
    wall_y = 0;
    wall_width = 1920; //max is 1920
    wall_height = 100; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }    
    
    {i = 3; //bottom border
    wall_x = 0;
    wall_y = 980;
    wall_width = 1920; //max is 1920
    wall_height = 100; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 4;
    wall_x = 400;
    wall_y = 0;
    wall_width = 100; //max is 1920
    wall_height = 100; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 5;
    wall_x = 400;
    wall_y = 400;
    wall_width = 100; //max is 1920
    wall_height = 100; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    myTank.setSpawn(950, 450);

    //for(int i = 0; i < 2; i++) //used for lag testing
    enemyController.addDummyEnemy(550, 500);
    //enemyController.addBossEnemy2(850, 500);
    //enemyController.addBossEnemy1(150, 550);
    //enemyController.addNoMovingEnemy(150, 550);
    //enemyController.addStandardEnemy(150, 550);
    //enemyController.addSlowStrongEnemy(150, 550);
    //enemyController.addSniperEnemy(200, 200);
    //enemyController.addMinionSpawnerEnemy(1400, 500);
    //enemyController.addBurstShotEnemy(1400, 500);
    bulletController = new BulletController(); //MUST reinstantiate the bullet controller, not entirely sure why though...
  }  
  
  public void generateRandomWorld(int number_of_walls, int num_standstill_enemies, int num_regular_enemies, int num_slowstrong_enemies, int num_boss1_enemy, int num_boss2_enemy)
  {
    myUI.resetGame();
    this.num_of_walls = number_of_walls;
    float[][] walls = new float[num_of_walls][5]; 
    this.walls = walls;
    
    Random rand = new Random();
    for(int i = 0; i < this.num_of_walls; i++)
    {
        //System.out.println(height);  
        walls[i][0] = rand.nextInt(width); //x-coord
        walls[i][1] = rand.nextInt(height); //y cord
        walls[i][2] = rand.nextInt(100) + 50; //width will be between 50 and 150 px
        walls[i][3] = rand.nextInt(100) + 50; //length will be between 50 and 150 px
    }
    myTank.setSpawn(rand.nextInt(width), rand.nextInt(height));
    enemyController = new TankController(num_standstill_enemies, num_regular_enemies, num_slowstrong_enemies, num_boss1_enemy, num_boss2_enemy);
    //enemyController.addDummyEnemy(500, 500);
    bulletController = new BulletController(); //MUST reinstantiate the bullet controller, not entirely sure why though...
  }
  
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel1()
  {
    myUI.resetGame();
    this.num_of_walls = 5;
    float[][] walls = new float[5][4];
    this.walls = walls;
    background_color[0] = 20;
    background_color[1] = 50;
    background_color[2] = 20;

    {i = 0;
    wall_x = 0;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 1;
    wall_x = 1820;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 2;
    wall_x = 0;
    wall_y = 0;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 3;
    wall_x = 0;
    wall_y = 980;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 4;
    wall_x = 700;
    wall_y = 300;
    wall_width = 100;
    wall_height = 500;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 500;
    spawn_y = 380;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1435;
    spawn_y = 521;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel2()
  {

    myUI.resetGame();
    this.num_of_walls = 6;
    float[][] walls = new float[6][4];
    this.walls = walls;


    {i = 0;
    wall_x = 0;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 1;
    wall_x = 1820;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 2;
    wall_x = 0;
    wall_y = 0;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 3;
    wall_x = 0;
    wall_y = 980;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 4;
    wall_x = 1019;
    wall_y = 81;
    wall_width = 90;
    wall_height = 362;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 5;
    wall_x = 1019;
    wall_y = 472;
    wall_width = 92;
    wall_height = 538;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 574;
    spawn_y = 469;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1453;
    spawn_y = 583;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel3()
  {

    myUI.resetGame();
    this.num_of_walls = 9;
    float[][] walls = new float[9][4];
    this.walls = walls;


    {i = 0;
    wall_x = 0;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 1;
    wall_x = 1820;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 2;
    wall_x = 0;
    wall_y = 0;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 3;
    wall_x = 0;
    wall_y = 980;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 5;
    wall_x = 670;
    wall_y = 313;
    wall_width = 56;
    wall_height = 436;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 6;
    wall_x = 804;
    wall_y = 321;
    wall_width = 276;
    wall_height = 40;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 7;
    wall_x = 1147;
    wall_y = 323;
    wall_width = 62;
    wall_height = 449;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 8;
    wall_x = 815;
    wall_y = 689;
    wall_width = 261;
    wall_height = 45;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 947;
    spawn_y = 538;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 256;
    spawn_y = 523;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1587;
    spawn_y = 535;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel4()
  {

    myUI.resetGame();
    this.num_of_walls = 8;
    float[][] walls = new float[8][4];
    this.walls = walls;


    {i = 0;
    wall_x = 0;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 1;
    wall_x = 1820;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 2;
    wall_x = 0;
    wall_y = 0;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 3;
    wall_x = 0;
    wall_y = 980;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 5;
    wall_x = 420;
    wall_y = 382;
    wall_width = 66;
    wall_height = 413;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 6;
    wall_x = 647;
    wall_y = 39;
    wall_width = 45;
    wall_height = 550;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 7;
    wall_x = 656;
    wall_y = 672;
    wall_width = 44;
    wall_height = 364;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 247;
    spawn_y = 573;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 666;
    spawn_y = 631;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1129;
    spawn_y = 286;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1272;
    spawn_y = 841;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1567;
    spawn_y = 483;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel5()
  {

    myUI.resetGame();
    this.num_of_walls = 8;
    float[][] walls = new float[8][4];
    this.walls = walls;


    {i = 0;
    wall_x = 0;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 1;
    wall_x = 1820;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 2;
    wall_x = 0;
    wall_y = 0;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 3;
    wall_x = 0;
    wall_y = 980;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }



    {i = 5;
    wall_x = 448;
    wall_y = 340;
    wall_width = 62;
    wall_height = 718;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 6;
    wall_x = 1269;
    wall_y = 76;
    wall_width = 74;
    wall_height = 683;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 7;
    wall_x = 691;
    wall_y = 637;
    wall_width = 150;
    wall_height = 159;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 938;
    spawn_y = 538;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 149;
    spawn_y = 933;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1765;
    spawn_y = 148;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 572;
    spawn_y = 921;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 251;
    spawn_y = 547;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1619;
    spawn_y = 402;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel6()
  {

    myUI.resetGame();
    this.num_of_walls = 8;
    float[][] walls = new float[8][4];
    this.walls = walls;


    {i = 0;
    wall_x = 0;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 1;
    wall_x = 1820;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 2;
    wall_x = 0;
    wall_y = 0;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 3;
    wall_x = 0;
    wall_y = 980;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 4;
    wall_x = 140;
    wall_y = 39;
    wall_width = 0;
    wall_height = 0;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 5;
    wall_x = 770;
    wall_y = 534;
    wall_width = 77;
    wall_height = 307;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 6;
    wall_x = 805;
    wall_y = 535;
    wall_width = 353;
    wall_height = 81;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 7;
    wall_x = 1085;
    wall_y = 571;
    wall_width = 72;
    wall_height = 272;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 956;
    spawn_y = 741;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 960;
    spawn_y = 274;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel7()
  {
    myUI.resetGame();
    this.num_of_walls = 8;
    float[][] walls = new float[8][4];
    this.walls = walls;

    {i = 0;
    wall_x = 0;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 1;
    wall_x = 1820;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 2;
    wall_x = 0;
    wall_y = 0;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 3;
    wall_x = 0;
    wall_y = 980;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 4;
    wall_x = 0;
    wall_y = 0;
    wall_width = 0;
    wall_height = 0;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 5;
    wall_x = 636;
    wall_y = 204;
    wall_width = 81;
    wall_height = 419;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 6;
    wall_x = 877;
    wall_y = 421;
    wall_width = 84;
    wall_height = 411;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 7;
    wall_x = 1106;
    wall_y = 219;
    wall_width = 87;
    wall_height = 403;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 1584;
    spawn_y = 646;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 790;
    spawn_y = 526;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1030;
    spawn_y = 523;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 340;
    spawn_y = 755;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel8()
  {
    myUI.resetGame();
    this.num_of_walls = 7;
    float[][] walls = new float[7][4];
    this.walls = walls;

    {i = 0;
    wall_x = 0;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 1;
    wall_x = 1820;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 2;
    wall_x = 0;
    wall_y = 0;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 3;
    wall_x = 0;
    wall_y = 980;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 4;
    wall_x = 61;
    wall_y = 361;
    wall_width = 944;
    wall_height = 157;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 5;
    wall_x = 1066;
    wall_y = 61;
    wall_width = 189;
    wall_height = 187;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 6;
    wall_x = 936;
    wall_y = 467;
    wall_width = 460;
    wall_height = 279;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 200;
    spawn_y = 200;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1024;
    spawn_y = 451;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1802;
    spawn_y = 117;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 573;
    spawn_y = 810;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1609;
    spawn_y = 769;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 709;
    spawn_y = 791;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel9()
  {
    myUI.resetGame();
    this.num_of_walls = 13;
    float[][] walls = new float[13][4];
    this.walls = walls;

    {i = 0;
    wall_x = 0;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 1;
    wall_x = 1820;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 2;
    wall_x = 0;
    wall_y = 0;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 3;
    wall_x = 0;
    wall_y = 980;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 4;
    wall_x = 0;
    wall_y = 0;
    wall_width = 0;
    wall_height = 0;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 5;
    wall_x = 709;
    wall_y = 660;
    wall_width = 378;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 6;
    wall_x = 696;
    wall_y = 267;
    wall_width = 387;
    wall_height = 96;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 7;
    wall_x = 696;
    wall_y = 66;
    wall_width = 68;
    wall_height = 249;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 8;
    wall_x = 1013;
    wall_y = 73;
    wall_width = 70;
    wall_height = 242;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 9;
    wall_x = 710;
    wall_y = 718;
    wall_width = 85;
    wall_height = 282;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 10;
    wall_x = 995;
    wall_y = 711;
    wall_width = 92;
    wall_height = 295;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 11;
    wall_x = 342;
    wall_y = 480;
    wall_width = 102;
    wall_height = 543;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 12;
    wall_x = 1588;
    wall_y = 341;
    wall_width = 79;
    wall_height = 430;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 234;
    spawn_y = 832;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 898;
    spawn_y = 383;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 899;
    spawn_y = 628;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1129;
    spawn_y = 931;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1722;
    spawn_y = 423;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1747;
    spawn_y = 682;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 571;
    spawn_y = 807;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1739;
    spawn_y = 542;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel10()
  {
    myUI.resetGame();
    this.num_of_walls = 14;
    float[][] walls = new float[14][4];
    this.walls = walls;

    {i = 0;
    wall_x = 0;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 1;
    wall_x = 1820;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 2;
    wall_x = 0;
    wall_y = 0;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 3;
    wall_x = 0;
    wall_y = 980;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 4;
    wall_x = 0;
    wall_y = 0;
    wall_width = 0;
    wall_height = 0;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 5;
    wall_x = 615;
    wall_y = 287;
    wall_width = 74;
    wall_height = 255;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 6;
    wall_x = 393;
    wall_y = 473;
    wall_width = 260;
    wall_height = 69;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 7;
    wall_x = 1053;
    wall_y = 288;
    wall_width = 76;
    wall_height = 255;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 8;
    wall_x = 1093;
    wall_y = 475;
    wall_width = 266;
    wall_height = 68;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 9;
    wall_x = 829;
    wall_y = 293;
    wall_width = 97;
    wall_height = 352;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 10;
    wall_x = 1549;
    wall_y = 348;
    wall_width = 96;
    wall_height = 400;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 11;
    wall_x = 1604;
    wall_y = 494;
    wall_width = 277;
    wall_height = 109;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 12;
    wall_x = 383;
    wall_y = 723;
    wall_width = 373;
    wall_height = 79;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 13;
    wall_x = 978;
    wall_y = 722;
    wall_width = 381;
    wall_height = 79;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 872;
    spawn_y = 760;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 866;
    spawn_y = 178;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1631;
    spawn_y = 270;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 303;
    spawn_y = 753;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1457;
    spawn_y = 760;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 528;
    spawn_y = 378;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1222;
    spawn_y = 370;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1720;
    spawn_y = 652;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1726;
    spawn_y = 405;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel11()
  {
    myUI.resetGame();
    this.num_of_walls = 10;
    float[][] walls = new float[10][4];
    this.walls = walls;

    {i = 0;
    wall_x = 0;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 1;
    wall_x = 1820;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 2;
    wall_x = 0;
    wall_y = 0;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 3;
    wall_x = 0;
    wall_y = 980;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 4;
    wall_x = 1305;
    wall_y = 75;
    wall_width = 96;
    wall_height = 357;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 5;
    wall_x = 1305;
    wall_y = 614;
    wall_width = 95;
    wall_height = 371;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 6;
    wall_x = 50;
    wall_y = 370;
    wall_width = 20;
    wall_height = 50;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 7;
    wall_x = 450;
    wall_y = 439;
    wall_width = 20;
    wall_height = 30;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 8;
    wall_x = 450;
    wall_y = 508;
    wall_width = 20;
    wall_height = 30;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 9;
    wall_x = 450;
    wall_y = 580;
    wall_width = 20;
    wall_height = 30;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 1599;
    spawn_y = 240;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1272;
    spawn_y = 134;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 854;
    spawn_y = 625;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 339;
    spawn_y = 467;
      enemyController.addSniperEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 338;
    spawn_y = 534;
      enemyController.addSniperEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel12()
  {
    myUI.resetGame();
    this.num_of_walls = 7;
    float[][] walls = new float[7][4];
    this.walls = walls;

    {i = 0;
    wall_x = 0;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 1;
    wall_x = 1820;
    wall_y = 0;
    wall_width = 100;
    wall_height = 1080;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 2;
    wall_x = 0;
    wall_y = 0;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 3;
    wall_x = 0;
    wall_y = 980;
    wall_width = 1920;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 4;
    wall_x = 0;
    wall_y = 0;
    wall_width = 0;
    wall_height = 0;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 5;
    wall_x = 826;
    wall_y = 429;
    wall_width = 246;
    wall_height = 148;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 953;
    spawn_y = 669;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 808;
    spawn_y = 218;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 706;
    spawn_y = 328;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 840;
    spawn_y = 335;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 935;
    spawn_y = 218;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    
    spawn_x = 1500;
    spawn_y = 150;
      enemyController.addSniperEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }


}
