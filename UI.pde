class UI
{
  private int[] button_location = {0, 0};
  private int button_size;
  private String trigger_text = "";
  public UI()
  {
    
  }
  
  public void displayHome()
  {
    button("Start Game", 500, 500, 100);
    button("Level Select", 700, 700, 100);
  }
  
  public void displayLevelSelect()
  {
    button("Test", 100, 100, 50);
  }
  
  public void displayGameOver()
  {
    textSize(100);
    text("GAME OVER", width / 2, 100);
    button("Return to home", 400, 700, 100);
  }
  
  public void displayYouWon()
  {
    textSize(100);
    text("YOU WON", width / 2, 100);
    button("Return to home", 400, 700, 100);
  }
  
  public void displayAbout()
  {
    
  }
  
  private void button(String text, int locationX, int locationY, int size)
  {
    fill(0, 0, 0);
    rect(locationX, locationY, 5*size, size);
    fill(255, 255, 255);
    textSize(size);
    text(text, locationX, locationY + size);
    button_location[0] = locationX;
    button_location[1] = locationY;
    button_size = size;
    if(mouseX > button_location[0] && mouseX < button_location[0] + 5*button_size && mouseY >button_location[0] && mouseY < button_location[1] + button_size)
      trigger_text = text;
  }
  
  public String clickArea()
  {
      return trigger_text;
  }
  
  

  
}
