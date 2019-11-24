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
    this.num_of_walls = 0;
    float[][] walls = new float[num_of_walls][4]; 
    this.walls = walls;
    /*
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
    
    {i = 4; //bottom border
    wall_x = 400;
    wall_y = 500;
    wall_width = 100; //max is 1920
    wall_height = 100; //max is 1080
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    */
    myTank.setSpawn(950, 450);
    //enemyController.addDummyEnemy(550, 500);
    //enemyController.addBossEnemy2(850, 500);
    enemyController.addBossEnemy1(200, 550);
    //enemyController.addDummyEnemy(950, 150);
    //enemyController.addDummyEnemy(600, 500);
    //enemyController.addDummyEnemy(650, 500);
    //enemyController.addDummyEnemy(700, 500);
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
    wall_y = 250;
    wall_width = 100;
    wall_height = 300;
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
  }    
  
  public void generateLevel2()
  {
    myUI.resetGame();
    this.num_of_walls = 12;
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
    wall_x = 200;
    wall_y = 200;
    wall_width = 710; //max is 1920, with border 1720
    wall_height = 100; //max is 1080, with border 880
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 5;
    wall_x = 200 + 710 + 100;
    wall_y = 200;
    wall_width = 710; //max is 1920, with border 1720
    wall_height = 100; //max is 1080, with border 880
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }


    {i = 6;
    wall_x = 200;
    wall_y = 780;
    wall_width = 710; //max is 1920, with border 1720
    wall_height = 100; //max is 1080, with border 880
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 7;
    wall_x = 200 + 710 + 100;
    wall_y = 780;
    wall_width = 710; //max is 1920, with border 1720
    wall_height = 100; //max is 1080, with border 880
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 8;
    wall_x = 200 + 710 - 100;
    wall_y = 200 + 100;
    wall_width = 100; //max is 1920, with border 1720
    wall_height = 150; //max is 1080, with border 880
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }
    
    {i = 9;
    wall_x = 200 + 710 + 100;
    wall_y = 200 + 100;
    wall_width = 100; //max is 1920, with border 1720
    wall_height = 150; //max is 1080, with border 880
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }    
    
    {i = 10;
    wall_x = 200 + 710 + 100;
    wall_y = 780 - 150;
    wall_width = 100; //max is 1920, with border 1720
    wall_height = 150; //max is 1080, with border 880
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }      
  
    {i = 11;
    wall_x = 200 + 710 - 100;
    wall_y = 780 - 150;
    wall_width = 100; //max is 1920, with border 1720
    wall_height = 150; //max is 1080, with border 880
      walls[i][0] = width * wall_x / 1920; //x-coord
      walls[i][1] = height * wall_y / 1080;//y cord
      walls[i][2] = width *  wall_width / 1920;//width
      walls[i][3] = height * wall_height / 1080;//length
    }    
    
    spawn_x = 200;
    spawn_y = 450;
      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = width / 2;
    spawn_y = height / 4;
      enemyController.addNoMovingEnemy(width * spawn_x / 1920, height * spawn_y / 1080);
    spawn_x = width / 2;
    spawn_y = height * 3 / 4;
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
    this.num_of_walls = 9;
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
}
