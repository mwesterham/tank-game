import java.util.Random;
class World
{
  private int num_of_walls;
  private float[][] walls;
  private int[] wall_color = {0, 0, 0};
  private int[] wall_outline_color = {0, 0, 0};
  
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
  
  
  
  
  
  public void generateTestGrounds()
  {
    myUI.resetGame();
    this.num_of_walls = 1;
    float[][] walls = new float[num_of_walls][4]; 
    this.walls = walls;
    
    {//top corner wall left
      walls[0][0] = 0; //x-coord
      walls[0][1] = 0;//y cord
      walls[0][2] = 100;//width
      walls[0][3] = 900;//length
    }
    
    myTank.setSpawn(950, 450);
    enemyController.addDummyEnemy(550, 500);
    enemyController.addDummyEnemy(600, 500);
    enemyController.addDummyEnemy(650, 500);
    enemyController.addDummyEnemy(700, 500);
    bulletController = new BulletController(); //MUST reinstantiate the bullet controller, not entirely sure why though...
  }  
  
  public void generateRandomWorld(int number_of_walls, int num_regular_enemies, int num_slowstrong_enemies)
  {
    myUI.resetGame();
    /*
    walls[0][0] = 100; //x-coord
    walls[0][1] = 50;//y cord
    walls[0][2] = 1800;//width
    walls[0][3] = 20;//length
    */
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
    myTank.setSpawn(rand.nextInt(1900), rand.nextInt(900));
    enemyController = new TankController(num_regular_enemies, num_slowstrong_enemies);
    //enemyController.addDummyEnemy(500, 500);
    bulletController = new BulletController(); //MUST reinstantiate the bullet controller, not entirely sure why though...
  }
  
  public void generateLevel1()
  {
    myUI.resetGame();
    
    this.num_of_walls = 6;
    int i;
    float[][] walls = new float[num_of_walls][4]; 
    this.walls = walls;
    
    {i = 0;
      walls[i][0] = 0; //x-coord
      walls[i][1] = 0;//y cord
      walls[i][2] = 100;//width, max: 1900
      walls[i][3] = 900;//length, max: 900
    }
    
    {i = 1;
      walls[i][0] = 1800; //x-coord, max: 1900
      walls[i][1] = 0;//y cord, max: 900
      walls[i][2] = 100;//width, max: 1900
      walls[i][3] = 900;//length, max: 900
    }
    
    {i = 2;
      walls[i][0] = 0; //x-coord, max: 1900
      walls[i][1] = 0;//y cord, max: 900
      walls[i][2] = 1900;//width, max: 1900
      walls[i][3] = 100;//length, max: 900
    }    
    
    {i = 3;
      walls[i][0] = 0; //x-coord, max: 1900
      walls[i][1] = 800;//y cord, max: 900
      walls[i][2] = 1900;//width, max: 1900
      walls[i][3] = 100;//length, max: 900
    }
    
    {i = 4;
      walls[i][0] = 400; //x-coord, max: 1900
      walls[i][1] = 250;//y cord, max: 900
      walls[i][2] = 1200;//width, max: 1900
      walls[i][3] = 100;//length, max: 900
    }
    
    {i = 5;
      walls[i][0] = 700; //x-coord, max: 1900
      walls[i][1] = 250;//y cord, max: 900
      walls[i][2] = 100;//width, max: 1900
      walls[i][3] = 300;//length, max: 900
    }
    
    myTank.setSpawn(500, 700);
    enemyController.addNoMovingEnemy(950, 450);//spawn is at 1800, 100)
  }    
  
  public void generateLevel2()
  {
    myUI.resetGame();
    
    this.num_of_walls = 4;
    int i;
    float[][] walls = new float[num_of_walls][4]; 
    this.walls = walls;
    
    {i = 0;
      walls[i][0] = 100; //x-coord
      walls[i][1] = 100;//y cord
      walls[i][2] = 800;//width
      walls[i][3] = 300;//length 
    }
    
    {i = 1;
      walls[i][0] = 1000; //x-coord
      walls[i][1] = 100;//y cord
      walls[i][2] = 800;//width
      walls[i][3] = 300;//length 
    }
    
    {i = 2;
      walls[i][0] = 1000; //x-coord
      walls[i][1] = 500;//y cord
      walls[i][2] = 800;//width
      walls[i][3] = 300;//length 
    }
    
    {i = 3;
      walls[i][0] = 100; //x-coord
      walls[i][1] = 500;//y cord
      walls[i][2] = 800;//width
      walls[i][3] = 300;//length 
    }
    
    myTank.setSpawn(100, 450);
    enemyController.addNoMovingEnemy(950, 850);
    enemyController.addNoMovingEnemy(950, 450);
    enemyController.addStandardEnemy(1300, 450);
    enemyController.addStandardEnemy(1300, 25);
  }  
  
  public void generateLevel3()
  {
    myUI.resetGame();
    
    this.num_of_walls = 3;
    int i;
    float[][] walls = new float[num_of_walls][4]; 
    this.walls = walls;
    
    {i = 0;
      walls[i][0] = 200; //x-coord
      walls[i][1] = 200;//y cord
      walls[i][2] = 700;//width
      walls[i][3] = 100;//length 
    }
    
    {i = 1;
      walls[i][0] = 900; //x-coord
      walls[i][1] = 200;//y cord
      walls[i][2] = 100;//width
      walls[i][3] = 300;//length 
    }
    
    {i = 2;
      walls[i][0] = 900; //x-coord
      walls[i][1] = 500;//y cord
      walls[i][2] = 700;//width
      walls[i][3] = 100;//length 
    }
    
    myTank.setSpawn(100, 450);
    enemyController.addNoMovingEnemy(1100, 100);
    enemyController.addNoMovingEnemy(1600, 400);
    enemyController.addStandardEnemy(500, 450);
    enemyController.addStandardEnemy(200, 850);
    
  }
}
