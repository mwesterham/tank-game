int[][] walls;
int wall_x;
int wall_x2;
int wall_y;
int wall_y2;
int wall_index = 3;

int my_spawn_x;
int my_spawn_y;
int[][] tanks;
int spawn_x;
int spawn_y;
int tank_index = 0;

void setup()
{
  fullScreen();
  walls = new int[500][4];
  walls[0][0] = 0;
  walls[0][1] = 0;
  walls[0][2] = 100;
  walls[0][3] = 1080;
  
  walls[1][0] = 1820;
  walls[1][1] = 0;
  walls[1][2] = 100;
  walls[1][3] = 1080;
  
  walls[2][0] = 0;
  walls[2][1] = 0;
  walls[2][2] = 1920;
  walls[2][3] = 100;
  
  walls[3][0] = 0;
  walls[3][1] = 980;
  walls[3][2] = 1920;
  walls[3][3] = 100;
  
  my_spawn_x = 100;
  my_spawn_y = 100;
  
  tanks = new int[500][2];
  tanks[0][0] = my_spawn_x;
  tanks[0][1] = my_spawn_y;
}

void draw()
{
  background(130, 130, 130);
  for(int i = 0; i < walls.length; i++)
    rect(walls[i][0], walls[i][1], walls[i][2], walls[i][3]);
  
  
  fill(255, 0, 0);
  ellipse(my_spawn_x, my_spawn_y, 75, 75);
  fill(240, 240, 240);
  for(int i = 1; i < tanks.length; i++)
    ellipse(tanks[i][0], tanks[i][1], 75, 75);

}

void mousePressed()
{
  wall_x = mouseX;
  wall_y = mouseY;
}

void mouseReleased()
{
  wall_index++; //originally 3
  walls[wall_index][0] = wall_x;
  walls[wall_index][1] = wall_y;
  walls[wall_index][2] = wall_x2 - wall_x;
  walls[wall_index][3] = wall_y2 - wall_y;
  
  
  System.out.println("-------------------------------------------------------------");
  System.out.printf("" + "\n" +
  "  public void generateLevel#()" + "\n" +
  "  {" + "\n");
  
  System.out.printf("" + "\n" + 
  "    myUI.resetGame();" + "\n" + 
  "    this.num_of_walls = " + (wall_index + 1) + ";" + "\n" +
  "    float[][] walls = new float[" + (wall_index + 1) + "][4];" + "\n" +
  "    this.walls = walls;" + "\n\n");
  
  for(int i = 0; i <= wall_index; i++)
  {
    System.out.printf("" + "\n" +
    "    {i = " + i + ";" + "\n" +
    "    wall_x = " + walls[i][0] + ";" + "\n" +
    "    wall_y = " + walls[i][1] + ";" + "\n" +
    "    wall_width = " + walls[i][2] + ";" + "\n" +
    "    wall_height = " + walls[i][3] + ";" + "\n" +
    "      walls[i][0] = width * wall_x / 1920; //x-coord" + "\n" +
    "      walls[i][1] = height * wall_y / 1080; //y cord" + "\n" +
    "      walls[i][2] = width *  wall_width / 1920;//width" + "\n" +
    "      walls[i][3] = height * wall_height / 1080;//length" + "\n" +
    "    }" + "\n");
  }
  
  System.out.printf("" + "\n" + 
  "    spawn_x = " + my_spawn_x + ";" + "\n" +
  "    spawn_y = " + my_spawn_y + ";" + "\n" +
  "      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
  
  for(int i = 1; i <= tank_index; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[i][1] + ";" + "\n" +
    "      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
  
  System.out.println("  }");
}

void keyPressed()
{
  if(key == 'd' || key == 'D')
  {
    walls[wall_index][0] = 0;
    walls[wall_index][1] = 0;
    walls[wall_index][2] = 0;
    walls[wall_index][3] = 0;
    if(wall_index + 1 > 5)
      wall_index--;
  }
  
  if(key == 'e' || key == 'E')
  {
    tanks[tank_index][0] = 0;
    tanks[tank_index][1] = 0;
    if(tank_index + 1 > 1)
      tank_index--;
  }
  
  if(key == '1')
  {
    my_spawn_x = mouseX;
    my_spawn_y = mouseY;
  }
  
  if(key == '2')
  {
    spawn_x = mouseX;
    spawn_y = mouseY;
    tank_index++;
    tanks[tank_index][0] = spawn_x;
    tanks[tank_index][1] = spawn_y;
  }
  
  System.out.println("-------------------------------------------------------------");
  System.out.printf("" + "\n" +
  "  public void generateLevel#()" + "\n" +
  "  {" + "\n");
  
  System.out.printf("" + "\n" + 
  "    myUI.resetGame();" + "\n" + 
  "    this.num_of_walls = " + (wall_index + 1) + ";" + "\n" +
  "    float[][] walls = new float[" + (wall_index + 1) + "][4];" + "\n" +
  "    this.walls = walls;" + "\n\n");
  
  for(int i = 0; i <= wall_index; i++)
  {
    System.out.printf("" + "\n" +
    "    {i = " + i + ";" + "\n" +
    "    wall_x = " + walls[i][0] + ";" + "\n" +
    "    wall_y = " + walls[i][1] + ";" + "\n" +
    "    wall_width = " + walls[i][2] + ";" + "\n" +
    "    wall_height = " + walls[i][3] + ";" + "\n" +
    "      walls[i][0] = width * wall_x / 1920; //x-coord" + "\n" +
    "      walls[i][1] = height * wall_y / 1080; //y cord" + "\n" +
    "      walls[i][2] = width *  wall_width / 1920;//width" + "\n" +
    "      walls[i][3] = height * wall_height / 1080;//length" + "\n" +
    "    }" + "\n");
  }
  
  System.out.printf("" + "\n" + 
  "    spawn_x = " + my_spawn_x + ";" + "\n" +
  "    spawn_y = " + my_spawn_y + ";" + "\n" +
  "      myTank.setSpawn(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
  
  for(int i = 1; i <= tank_index; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[i][1] + ";" + "\n" +
    "      enemyController.addStandardEnemy(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
  
  System.out.println("  }");
}

void mouseDragged()
{
  wall_x2 = mouseX;
  wall_y2 = mouseY;
  fill(255, 255, 255);
  rect(wall_x, wall_y, wall_x2 - wall_x, wall_y2 - wall_y);
}
