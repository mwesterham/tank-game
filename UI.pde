class UI
{
  private Button[] ButtonList = new Button[103];
  private String trigger_text = "Home Page";
  private int trigger_int = 0;
  private String upgrade_text = "";
  
  public UI(int a)
  {
    trigger_int = a;
    //(where the button is (parent page), where the button goes (reference name), text in the button, locationX, locationY, sizeX, sizeY)
    this.ButtonList[0] = new Button("Home Page", 1, "Start Game", 1920 / 2 - 530 / 2, 100, 530, 100); 
    this.ButtonList[1] = new Button("Home Page", "Level Select", "Level Select", 1920 / 2 - 560 / 2, 300, 560, 100);
    this.ButtonList[2] = new Button("Home Page", "Controls", " Controls", 1920 / 2 - 500 / 2, 500, 500, 100);
    this.ButtonList[3] = new Button("Home Page", "About", "About this", 1920 / 2 - 500 / 2, 700, 500, 100);

    
    this.ButtonList[4] = new Button("Controls", "Home Page", "Return to Home Page", 50, 50, 260, 25);
    
    this.ButtonList[5] = new Button("About", "Home Page", "Return to Home Page", 50, 50, 260, 25);
    
    this.ButtonList[6] = new Button("Game Over", "Home Page", "Return to Home Page", 50, 50, 260, 25);
    this.ButtonList[7] = new Button("Game Over", trigger_int - 1, "Retry", 900, 500, 260, 100);
    
    this.ButtonList[38] = new Button("Upgrades", "Home Page", "Return to Home Page", 50, 50, 260, 25);
    this.ButtonList[39] = new Button("Upgrades", "You Won", "TankSpeed +2", 800, 165, 600, 30);
    this.ButtonList[40] = new Button("Upgrades", "You Won", "TankHealth +3", 800, 165 + (75)*1, 600, 30);
    this.ButtonList[41] = new Button("Upgrades", "You Won", "BulletSpeed +4", 800, 165 + (75)*2, 600, 30);
    this.ButtonList[42] = new Button("Upgrades", "You Won", "BulletDamage +1", 800, 165 + (75)*3, 600, 30);
    this.ButtonList[43] = new Button("Upgrades", "You Won", "BulletSize +2", 800, 165 + (75)*4, 250, 30);
    this.ButtonList[46] = new Button("Upgrades", "You Won", "BulletSize -2", 1150, 165 + (75)*4, 250, 30);
    this.ButtonList[44] = new Button("Upgrades", "You Won", "BulletFrequency -2 tick/shot", 800, 165 + (75)*5, 600, 30);
    this.ButtonList[45] = new Button("Upgrades", "You Won", "BulletBounce +1 (-20% everything else)", 800, 165 + (75)*6, 600, 30);
    this.ButtonList[9] = new Button("Upgrades", "You Won", "No Upgrade", 1400, 165 + (75)*9, 300, 50);
    
    this.ButtonList[8] = new Button("You Won", "Home Page", "Return to Home Page", 50, 50, 260, 25);
    this.ButtonList[10] = new Button("You Won", trigger_int, "Next Level:  " + trigger_int, 900, 500, 540, 100);
    
    
    this.ButtonList[11] = new Button("Level Select", -2, "Test Grounds", 360, 50, 260, 25);
    this.ButtonList[12] = new Button("Level Select", -1, "Random World", 670, 50, 260, 25);
    this.ButtonList[13] = new Button("Level Select", "Home Page", "Return to Home Page", 50, 50, 260, 25);
    this.ButtonList[14] = new Button("Level Select", 1, "        Level 1", 50, 200 + 40*(0), 250, 25);
    this.ButtonList[15] = new Button("Level Select", 2, "        Level 2", 50, 200 + 40*(1), 250, 25);
    this.ButtonList[16] = new Button("Level Select", 3, "        Level 3", 50, 200 + 40*(2), 250, 25);
    this.ButtonList[17] = new Button("Level Select", 4, "        Level 4", 50, 200 + 40*(3), 250, 25);
    this.ButtonList[18] = new Button("Level Select", 5, "        Level 5", 50, 200 + 40*(4), 250, 25);
    this.ButtonList[19] = new Button("Level Select", 6, "        Level 6", 50, 200 + 40*(5), 250, 25);
    this.ButtonList[20] = new Button("Level Select", 7, "        Level 7", 50, 200 + 40*(6), 250, 25);
    this.ButtonList[21] = new Button("Level Select", 8, "        Level 8", 50, 200 + 40*(7), 250, 25);
    this.ButtonList[22] = new Button("Level Select", 9, "        Level 9", 50, 200 + 40*(8), 250, 25);
    this.ButtonList[23] = new Button("Level Select", 10, "        Level 10", 50, 200 + 40*(9), 250, 25);
    this.ButtonList[24] = new Button("Level Select", 11, "        Level 11", 50, 200 + 40*(10), 250, 25);//(parent page), where the button goes, text in the button, locationX, locationY, sizeX, sizeY)
    this.ButtonList[25] = new Button("Level Select", 12, "        Level 12", 50, 200 + 40*(11), 250, 25);
    this.ButtonList[26] = new Button("Level Select", 13, "        Level 13", 50, 200 + 40*(12), 250, 25);
    this.ButtonList[27] = new Button("Level Select", 14, "        Level 14", 50, 200 + 40*(13), 250, 25);
    this.ButtonList[28] = new Button("Level Select", 15, "        Level 15", 50, 200 + 40*(14), 250, 25);
    this.ButtonList[29] = new Button("Level Select", 16, "        Level 16", 50, 200 + 40*(15), 250, 25);
    this.ButtonList[30] = new Button("Level Select", 17, "        Level 17", 50, 200 + 40*(16), 250, 25);
    this.ButtonList[31] = new Button("Level Select", 18, "        Level 18", 50, 200 + 40*(17), 250, 25);
    this.ButtonList[32] = new Button("Level Select", 19, "        Level 19", 50, 200 + 40*(18), 250, 25);
    this.ButtonList[33] = new Button("Level Select", 20, "        Level 20", 50, 200 + 40*(19), 250, 25);
    
    this.ButtonList[34] = new Button("Level Select", 21, "        Level 21", 350, 200 + 40*(0), 250, 25);
    this.ButtonList[35] = new Button("Level Select", 22, "        Level 22", 350, 200 + 40*(1), 250, 25);
    this.ButtonList[36] = new Button("Level Select", 23, "        Level 23", 350, 200 + 40*(2), 250, 25);
    this.ButtonList[102] = new Button("Level Select", 24, "        Level 24", 350, 200 + 40*(3), 250, 25);
    this.ButtonList[37] = new Button("Level Select", 25, "        Level 25", 350, 200 + 40*(4), 250, 25);
    this.ButtonList[47] = new Button("Level Select", 26, "        Level 26", 350, 200 + 40*(5), 250, 25);
    this.ButtonList[48] = new Button("Level Select", 27, "        Level 27", 350, 200 + 40*(6), 250, 25);
    this.ButtonList[49] = new Button("Level Select", 28, "        Level 28", 350, 200 + 40*(7), 250, 25);
    this.ButtonList[50] = new Button("Level Select", 29, "        Level 29", 350, 200 + 40*(8), 250, 25);
    this.ButtonList[51] = new Button("Level Select", 30, "        Level 30", 350, 200 + 40*(9), 250, 25);
    this.ButtonList[52] = new Button("Level Select", 31, "        Level 31", 350, 200 + 40*(10), 250, 25);
    this.ButtonList[53] = new Button("Level Select", 32, "        Level 32", 350, 200 + 40*(11), 250, 25);
    this.ButtonList[54] = new Button("Level Select", 33, "        Level 33", 350, 200 + 40*(12), 250, 25);
    this.ButtonList[55] = new Button("Level Select", 34, "        Level 34", 350, 200 + 40*(13), 250, 25);
    this.ButtonList[56] = new Button("Level Select", 35, "        Level 35", 350, 200 + 40*(14), 250, 25);
    this.ButtonList[57] = new Button("Level Select", 36, "        Level 36", 350, 200 + 40*(15), 250, 25);
    this.ButtonList[58] = new Button("Level Select", 37, "        Level 37", 350, 200 + 40*(16), 250, 25);
    this.ButtonList[59] = new Button("Level Select", 38, "        Level 38", 350, 200 + 40*(17), 250, 25);
    this.ButtonList[60] = new Button("Level Select", 39, "        Level 39", 350, 200 + 40*(18), 250, 25);
    this.ButtonList[61] = new Button("Level Select", 40, "        Level 40", 350, 200 + 40*(19), 250, 25);
    
    this.ButtonList[62] = new Button("Level Select", 41, "        Level 41", 650, 200 + 40*(0), 250, 25);
    this.ButtonList[63] = new Button("Level Select", 42, "        Level 42", 650, 200 + 40*(1), 250, 25);
    this.ButtonList[64] = new Button("Level Select", 43, "        Level 43", 650, 200 + 40*(2), 250, 25);
    this.ButtonList[65] = new Button("Level Select", 44, "        Level 44", 650, 200 + 40*(3), 250, 25);
    this.ButtonList[66] = new Button("Level Select", 45, "        Level 45", 650, 200 + 40*(4), 250, 25);
    this.ButtonList[67] = new Button("Level Select", 46, "        Level 46", 650, 200 + 40*(5), 250, 25);
    this.ButtonList[68] = new Button("Level Select", 47, "        Level 47", 650, 200 + 40*(6), 250, 25);
    this.ButtonList[69] = new Button("Level Select", 48, "        Level 48", 650, 200 + 40*(7), 250, 25);
    this.ButtonList[70] = new Button("Level Select", 49, "        Level 49", 650, 200 + 40*(8), 250, 25);
    this.ButtonList[71] = new Button("Level Select", 50, "        Level 50", 650, 200 + 40*(9), 250, 25);
    this.ButtonList[72] = new Button("Level Select", 51, "        Level 51", 650, 200 + 40*(10), 250, 25);
    this.ButtonList[73] = new Button("Level Select", 52, "        Level 52", 650, 200 + 40*(11), 250, 25);
    this.ButtonList[74] = new Button("Level Select", 53, "        Level 53", 650, 200 + 40*(12), 250, 25);
    this.ButtonList[75] = new Button("Level Select", 54, "        Level 54", 650, 200 + 40*(13), 250, 25);
    this.ButtonList[76] = new Button("Level Select", 55, "        Level 55", 650, 200 + 40*(14), 250, 25);
    this.ButtonList[77] = new Button("Level Select", 56, "        Level 56", 650, 200 + 40*(15), 250, 25);
    this.ButtonList[78] = new Button("Level Select", 57, "        Level 57", 650, 200 + 40*(16), 250, 25);
    this.ButtonList[79] = new Button("Level Select", 58, "        Level 58", 650, 200 + 40*(17), 250, 25);
    this.ButtonList[80] = new Button("Level Select", 59, "        Level 59", 650, 200 + 40*(18), 250, 25);
    this.ButtonList[81] = new Button("Level Select", 60, "        Level 60", 650, 200 + 40*(19), 250, 25);
 
    this.ButtonList[82] = new Button("Level Select", 61, "        Level 61", 950, 200 + 40*(0), 250, 25);
    this.ButtonList[83] = new Button("Level Select", 62, "        Level 62", 950, 200 + 40*(1), 250, 25);
    this.ButtonList[84] = new Button("Level Select", 63, "        Level 63", 950, 200 + 40*(2), 250, 25);
    this.ButtonList[85] = new Button("Level Select", 64, "        Level 64", 950, 200 + 40*(3), 250, 25);
    this.ButtonList[86] = new Button("Level Select", 65, "        Level 65", 950, 200 + 40*(4), 250, 25);
    this.ButtonList[87] = new Button("Level Select", 66, "        Level 66", 950, 200 + 40*(5), 250, 25);
    this.ButtonList[88] = new Button("Level Select", 67, "        Level 67", 950, 200 + 40*(6), 250, 25);
    this.ButtonList[89] = new Button("Level Select", 68, "        Level 68", 950, 200 + 40*(7), 250, 25);
    this.ButtonList[90] = new Button("Level Select", 69, "        Level 69", 950, 200 + 40*(8), 250, 25);
    this.ButtonList[91] = new Button("Level Select", 70, "        Level 70", 950, 200 + 40*(9), 250, 25);
    this.ButtonList[92] = new Button("Level Select", 71, "        Level 71", 950, 200 + 40*(10), 250, 25);
    this.ButtonList[93] = new Button("Level Select", 72, "        Level 72", 950, 200 + 40*(11), 250, 25);
    this.ButtonList[94] = new Button("Level Select", 73, "        Level 73", 950, 200 + 40*(12), 250, 25);
    this.ButtonList[95] = new Button("Level Select", 74, "        Level 74", 950, 200 + 40*(13), 250, 25);
    this.ButtonList[96] = new Button("Level Select", 75, "        Level 75", 950, 200 + 40*(14), 250, 25);
    this.ButtonList[97] = new Button("Level Select", 76, "        Level 76", 950, 200 + 40*(15), 250, 25);
    this.ButtonList[98] = new Button("Level Select", 77, "        Level 77", 950, 200 + 40*(16), 250, 25);
    this.ButtonList[99] = new Button("Level Select", 78, "        Level 78", 950, 200 + 40*(17), 250, 25);
    this.ButtonList[100] = new Button("Level Select", 79, "        Level 79", 950, 200 + 40*(18), 250, 25);
    this.ButtonList[101] = new Button("Level Select", 80, "        Level 80", 950, 200 + 40*(19), 250, 25);
    
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
    updateButtonHover("You Won"); 
  }
  
  public void displayUpgrades()
  {
    textSize(100);
    text("YOU WON", 1920 / 2, 100);
    textSize(40);
    text("(Choose an upgrade)", 1500, 200);
    textSize(50);
    text("TankSpeed: " + (int)(myTank.tank_speed * framerate / 80 * 10) + "\n"
      +  "Tank Health: " + (int)(myTank.tank_health * 10) + "\n"
      +  "Bullet Speed: " + (int)(myTank.bullet_speed * 10) + "\n"
      +  "Bullet Damage: " + (int)(myTank.bullet_health * 10) + "\n"
      +  "Bullet Size: " + (int)myTank.bullet_size + "\n"
      +  "Bullet Frequency: " + myTank.bullet_frequency + "\n"
      +  "Num Bullet Bounce: " + myTank.num_bullet_bounce + "\n\n", width / 10, 200);
    
    updateButtonHover("Upgrades"); 
  }
  
  public void LevelsComplete()
  {
    textSize(100);
    text("LEVELS COMPLETE", width / 2, 100);
    updateButtonHover("Levels Complete"); 
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
    text("Movement", 100, 250);
    text("    Up: W", 100, 300);
    text("    Down: S", 100, 350);
    text("    Left: A", 100, 400);
    text("    Right: D", 100, 450);
    text("Shooting/Aiming", 100, 550);
    text("    Aim: mouse", 100, 600);
    text("    Shoot: mouse click", 100, 650);
    text("Quit the level with: p", 100, 750);
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
          upgrade_text = ButtonList[i].button_text;
          break;
        }
        else
        {
          trigger_text = ButtonList[i].button_parent_name;
          trigger_int = 0;
          upgrade_text = "";
        }
  }
  
  public void runGame()
  {
    myWorld.displayWorld();
    enemyController.update();
    bulletController.update();//updates the bullets and checks for bullet collisions
    
    myTank.update();
    myTank.renderTank();
  }
  
  public void endGameCheck()
  {
    if(enemyController.enemies.size() == 0)
    {
      runGame = false;
      myUI.resetGame(); //resets the game ditto ^
      if(upgrades_on)// && trigger_int - 1 <= 20) //max number of upgrades is 20
        displayUpgrades = true;
      else
        displayYouWon = true;
      trigger_text = "You Won";
      click_protection_timer = FRAMERATE; //just makes sure that the player does not accidentally upgrade
    }
    else if(myTank.tank_health <= 0)
    {
      runGame = false;
      myUI.resetGame(); //resets the game by restoring player health and deleting all remaining enemies
      displayGameOver = true;
      trigger_text = "Game Over";
      click_protection_timer = (int)(FRAMERATE / 2);
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
