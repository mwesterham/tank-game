class UI
{
  private Button[] ButtonList = new Button[12];
  private String trigger_text = "Home Page";
  
  public UI()
  {
    //(where the button is (parent page), where the button goes (reference name), text in the button, locationX, locationY, sizeX, sizeY)
    this.ButtonList[0] = new Button("Home Page", "Start Game", "Start Game", 1900 / 2 - 530 / 2, 100, 530, 100); 
    this.ButtonList[1] = new Button("Home Page", "Level Select", "Level Select", 1900 / 2 - 560 / 2, 300, 560, 100);
    this.ButtonList[2] = new Button("Home Page", "About", "About this", 1900 / 2 - 500 / 2, 500, 500, 100);
    
    this.ButtonList[3] = new Button("About", "Home Page", "Return to Home Page", 50, 50, 260, 25);
    
    this.ButtonList[4] = new Button("Game Over", "Home Page", "Return to Home Page", 50, 50, 260, 25);
    this.ButtonList[5] = new Button("You Won", "Home Page", "Return to Home Page", 50, 50, 260, 25);
    
    this.ButtonList[11] = new Button("Level Select", "TestGrounds", "Test Grounds", 360, 50, 260, 25);
    this.ButtonList[6] = new Button("Level Select", "Home Page", "Return to Home Page", 50, 50, 260, 25);
    this.ButtonList[7] = new Button("Level Select", "Level1", "Level 1", 50, 200, 250, 30);
    this.ButtonList[8] = new Button("Level Select", "Level2", "Level 2", 50, 250, 250, 30);
    this.ButtonList[9] = new Button("Level Select", "Level3", "Level 3", 50, 300, 250, 30);
    this.ButtonList[10] = new Button("Level Select", "Level4", "Level 4", 50, 350, 250, 30);
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
          break;
        }
        else
          trigger_text = ButtonList[i].button_parent_name;
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
}
