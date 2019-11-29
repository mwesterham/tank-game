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
    this.num_of_walls = 5;
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

    myTank.setSpawn(950, 450);

    //for(int i = 0; i < 3; i++) //used for lag testing
    //enemyController.addDummyEnemy(550, 500);
    //enemyController.addBossEnemy2(850, 500);
    enemyController.addBossEnemy1(150, 550);
    //enemyController.addSlowStrongEnemy(150, 550);
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
  
  public void generateLevel1()
  {
    myUI.resetGame();
    this.num_of_walls = 6;
    float[][] walls = new float[num_of_walls][4]; 
    this.walls = walls;
    background_color[0] = 30;
    background_color[1] = 60;
    background_color[2] = 30;
    //level_background_music1.loop();
    
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
    wall_y = 250;
    wall_width = 1200;
    wall_height = 100;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 5;
    wall_x = 700;
    wall_y = 300;
    wall_width = 100;
    wall_height = 250;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    

    spawn_x = 500;
    spawn_y = 700;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 950;
    spawn_y = 450;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1920 / 2;
    spawn_y = 150;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }    
  
  public void generateLevel2()
  {
    myUI.resetGame();
    this.num_of_walls = 12;
    float[][] walls = new float[num_of_walls][4]; 
    this.walls = walls;
    background_color[0] = 30;
    background_color[1] = 60;
    background_color[2] = 30;
    //level_background_music2.loop();
    
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
    wall_x = 200;
    wall_y = 200;
    wall_width = 610; //max is 1920, with border 1720
    wall_height = 100; //max is 1080, with border 880
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 5;
    wall_x = 200 + 810 + 100;
    wall_y = 200;
    wall_width = 610; //max is 1920, with border 1720
    wall_height = 100; //max is 1080, with border 880
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }


    {i = 6;
    wall_x = 200;
    wall_y = 780;
    wall_width = 610; //max is 1920, with border 1720
    wall_height = 100; //max is 1080, with border 880
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 7;
    wall_x = 200 + 810 + 100;
    wall_y = 780;
    wall_width = 610; //max is 1920, with border 1720
    wall_height = 100; //max is 1080, with border 880
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 8;
    wall_x = 200 + 710 - 100;
    wall_y = 200;
    wall_width = 100; //max is 1920, with border 1720
    wall_height = 250; //max is 1080, with border 880
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 9;
    wall_x = 200 + 710 + 100;
    wall_y = 200;
    wall_width = 100; //max is 1920, with border 1720
    wall_height = 250; //max is 1080, with border 880
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }    
    
    {i = 10;
    wall_x = 200 + 710 + 100;
    wall_y = 780 - 150;
    wall_width = 100; //max is 1920, with border 1720
    wall_height = 250; //max is 1080, with border 880
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }      
  
    {i = 11;
    wall_x = 200 + 710 - 100;
    wall_y = 780 - 150;
    wall_width = 100; //max is 1920, with border 1720
    wall_height = 250; //max is 1080, with border 880
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }    
    
    spawn_x = 200;
    spawn_y = 450;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1920 / 2;
    spawn_y = 1080 / 4;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1920 / 2;
    spawn_y = 1080 * 3 / 4;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1000;
    spawn_y = 150;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1300;
    spawn_y = 350;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }  
  
  public void generateLevel3()
  {
    myUI.resetGame();
    this.num_of_walls = 8;
    float[][] walls = new float[num_of_walls][4]; 
    this.walls = walls;
    background_color[0] = 30;
    background_color[1] = 60;
    background_color[2] = 30;
    //level_background_music3.loop();
    
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
    wall_x = 200;
    wall_y = 200;
    wall_width = 700; //max is 1920
    wall_height = 100; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length 
    }
    
    {i = 5;
    wall_x = 900;
    wall_y = 200;
    wall_width = 100; //max is 1920
    wall_height = 300; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length 
    }
    
    {i = 6;
    wall_x = 900;
    wall_y = 500;
    wall_width = 700; //max is 1920
    wall_height = 100; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length 
    }
    
     {i = 7;
    wall_x = 1200;
    wall_y = 600;
    wall_width = 100; //max is 1920
    wall_height = 200; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length 
    }
    
    spawn_x = 1600;
    spawn_y = 100;
      myTank.setSpawn(1600, 700);
    spawn_x = 1100;
    spawn_y = 200;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1500;
    spawn_y = 400;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 500;
    spawn_y = 450;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 200;
    spawn_y = 850;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }
  
  public void generateLevel4()
  {
    myUI.resetGame();
    this.num_of_walls = 10;
    float[][] walls = new float[num_of_walls][4]; 
    this.walls = walls;
    background_color[0] = 30;
    background_color[1] = 60;
    background_color[2] = 30;
    //level_background_music4.loop();
    
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
    wall_x = 200;
    wall_y = 300;
    wall_width = 500; //max is 1920
    wall_height = 100; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 5;
    wall_x = 900;
    wall_y = 200;
    wall_width = 100; //max is 1920
    wall_height = 700; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 6;
    wall_x = 200;
    wall_y = 700;
    wall_width = 500; //max is 1920
    wall_height = 100; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 7;
    wall_x = 1600;
    wall_y = 400;
    wall_width = 100; //max is 1920
    wall_height = 300; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 8;
    wall_x = 1500;
    wall_y = 500;
    wall_width = 100; //max is 1920
    wall_height = 100; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    spawn_x = 150;
    spawn_y = 550;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1050;
    spawn_y = 350;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1050;
    spawn_y = 750;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 500;
    spawn_y = 250;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1300;
    spawn_y = 550;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1500;
    spawn_y = 450;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1400;
    spawn_y = 550;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 850;
    spawn_y = 310;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

  }
  
  public void generateLevel5()
  {
    myUI.resetGame();
    this.num_of_walls = 11;
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
    
    {i = 4; //H
    wall_x = 850;
    wall_y = 250;
    wall_width = 100; //max is 1920
    wall_height = 660; //max is 1080
      walls[i][0] = width * wall_x / 1920 - (width *  wall_width / 1920) / 2; //x-coord
      walls[i][1] = height * wall_y / 1080 - (width *  wall_width / 1920) / 2;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 5; //H
    wall_x = 360;
    wall_y = 250;
    wall_width = 100; //max is 1920
    wall_height = 660; //max is 1080
      walls[i][0] = width * wall_x / 1920 - (width *  wall_width / 1920) / 2; //x-coord
      walls[i][1] = height * wall_y / 1080 - (width *  wall_width / 1920) / 2;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
     {i = 6; //H
    wall_x = 600;
    wall_y = 680;
    wall_width = 400; //max is 1920
    wall_height = 100; //max is 1080
      walls[i][0] = width * wall_x / 1920 - (width *  wall_width / 1920) / 2; //x-coord
      walls[i][1] = height * wall_y / 1080 - (width *  wall_width / 1920) / 2;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 7; //exclamation line
    wall_x = 1600;
    wall_y = 250;
    wall_width = 100; //max is 1920
    wall_height = 500; //max is 1080
      walls[i][0] = width * wall_x / 1920 - (width *  wall_width / 1920) / 2; //x-coord
      walls[i][1] = height * wall_y / 1080 - (width *  wall_width / 1920) / 2;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 8; //exclamation point
    wall_x = 1600;
    wall_y = 800;
    wall_width = 100; //max is 1920
    wall_height = 100; //max is 1080
      walls[i][0] = width * wall_x / 1920 - (width *  wall_width / 1920) / 2; //x-coord
      walls[i][1] = height * wall_y / 1080 - (width *  wall_width / 1920) / 2;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
     {i = 9; //i dot
    wall_x = 1250;
    wall_y = 250;
    wall_width = 100; //max is 1920
    wall_height = 100; //max is 1080
      walls[i][0] = width * wall_x / 1920 - (width *  wall_width / 1920) / 2; //x-coord
      walls[i][1] = height * wall_y / 1080 - (width *  wall_width / 1920) / 2;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
     {i = 10; //i line
    wall_x = 1250;
    wall_y = 500;
    wall_width = 100; //max is 1920
    wall_height = 400; //max is 1080
      walls[i][0] = width * wall_x / 1920 - (width *  wall_width / 1920) / 2; //x-coord
      walls[i][1] = height * wall_y / 1080 - (width *  wall_width / 1920) / 2;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 150;
    spawn_y = 550;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);
    
    spawn_x = 1050;
    spawn_y = 350;
    //  enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1050;
    spawn_y = 750;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 500;
    spawn_y = 250;
    //  enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1300;
    spawn_y = 550;
    //  enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1500;
    spawn_y = 450;
    //  enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1400;
    spawn_y = 550;
    //  enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 850;
    spawn_y = 310;
    //  enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }  
  
  public void generateLevel6()
  {
    myUI.resetGame();
    this.num_of_walls = 11;
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
    
    {i = 4; //middle wall
    wall_x = 900;
    wall_y = 200;
    wall_width = 800; //max is 1920
    wall_height = 50; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 5; //left wall
    wall_x = 100;
    wall_y = 200;
    wall_width = 700; //max is 1920
    wall_height = 50; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 6; //right wall
    wall_x = 1700;
    wall_y = 100;
    wall_width = 50; //max is 1920
    wall_height = 900; //max is 1080
      walls[i][0] = width * wall_x / 1920 - (width *  wall_width / 1920) / 2; //x-coord
      walls[i][1] = height * wall_y / 1080 - (height *  wall_height / 1080) / 2;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 7; //top vertical line
    wall_x = 100;
    wall_y = 800;
    wall_width = 450; //max is 1920
    wall_height = 50; //max is 1080
      walls[i][0] = width * wall_x / 1920 - (width *  wall_width / 1920) / 2; //x-coord
      walls[i][1] = height * wall_y / 1080 - (height *  wall_height / 1080) / 2;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 8; //middle wall
    wall_x = 500;
    wall_y = 750;
    wall_width = 50; //max is 1920
    wall_height = 500; //max is 1080
      walls[i][0] = width * wall_x / 1920 - (width *  wall_width / 1920) / 2; //x-coord
      walls[i][1] = height * wall_y / 1080 - (height *  wall_height / 1080) / 2;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 9; //middle wall
    wall_x = 1500;
    wall_y = 700;
    wall_width = 500; //max is 1920
    wall_height = 50; //max is 1080
      walls[i][0] = width * wall_x / 1920 - (width *  wall_width / 1920) / 2; //x-coord
      walls[i][1] = height * wall_y / 1080 - (height *  wall_height / 1080) / 2;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 10; //middle wall
    wall_x = 250;
    wall_y = 400;
    wall_width = 300; //max is 1920
    wall_height = 50; //max is 1080
      walls[i][0] = width * wall_x / 1920 - (width *  wall_width / 1920) / 2; //x-coord
      walls[i][1] = height * wall_y / 1080 - (height *  wall_height / 1080) / 2;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    //{i = 11; //middle wall
    //wall_x = 250;
    //wall_y = 400;
    //wall_width = 300; //max is 1920
    //wall_height = 50; //max is 1080
    //  walls[i][0] = width * wall_x / 1920 - (width *  wall_width / 1920) / 2; //x-coord
    //  walls[i][1] = height * wall_y / 1080 - (height *  wall_height / 1080) / 2;//y cord
    //  walls[i][2] = width *  wall_width / 1920;//width
    //  walls[i][3] = height * wall_height / 1080;//length
    //}
    
    //    {i = 10; //middle wall
    //wall_x = 250;
    //wall_y = 400;
    //wall_width = 300; //max is 1920
    //wall_height = 50; //max is 1080
    //  walls[i][0] = width * wall_x / 1920 - (width *  wall_width / 1920) / 2; //x-coord
    //  walls[i][1] = height * wall_y / 1080 - (height *  wall_height / 1080) / 2;//y cord
    //  walls[i][2] = width *  wall_width / 1920;//width
    //  walls[i][3] = height * wall_height / 1080;//length
    //}
    
    //{i = 10; //middle wall
    //wall_x = 250;
    //wall_y = 400;
    //wall_width = 300; //max is 1920
    //wall_height = 50; //max is 1080
    //  walls[i][0] = width * wall_x / 1920 - (width *  wall_width / 1920) / 2; //x-coord
    //  walls[i][1] = height * wall_y / 1080 - (height *  wall_height / 1080) / 2;//y cord
    //  walls[i][2] = width *  wall_width / 1920;//width
    //  walls[i][3] = height * wall_height / 1080;//length
    //}
    
    spawn_x = 150;
    spawn_y = 550;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);
    
    spawn_x = 1050;
    spawn_y = 350;
    //  enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1050;
    spawn_y = 750;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 500;
    spawn_y = 250;
    //  enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1300;
    spawn_y = 550;
    //  enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1500;
    spawn_y = 450;
    //  enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 1400;
    spawn_y = 550;
    //  enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = 850;
    spawn_y = 310;
    //  enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }  
  
  public void generateLevel7()
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
    wall_x = 568;
    wall_y = 227;
    wall_width = 248;
    wall_height = 213;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 5;
    wall_x = 1401;
    wall_y = 273;
    wall_width = 169;
    wall_height = 326;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 6;
    wall_x = 980;
    wall_y = 566;
    wall_width = 254;
    wall_height = 240;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    spawn_x = 150;
    spawn_y = 550;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);
    
    spawn_x = 1050;
    spawn_y = 750;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

  }
  
  public void generateLevel8()
  {

    myUI.resetGame();
    this.num_of_walls = 5;
    float[][] walls = new float[5][4];
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
    wall_x = 561;
    wall_y = 361;
    wall_width = 373;
    wall_height = 237;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 1620;
    spawn_y = 508;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 389;
    spawn_y = 511;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 591;
    spawn_y = 249;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 776;
    spawn_y = 734;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1061;
    spawn_y = 462;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }
  
  public void generateLevel9()
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
    wall_x = 556;
    wall_y = 300;
    wall_width = 141;
    wall_height = 324;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 6;
    wall_x = 843;
    wall_y = 386;
    wall_width = 331;
    wall_height = 297;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 7;
    wall_x = 643;
    wall_y = 741;
    wall_width = 189;
    wall_height = 143;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 8;
    wall_x = 575;
    wall_y = 606;
    wall_width = 334;
    wall_height = 157;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 9;
    wall_x = 549;
    wall_y = 610;
    wall_width = 216;
    wall_height = 277;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 437;
    spawn_y = 759;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 782;
    spawn_y = 555;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 883;
    spawn_y = 324;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 963;
    spawn_y = 290;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1141;
    spawn_y = 297;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1291;
    spawn_y = 473;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1238;
    spawn_y = 639;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1110;
    spawn_y = 765;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1066;
    spawn_y = 775;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1282;
    spawn_y = 762;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1349;
    spawn_y = 587;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1370;
    spawn_y = 517;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1311;
    spawn_y = 344;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }

  public void generateLevel10()
  {

    myUI.resetGame();
    this.num_of_walls = 22;
    float[][] walls = new float[22][4];
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
    wall_x = 1270;
    wall_y = 183;
    wall_width = 144;
    wall_height = 211;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 5;
    wall_x = 1356;
    wall_y = 502;
    wall_width = 166;
    wall_height = 184;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 6;
    wall_x = 1305;
    wall_y = 826;
    wall_width = 123;
    wall_height = 142;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 7;
    wall_x = 1162;
    wall_y = 412;
    wall_width = 119;
    wall_height = 210;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 8;
    wall_x = 1164;
    wall_y = 722;
    wall_width = 114;
    wall_height = 99;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 9;
    wall_x = 1044;
    wall_y = 186;
    wall_width = 134;
    wall_height = 152;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 10;
    wall_x = 989;
    wall_y = 434;
    wall_width = 98;
    wall_height = 174;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 11;
    wall_x = 880;
    wall_y = 749;
    wall_width = 145;
    wall_height = 116;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 12;
    wall_x = 954;
    wall_y = 181;
    wall_width = 145;
    wall_height = 149;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 13;
    wall_x = 714;
    wall_y = 343;
    wall_width = 112;
    wall_height = 148;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 14;
    wall_x = 653;
    wall_y = 576;
    wall_width = 148;
    wall_height = 159;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 15;
    wall_x = 707;
    wall_y = 177;
    wall_width = 149;
    wall_height = 97;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 16;
    wall_x = 474;
    wall_y = 275;
    wall_width = 92;
    wall_height = 196;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 17;
    wall_x = 488;
    wall_y = 627;
    wall_width = 173;
    wall_height = 255;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 18;
    wall_x = 332;
    wall_y = 142;
    wall_width = 109;
    wall_height = 169;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 19;
    wall_x = 424;
    wall_y = 808;
    wall_width = 192;
    wall_height = 90;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 20;
    wall_x = 748;
    wall_y = 813;
    wall_width = 166;
    wall_height = 82;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 21;
    wall_x = 599;
    wall_y = 193;
    wall_width = 68;
    wall_height = 91;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 252;
    spawn_y = 536;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1714;
    spawn_y = 209;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1746;
    spawn_y = 325;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1743;
    spawn_y = 359;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1731;
    spawn_y = 411;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1715;
    spawn_y = 504;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1715;
    spawn_y = 560;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1719;
    spawn_y = 637;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1725;
    spawn_y = 755;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1739;
    spawn_y = 816;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1744;
    spawn_y = 876;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }
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
    wall_x = 663;
    wall_y = 250;
    wall_width = 111;
    wall_height = 351;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 5;
    wall_x = 889;
    wall_y = 730;
    wall_width = 155;
    wall_height = 140;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 6;
    wall_x = 1217;
    wall_y = 266;
    wall_width = 159;
    wall_height = 135;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 7;
    wall_x = 1571;
    wall_y = 457;
    wall_width = 54;
    wall_height = 108;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 8;
    wall_x = 1013;
    wall_y = 591;
    wall_width = 141;
    wall_height = 150;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 9;
    wall_x = 1337;
    wall_y = 896;
    wall_width = 162;
    wall_height = 53;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 405;
    spawn_y = 678;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 527;
    spawn_y = 559;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 999;
    spawn_y = 394;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1091;
    spawn_y = 468;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1275;
    spawn_y = 655;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1586;
    spawn_y = 675;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1546;
    spawn_y = 219;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1483;
    spawn_y = 404;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1478;
    spawn_y = 560;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1414;
    spawn_y = 643;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1567;
    spawn_y = 852;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1718;
    spawn_y = 710;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1731;
    spawn_y = 482;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1701;
    spawn_y = 221;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1598;
    spawn_y = 219;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1567;
    spawn_y = 289;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1440;
    spawn_y = 430;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1392;
    spawn_y = 555;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1269;
    spawn_y = 514;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1329;
    spawn_y = 547;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel12()
  {

    myUI.resetGame();
    this.num_of_walls = 5;
    float[][] walls = new float[5][4];
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
    wall_x = 636;
    wall_y = 440;
    wall_width = 357;
    wall_height = 296;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 447;
    spawn_y = 920;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 556;
    spawn_y = 376;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1050;
    spawn_y = 832;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 805;
    spawn_y = 325;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1159;
    spawn_y = 536;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1142;
    spawn_y = 627;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 896;
    spawn_y = 335;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1112;
    spawn_y = 304;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }
  
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel13()
  {

    myUI.resetGame();
    this.num_of_walls = 12;
    float[][] walls = new float[12][4];
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
    wall_x = 700;
    wall_y = 276;
    wall_width = 288;
    wall_height = 287;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 5;
    wall_x = 1288;
    wall_y = 458;
    wall_width = 517;
    wall_height = 457;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 6;
    wall_x = 571;
    wall_y = 734;
    wall_width = 300;
    wall_height = 124;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 7;
    wall_x = 1046;
    wall_y = 519;
    wall_width = 74;
    wall_height = 139;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 8;
    wall_x = 1123;
    wall_y = 350;
    wall_width = 91;
    wall_height = 79;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 9;
    wall_x = 452;
    wall_y = 249;
    wall_width = 123;
    wall_height = 59;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 10;
    wall_x = 582;
    wall_y = 497;
    wall_width = 126;
    wall_height = 146;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 11;
    wall_x = 423;
    wall_y = 562;
    wall_width = 96;
    wall_height = 113;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 397;
    spawn_y = 441;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 924;
    spawn_y = 191;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1080;
    spawn_y = 284;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 972;
    spawn_y = 650;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 827;
    spawn_y = 631;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 211;
    spawn_y = 837;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 225;
    spawn_y = 273;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1511;
    spawn_y = 250;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1094;
    spawn_y = 837;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel14()
  {

    myUI.resetGame();
    this.num_of_walls = 21;
    float[][] walls = new float[21][4];
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
    wall_x = 99;
    wall_y = 209;
    wall_width = 1590;
    wall_height = 50;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 6;
    wall_x = 228;
    wall_y = 481;
    wall_width = 1594;
    wall_height = 35;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 7;
    wall_x = 1655;
    wall_y = 259;
    wall_width = 34;
    wall_height = 117;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 8;
    wall_x = 1443;
    wall_y = 388;
    wall_width = 25;
    wall_height = 97;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 9;
    wall_x = 1211;
    wall_y = 259;
    wall_width = 23;
    wall_height = 101;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 10;
    wall_x = 988;
    wall_y = 389;
    wall_width = 21;
    wall_height = 95;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 11;
    wall_x = 812;
    wall_y = 259;
    wall_width = 16;
    wall_height = 113;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 12;
    wall_x = 590;
    wall_y = 385;
    wall_width = 21;
    wall_height = 97;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 13;
    wall_x = 278;
    wall_y = 259;
    wall_width = 24;
    wall_height = 114;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 14;
    wall_x = 631;
    wall_y = 517;
    wall_width = 32;
    wall_height = 211;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 15;
    wall_x = 635;
    wall_y = 813;
    wall_width = 28;
    wall_height = 171;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 16;
    wall_x = 552;
    wall_y = 673;
    wall_width = 23;
    wall_height = 169;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 17;
    wall_x = 842;
    wall_y = 516;
    wall_width = 25;
    wall_height = 128;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 18;
    wall_x = 843;
    wall_y = 728;
    wall_width = 24;
    wall_height = 253;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 19;
    wall_x = 993;
    wall_y = 515;
    wall_width = 28;
    wall_height = 256;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 20;
    wall_x = 998;
    wall_y = 866;
    wall_width = 25;
    wall_height = 111;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 742;
    spawn_y = 163;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1598;
    spawn_y = 312;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1396;
    spawn_y = 433;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1133;
    spawn_y = 306;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 925;
    spawn_y = 436;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 738;
    spawn_y = 316;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 515;
    spawn_y = 430;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 153;
    spawn_y = 316;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 230;
    spawn_y = 320;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 647;
    spawn_y = 772;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 855;
    spawn_y = 686;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1009;
    spawn_y = 822;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 375;
    spawn_y = 606;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 310;
    spawn_y = 813;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 470;
    spawn_y = 763;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 158;
    spawn_y = 155;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel15()
  {

    myUI.resetGame();
    this.num_of_walls = 12;
    float[][] walls = new float[12][4];
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
    wall_x = 296;
    wall_y = 87;
    wall_width = 101;
    wall_height = 819;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 6;
    wall_x = 777;
    wall_y = 527;
    wall_width = 106;
    wall_height = 458;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 7;
    wall_x = 392;
    wall_y = 372;
    wall_width = 348;
    wall_height = 114;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 8;
    wall_x = 780;
    wall_y = 92;
    wall_width = 105;
    wall_height = 226;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 9;
    wall_x = 922;
    wall_y = 376;
    wall_width = 510;
    wall_height = 106;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 10;
    wall_x = 1304;
    wall_y = 92;
    wall_width = 127;
    wall_height = 287;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 11;
    wall_x = 1314;
    wall_y = 480;
    wall_width = 117;
    wall_height = 427;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 184;
    spawn_y = 219;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 541;
    spawn_y = 194;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 711;
    spawn_y = 194;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1701;
    spawn_y = 188;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 189;
    spawn_y = 845;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1613;
    spawn_y = 447;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1070;
    spawn_y = 203;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 983;
    spawn_y = 799;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }
  
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  public void generateLevel16()
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
    wall_x = 389;
    wall_y = 291;
    wall_width = 111;
    wall_height = 251;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    {i = 5;
    wall_x = 500;
    wall_y = 289;
    wall_width = 544;
    wall_height = 92;
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080; //y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }

    spawn_x = 311;
    spawn_y = 407;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 832;
    spawn_y = 456;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 699;
    spawn_y = 465;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 787;
    spawn_y = 542;
      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1470;
    spawn_y = 238;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1451;
    spawn_y = 768;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);

    spawn_x = 1635;
    spawn_y = 501;
      enemyController.addSlowStrongEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
  }
}
