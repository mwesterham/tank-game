class UI
{
  private Button[] ButtonList = new Button[7];
  private String trigger_text = "Home Page";
  
  public UI()
  {
    
    this.ButtonList[0] = new Button("Home Page", "Start Game", "Start Game", 600, 700, 500, 100); //(where the button is (parent page), where the button goes (reference name), text in the button, locationX, locationY, sizeX, sizeY)
    this.ButtonList[5] = new Button("Home Page", "Level Select", "Level Select", 500, 500, 500, 100);
    this.ButtonList[1] = new Button("Home Page", "About", "About this", 500, 200, 500, 100);
    
    this.ButtonList[6] = new Button("About", "Home Page", "Return to Home Page", 100, 100, 1000, 100);
    
    this.ButtonList[4] = new Button("Level Select", "Home Page", "Return to Home Page", 100, 100, 1000, 100);
    
    this.ButtonList[2] = new Button("Game Over", "Home Page", "Return to Home Page", 100, 100, 1000, 100);
    this.ButtonList[3] = new Button("You Won", "Home Page", "Return to Home Page", 100, 100, 1000, 100);
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
    if(myTank.tank_health <= 0)
    {
      runGame = false;
      myUI.resetGame(); //resets the game by restoring player health and deleting all remaining enemies
      displayGameOver = true;
      trigger_text = "Game Over";
    }
    if(enemyController.enemies.size() == 0)
    {
      runGame = false;
      myUI.resetGame(); //resets the game ditto ^
      displayYouWon = true;
      trigger_text = "You Won";
    }
    myTank.renderTank();
    myTank.setTankColor(255, 50, 50);
    myTank.setTurretColor(0, 50, 50);
  }
  
  private void resetGame()
  {
    enemyController.resetEnemies();
    bulletController.resetBullets();
    myTank.resetTank();
  }
}
