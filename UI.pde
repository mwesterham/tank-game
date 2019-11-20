class UI
{
  private Button[] ButtonList = new Button[38];
  private String trigger_text = "Home Page";
  private int trigger_int = 0;
  
  public UI(int a)
  {
    trigger_int = a;
    //(where the button is (parent page), where the button goes (reference name), text in the button, locationX, locationY, sizeX, sizeY)
    this.ButtonList[0] = new Button("Home Page", 1, "Start Game", 1900 / 2 - 530 / 2, 100, 530, 100); 
    this.ButtonList[1] = new Button("Home Page", "Level Select", "Level Select", 1900 / 2 - 560 / 2, 300, 560, 100);
    this.ButtonList[2] = new Button("Home Page", "Controls", " Controls", 1900 / 2 - 500 / 2, 500, 500, 100);
    this.ButtonList[3] = new Button("Home Page", "About", "About this", 1900 / 2 - 500 / 2, 700, 500, 100);

    
    this.ButtonList[4] = new Button("Controls", "Home Page", "Return to Home Page", 50, 50, 260, 25);
    
    this.ButtonList[5] = new Button("About", "Home Page", "Return to Home Page", 50, 50, 260, 25);
    
    this.ButtonList[6] = new Button("Game Over", "Home Page", "Return to Home Page", 50, 50, 260, 25);
    this.ButtonList[7] = new Button("Game Over", trigger_int - 1, "Retry", 900, 500, 260, 100);
    this.ButtonList[8] = new Button("You Won", "Home Page", "Return to Home Page", 50, 50, 260, 25);
    this.ButtonList[9] = new Button("You Won", trigger_int - 1, "Retry", 300, 500, 260, 100);
    this.ButtonList[10] = new Button("You Won", trigger_int, "Next Level:  " + trigger_int, 900, 500, 540, 100);
    
    
    this.ButtonList[11] = new Button("Level Select", -2, "Test Grounds", 360, 50, 260, 25);
    this.ButtonList[12] = new Button("Level Select", -1, "Random World", 670, 50, 260, 25);
    this.ButtonList[13] = new Button("Level Select", "Home Page", "Return to Home Page", 50, 50, 260, 25);
    this.ButtonList[14] = new Button("Level Select", 1, "Level 1", 50, 200, 250, 30);
    this.ButtonList[15] = new Button("Level Select", 2, "Level 2", 50, 250, 250, 30);
    this.ButtonList[16] = new Button("Level Select", 3, "Level 3", 50, 300, 250, 30);
    this.ButtonList[17] = new Button("Level Select", 4, "Level 4", 50, 350, 250, 30);
    this.ButtonList[18] = new Button("Level Select", 5, "Level 5", 50, 400, 250, 30);
    this.ButtonList[19] = new Button("Level Select", 6, "Level 6", 50, 450, 250, 30);
    this.ButtonList[20] = new Button("Level Select", 7, "Level 7", 50, 500, 250, 30);
    this.ButtonList[21] = new Button("Level Select", 8, "Level 8", 50, 550, 250, 30);
    this.ButtonList[22] = new Button("Level Select", 9, "Level 9", 50, 600, 250, 30);
    this.ButtonList[23] = new Button("Level Select", 10, "Level 10", 50, 650, 250, 30);
    this.ButtonList[24] = new Button("Level Select", 11, "Level 11", 50, 700, 250, 30);//(parent page), where the button goes, text in the button, locationX, locationY, sizeX, sizeY)
    this.ButtonList[25] = new Button("Level Select", 12, "Level 12", 50, 750, 250, 30);
    this.ButtonList[26] = new Button("Level Select", 13, "Level 13", 350, 200, 250, 30);
    this.ButtonList[27] = new Button("Level Select", 14, "Level 14", 350, 250, 250, 30);
    this.ButtonList[28] = new Button("Level Select", 15, "Level 15", 350, 300, 250, 30);
    this.ButtonList[29] = new Button("Level Select", 16, "Level 16", 350, 350, 250, 30);
    this.ButtonList[30] = new Button("Level Select", 17, "Level 17", 350, 400, 250, 30);
    this.ButtonList[31] = new Button("Level Select", 18, "Level 18", 350, 450, 250, 30);
    this.ButtonList[32] = new Button("Level Select", 19, "Level 19", 350, 500, 250, 30);
    this.ButtonList[33] = new Button("Level Select", 20, "Level 20", 350, 550, 250, 30);
    this.ButtonList[34] = new Button("Level Select", 21, "Level 21", 350, 600, 250, 30);
    this.ButtonList[35] = new Button("Level Select", 22, "Level 22", 350, 650, 250, 30);
    this.ButtonList[36] = new Button("Level Select", 23, "Level 23", 350, 700, 250, 30);
    this.ButtonList[37] = new Button("Level Select", 24, "Level 24", 350, 750, 250, 30);
  }
  
  public void displayHome()
  {
    updateButtonHover("Home Page"); //updates the trigger_text if mouse hovering over button in the designmated page. Clicking will update the display in TankGame class, also renders bullets
  }

  
  public void displayLevelSelect()
  {
    updateButtonHover("Level Select"); //ditto ^
  }
  
  public void displayGameOver()
  {
    textSize(100);
    text("GAME OVER", width / 2, 100);
    updateButtonHover("Game Over"); //ditto ^
  }
  
  public void displayYouWon()
  {
    textSize(100);
    text("YOU WON", width / 2, 100);
    updateButtonHover("You Won"); //yeah
  }
  
  public void displayAbout()
  {
    textSize(50);
    text("About", width / 2, 100);
    textSize(40);
    text("I worked pretty hard on this blah blah blah blah blah blah blah", 100, 300);
    text("blegh blar blatt blange blah blah blah blah blah blah blah blah", 100, 350);
    text("blegh blar blatt blange blah blah blah blah blah blah blah blah", 100, 400);
    text("blegh blar blatt blange blah blah blah blah blah blah blah blah", 100, 450);
    text("blegh blar blatt blange blah blah blah blah blah blah blah blah", 100, 500);
    updateButtonHover("About");
  }
  
  public void displayControls()
  {
    textSize(50);
    text("Controls", width / 2, 100);
    textSize(40);
    text("Move with: WASD", 100, 300);
    text("Aim and shoot with: mouse", 100, 350);
    text("Quit the level with: p", 100, 400);
    updateButtonHover("Controls");
  }
  
  public void updateButtonHover(String currentPage)
  {
    for(int i = 0; i < ButtonList.length; i++)
      if(ButtonList[i].button_parent_name.equals(currentPage))
        ButtonList[i].renderButton(); //renders the buttons on the "Home Page"
    for(int i = 0; i < ButtonList.length; i++)
      if(ButtonList[i].button_parent_name.equals(currentPage))
        if(mouseX > ButtonList[i].button_location[0] && mouseX < ButtonList[i].button_location[0] + ButtonList[i].button_size[0] 
        && mouseY > ButtonList[i].button_location[1] && mouseY < ButtonList[i].button_location[1] + ButtonList[i].button_size[1])
        {  
          trigger_text = ButtonList[i].button_reference_name;
          trigger_int = ButtonList[i].button_reference_int;
          break;
        }
        else
        {
          trigger_text = ButtonList[i].button_parent_name;
          trigger_int = 0;
        }
  }
  
  public void runGame()
  {
    tickCount++;
    myWorld.displayWorld();
    enemyController.update();
    bulletController.update();//updates the bullets and checks for bullet collisions
    
    myTank.update();

    myTank.renderTank();
    myTank.setTankColor(255, 50, 50);
    myTank.setTurretColor(0, 50, 50);
  }
  
  public void endGameCheck()
  {
    if(enemyController.enemies.size() == 0)
    {
      runGame = false;
      myUI.resetGame(); //resets the game ditto ^
      displayYouWon = true;
      trigger_text = "You Won";
    }
    else if(myTank.tank_health <= 0)
    {
      runGame = false;
      myUI.resetGame(); //resets the game by restoring player health and deleting all remaining enemies
      displayGameOver = true;
      trigger_text = "Game Over";
    }    
  }
  
  private void resetGame()
  {
    enemyController.resetEnemies();
    bulletController.resetBullets();
    myTank.resetTank();
  }
  
  public void setTriggerText(String text)
  {
    trigger_text = text;
  }
}
