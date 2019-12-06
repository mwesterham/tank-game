private boolean mousepress = false;

int[][] walls;
int wall_x;
int wall_x2;
int wall_y;
int wall_y2;
int wall_index = 3;

int my_spawn_x;
int my_spawn_y;
int[][][] tanks;
int spawn_x;
int spawn_y;
int tank_index1 = 0;
int tank_index2 = 0;
int tank_index3 = 0;
int tank_index4 = 0;
int tank_index5 = 0;
int tank_index6 = 0;
int tank_index7 = 0;
int tank_index8 = 0;
int tank_index9 = 0;

String num2KeyEnemy = "NoMovingEnemy";
String num3KeyEnemy = "StandardEnemy";
String num4KeyEnemy = "SlowStrongEnemy";
String num5KeyEnemy = "SniperEnemy";
String num6KeyEnemy = "BurstShotEnemy";
String num7KeyEnemy = "RegenEnemy";
String num8KeyEnemy = "NoMovingEnemy";
String num9KeyEnemy = "NoMovingEnemy";
String num0KeyEnemy = "NoMovingEnemy";

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
  
  tanks = new int[9][20][2]; //there are 9 types of tanks discluding the player, 20 max of each tank, 
  //tanks[0][0][0] = my_spawn_x;
  //tanks[0][0][1] = my_spawn_y;
}

void draw()
{
  background(130, 130, 130);  
  fill(255, 255, 255);
  
  if(mousepress)
  {
    fill(255, 255, 255);
    rect(wall_x, wall_y, wall_x2 - wall_x, wall_y2 - wall_y);
  }
    
  for(int i = 0; i < walls.length; i++)
    rect(walls[i][0], walls[i][1], walls[i][2], walls[i][3]);
  
  
  fill(255, 0, 0);
  ellipse(my_spawn_x, my_spawn_y, 75, 75);
  
  for(int i = 0; i < tanks[0].length; i++)
  {
    fill(240, 240, 240);
    ellipse(tanks[0][i][0], tanks[0][i][1], 75, 75); //first tank type
    textSize(30);
    fill(0, 0, 0);
    text("2", tanks[0][i][0] - 10, tanks[0][i][1]);
    textSize(9);
    text(num2KeyEnemy, tanks[0][i][0] - 30, tanks[0][i][1] + 10);
  }
  
  for(int i = 0; i < tanks[1].length; i++)
  {
    fill(140, 140, 140);
    ellipse(tanks[1][i][0], tanks[1][i][1], 75, 75); //second tank type
    textSize(30);
    fill(0, 0, 0);
    text("3", tanks[1][i][0] - 10, tanks[1][i][1]);
    textSize(9);
    text(num3KeyEnemy, tanks[1][i][0] - 30, tanks[1][i][1] + 10);
  }

  for(int i = 0; i < tanks[2].length; i++)
  {
    fill(40, 40, 40);
    ellipse(tanks[2][i][0], tanks[2][i][1], 100, 100); //third tank type
    textSize(30);
    fill(255, 255, 255);
    text("4", tanks[2][i][0] - 10, tanks[2][i][1]);
    textSize(9);
    text(num4KeyEnemy, tanks[2][i][0] - 30, tanks[2][i][1] + 10);
  }
   
  for(int i = 0; i < tanks[3].length; i++)
  {
    fill(0, 240, 240);
    ellipse(tanks[3][i][0], tanks[3][i][1], 75, 75); //4th tank type
    textSize(30);
    fill(0, 0, 0);
    text("5", tanks[3][i][0] - 10, tanks[3][i][1]);
    textSize(9);
    text(num5KeyEnemy, tanks[3][i][0] - 30, tanks[3][i][1] + 10);
  }
    
  for(int i = 0; i < tanks[4].length; i++)
  {
    fill(0, 140, 140);
    ellipse(tanks[4][i][0], tanks[4][i][1], 75, 75); //5th tank type
    textSize(30);
    fill(255, 255, 255);
    text("6", tanks[4][i][0] - 10, tanks[4][i][1]);
    textSize(9);
    text(num6KeyEnemy, tanks[4][i][0] - 30, tanks[4][i][1] + 10);
  }

  for(int i = 0; i < tanks[5].length; i++)
  {
    fill(0, 40, 40);
    ellipse(tanks[5][i][0], tanks[5][i][1], 75, 75); //6th tank type
    textSize(30);
    fill(255, 255, 255);
    text("7", tanks[5][i][0] - 10, tanks[5][i][1]);
    textSize(9);
    text(num7KeyEnemy, tanks[5][i][0] - 30, tanks[5][i][1] + 10);
  }

  for(int i = 0; i < tanks[6].length; i++)
  {
    fill(240, 0, 240);
    ellipse(tanks[6][i][0], tanks[6][i][1], 75, 75); //7th tank type
    textSize(30);
    fill(255, 255, 255);
    text("8", tanks[6][i][0] - 10, tanks[6][i][1]);
    textSize(9);
    text(num8KeyEnemy, tanks[6][i][0] - 30, tanks[6][i][1] + 10);
  }
   
  for(int i = 0; i < tanks[7].length; i++)
  {
    fill(140, 0, 140);
    ellipse(tanks[7][i][0], tanks[7][i][1], 75, 75); //8th tank type
    textSize(30);
    fill(255, 255, 255);
    text("9", tanks[7][i][0] - 10, tanks[7][i][1]);
    textSize(9);
    text(num9KeyEnemy, tanks[7][i][0] - 30, tanks[7][i][1] + 10);
  }
    
  for(int i = 0; i < tanks[8].length; i++)
  {
    fill(40, 0, 40);
    ellipse(tanks[8][i][0], tanks[8][i][1], 75, 75); //9th tank type
    textSize(30);
    fill(255, 255, 255);
    text("0", tanks[8][i][0] - 10, tanks[8][i][1]);
    textSize(9);
    text(num0KeyEnemy, tanks[8][i][0] - 30, tanks[8][i][1] + 10);
  }


  textSize(25);
  fill(0, 0, 0);
  text("Add Controls:", 300, 25);
  textSize(10);
  text("Drag Mouse: add wall", 500, 20);
  text("1: set player spawn", 650, 20);
  text("2: add no moving enemy", 650, 40);
  text("3: add standard enemy", 650, 60);
  text("4: add slow strong enemy", 650, 80);
  text("5: add sniper enemy", 800, 20);
  text("6: add burst shot enemy", 800, 40);
  text("7: add no moving enemy", 800, 60);
  text("8: add no moving enemy", 800, 80);
  text("9: add no moving enemy", 950, 20);
  text("0: add no moving enemy", 950, 40);
  
  
  
  textSize(25);
  fill(0, 0, 0);
  text("Delete Controls:", 1100, 25);
  textSize(10);
  text("d: delete wall", 1350, 20);
  text("w: delete no moving enemy", 1350, 40);
  text("e: delete standard enemy", 1350, 60);
  text("r: delete slow strong enemy", 1350, 80);
  text("t: delete sniper enemy", 1500, 20);
  text("y: delete burst shot enemy", 1500, 40);
  text("u: delete no moving enemy", 1500, 60);
  text("i: delete no moving enemy", 1500, 80);
  text("o: delete no moving enemy", 1650, 20);
  text("p: delete no moving enemy", 1650, 40);
}

void mousePressed()
{
  wall_x = mouseX;
  wall_y = mouseY;
  wall_x2 = wall_x; //prevents a visual glitch
  wall_y2 = wall_y;  
  mousepress = true;
}

void mouseReleased()
{
  mousepress = false;
  wall_index++; //originally 3
  
  //organizes the points and lengths so that they can be stored without negatives
  if(wall_x > wall_x2 && wall_y < wall_y2
  || wall_x < wall_x2 && wall_y > wall_y2)
  {
    int placeholder;
    placeholder = wall_y;
    wall_y = wall_y2;
    wall_y2 = placeholder;
  }
  
  if(wall_x > wall_x2 && wall_y > wall_y2)
  {
    int placeholder;
    placeholder = wall_x;
    wall_x = wall_x2;
    wall_x2 = placeholder;    
    
    placeholder = wall_y;
    wall_y = wall_y2;
    wall_y2 = placeholder;
  }
    
    
  walls[wall_index][0] = wall_x;
  walls[wall_index][1] = wall_y;
  walls[wall_index][2] = wall_x2 - wall_x;
  walls[wall_index][3] = wall_y2 - wall_y;
  
  if(walls[wall_index][2] == 0 || walls[wall_index][2] == 0) //if the height or width are zero, delete the wall
    wall_index--;
  
  System.out.println("//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
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
  
  for(int i = 1; i <= tank_index1; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[0][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[0][i][1] + ";" + "\n" +
    "      enemyController.add" + num2KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
    
  for(int i = 1; i <= tank_index2; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[1][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[1][i][1] + ";" + "\n" +
    "      enemyController.add" + num3KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
    
  for(int i = 1; i <= tank_index3; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[2][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[2][i][1] + ";" + "\n" +
    "      enemyController.add" + num4KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
    
  for(int i = 1; i <= tank_index4; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[3][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[3][i][1] + ";" + "\n" +
    "      enemyController.add" + num5KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
    
  for(int i = 1; i <= tank_index5; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[4][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[4][i][1] + ";" + "\n" +
    "      enemyController.add" + num6KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
    
  for(int i = 1; i <= tank_index6; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[5][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[5][i][1] + ";" + "\n" +
    "      enemyController.add" + num7KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
    
  for(int i = 1; i <= tank_index7; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[6][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[6][i][1] + ";" + "\n" +
    "      enemyController.add" + num8KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
    
  for(int i = 1; i <= tank_index8; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[7][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[7][i][1] + ";" + "\n" +
    "      enemyController.add" + num9KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
    
  for(int i = 1; i <= tank_index9; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[8][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[8][i][1] + ";" + "\n" +
    "      enemyController.add" + num0KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
  
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
  
  if(key == 'w' || key == 'W')
  {
    tanks[0][tank_index1][0] = 0;
    tanks[0][tank_index1][1] = 0;
    if(tank_index1 + 1 > 1)
      tank_index1--;
  }
  
  if(key == 'e' || key == 'E')
  {
    tanks[1][tank_index2][0] = 0;
    tanks[1][tank_index2][1] = 0;
    if(tank_index2 + 1 > 1)
      tank_index2--;
  }
  
  if(key == 'r' || key == 'R')
  {
    tanks[2][tank_index3][0] = 0;
    tanks[2][tank_index3][1] = 0;
    if(tank_index3 + 1 > 1)
      tank_index3--;
  }
  
  if(key == 't' || key == 'T')
  {
    tanks[3][tank_index4][0] = 0;
    tanks[3][tank_index4][1] = 0;
    if(tank_index4 + 1 > 1)
      tank_index4--;
  }
  
  if(key == 'y' || key == 'Y')
  {
    tanks[4][tank_index5][0] = 0;
    tanks[4][tank_index5][1] = 0;
    if(tank_index5 + 1 > 1)
      tank_index5--;
  }
  
  if(key == 'u' || key == 'U')
  {
    tanks[5][tank_index6][0] = 0;
    tanks[5][tank_index6][1] = 0;
    if(tank_index6 + 1 > 1)
      tank_index6--;
  }
  
  if(key == 'i' || key == 'I')
  {
    tanks[6][tank_index7][0] = 0;
    tanks[6][tank_index7][1] = 0;
    if(tank_index7 + 1 > 1)
      tank_index7--;
  }
  
  if(key == 'o' || key == 'O')
  {
    tanks[7][tank_index8][0] = 0;
    tanks[7][tank_index8][1] = 0;
    if(tank_index8 + 1 > 1)
      tank_index8--;
  }
  
  if(key == 'p' || key == 'P')
  {
    tanks[8][tank_index9][0] = 0;
    tanks[8][tank_index9][1] = 0;
    if(tank_index9 + 1 > 1)
      tank_index9--;
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
    tank_index1++;
    tanks[0][tank_index1][0] = spawn_x;
    tanks[0][tank_index1][1] = spawn_y;
  }
  
  if(key == '3')
  {
    spawn_x = mouseX;
    spawn_y = mouseY;
    tank_index2++;
    tanks[1][tank_index2][0] = spawn_x;
    tanks[1][tank_index2][1] = spawn_y;
  }

  if(key == '4')
  {
    spawn_x = mouseX;
    spawn_y = mouseY;
    tank_index3++;
    tanks[2][tank_index3][0] = spawn_x;
    tanks[2][tank_index3][1] = spawn_y;
  }
  
  if(key == '5')
  {
    spawn_x = mouseX;
    spawn_y = mouseY;
    tank_index4++;
    tanks[3][tank_index4][0] = spawn_x;
    tanks[3][tank_index4][1] = spawn_y;
  }
  
  if(key == '6')
  {
    spawn_x = mouseX;
    spawn_y = mouseY;
    tank_index5++;
    tanks[4][tank_index5][0] = spawn_x;
    tanks[4][tank_index5][1] = spawn_y;
  }
  
  if(key == '7')
  {
    spawn_x = mouseX;
    spawn_y = mouseY;
    tank_index6++;
    tanks[5][tank_index6][0] = spawn_x;
    tanks[5][tank_index6][1] = spawn_y;
  }
  
  if(key == '8')
  {
    spawn_x = mouseX;
    spawn_y = mouseY;
    tank_index7++;
    tanks[6][tank_index7][0] = spawn_x;
    tanks[6][tank_index7][1] = spawn_y;
  }
  
  if(key == '9')
  {
    spawn_x = mouseX;
    spawn_y = mouseY;
    tank_index8++;
    tanks[7][tank_index8][0] = spawn_x;
    tanks[7][tank_index8][1] = spawn_y;
  }
  
  if(key == '0')
  {
    spawn_x = mouseX;
    spawn_y = mouseY;
    tank_index9++;
    tanks[8][tank_index9][0] = spawn_x;
    tanks[8][tank_index9][1] = spawn_y;
  }
  
  //prints the code to copy
  System.out.println("//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
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
  
  for(int i = 1; i <= tank_index1; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[0][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[0][i][1] + ";" + "\n" +
    "      enemyController.add" + num2KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
    
  for(int i = 1; i <= tank_index2; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[1][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[1][i][1] + ";" + "\n" +
    "      enemyController.add" + num3KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
    
  for(int i = 1; i <= tank_index3; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[2][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[2][i][1] + ";" + "\n" +
    "      enemyController.add" + num4KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
    
  for(int i = 1; i <= tank_index4; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[3][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[3][i][1] + ";" + "\n" +
    "      enemyController.add" + num5KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
    
  for(int i = 1; i <= tank_index5; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[4][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[4][i][1] + ";" + "\n" +
    "      enemyController.add" + num6KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
    
  for(int i = 1; i <= tank_index6; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[5][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[5][i][1] + ";" + "\n" +
    "      enemyController.add" + num7KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
    
  for(int i = 1; i <= tank_index7; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[6][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[6][i][1] + ";" + "\n" +
    "      enemyController.add" + num8KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
    
  for(int i = 1; i <= tank_index8; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[7][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[7][i][1] + ";" + "\n" +
    "      enemyController.add" + num9KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
    
  for(int i = 1; i <= tank_index9; i++)
    System.out.printf("" + "\n" + 
    "    spawn_x = " + tanks[8][i][0] + ";" + "\n" +
    "    spawn_y = " + tanks[8][i][1] + ";" + "\n" +
    "      enemyController.add" + num0KeyEnemy + "(width * spawn_x / 1920, height * spawn_y / 1080);" + "\n");
  
  System.out.println("  }");
}

void mouseDragged()
{
  wall_x2 = mouseX;
  wall_y2 = mouseY;
}
