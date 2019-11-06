import java.util.Random;
class World
{
  private int num_of_walls;
  private float[][] walls;
  private int[] wall_color = {0, 0, 0};
  private int[] wall_outline_color = {0, 0, 0};
  
  public World(int num_of_walls)
  {
    this.num_of_walls = num_of_walls;
    float[][] walls = new float[num_of_walls][4]; 
    this.walls = walls;
  }
  
  public void generateWorld()
  {
    /*
    walls[0][0] = 100; //x-coord
    walls[0][1] = 50;//y cord
    walls[0][2] = 1800;//width
    walls[0][3] = 20;//length
    */
    Random rand = new Random();
    for(int i = 0; i < num_of_walls; i++)
    {
        walls[i][0] = rand.nextInt(1900); //x-coord
        walls[i][1] = rand.nextInt(900);//y cord
        walls[i][2] = rand.nextInt(100) + 50;//width
        walls[i][3] = rand.nextInt(100) + 50;//length
    }
    
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
