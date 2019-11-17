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
  
  public void generateRandomWorld(int number_of_walls, int num_regular_enemies, int num_slowstrong_enemies)
  {
    /*
    walls[0][0] = 100; //x-coord
    walls[0][1] = 50;//y cord
    walls[0][2] = 1800;//width
    walls[0][3] = 20;//length
    */
    this.num_of_walls = number_of_walls;
    float[][] walls = new float[num_of_walls][4]; 
    this.walls = walls;
    
    Random rand = new Random();
    for(int i = 0; i < this.num_of_walls; i++)
    {
        //System.out.println(height);  
        walls[i][0] = rand.nextInt(width); //x-coord
        walls[i][1] = rand.nextInt(height);//y cord
        walls[i][2] = rand.nextInt(100) + 50;//width will be between 50 and 150 px
        walls[i][3] = rand.nextInt(100) + 50;//length will be between 50 and 150 px
    }
    myTank.setSpawn(rand.nextInt(1900), rand.nextInt(900));
    enemyController = new TankController(num_regular_enemies, num_slowstrong_enemies);
    bulletController = new BulletController(); //MUST reinstantiate the bullet controller, not entirely sure why though...
  }
  
  public void generateLevel1()
  {
    myUI.resetGame();
    
    this.num_of_walls = 2;
    float[][] walls = new float[num_of_walls][4]; 
    this.walls = walls;
    
    {//upper wall
      walls[0][0] = width / 2 - width / 4; //x-coord
      walls[0][1] = height / 4 - height / 16;//y cord
      walls[0][2] = width / 2;//width will be between 50 and 150 px
      walls[0][3] = height / 8;//length will be between 50 and 150 px
    }
    
    {//lower wall
      walls[1][0] = width / 2 - width / 4; //x-coord
      walls[1][1] = height / 4 - height / 16 + 500;//y cord
      walls[1][2] = width / 2;//width 
      walls[1][3] = height / 8;//length 
    }
    myTank.setSpawn(100, 450);
    enemyController.addStandardEnemy(1800, 100);//spawn is at 1800, 100)
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
}
