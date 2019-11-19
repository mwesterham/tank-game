class Button
{
  private int[] button_location = {0, 0};
  private int[] button_size = {0, 0};
  private String button_parent_name;
  private String button_reference_name = "";
  private int button_reference_int = 0;
  private String button_text = "";
  
  public Button(String parent, String reference_name, String text, int locationX, int locationY, int sizeX, int sizeY)
  {
    this.button_location[0] = locationX;
    this.button_location[1] = locationY;
    this.button_size[0] = sizeX;
    this.button_size[1] = sizeY;
    this.button_parent_name = parent;
    this.button_reference_name = reference_name;
    this.button_text = text;
  }
  
  public Button(String parent, int reference_int, String text, int locationX, int locationY, int sizeX, int sizeY)
  {
    this.button_location[0] = locationX;
    this.button_location[1] = locationY;
    this.button_size[0] = sizeX;
    this.button_size[1] = sizeY;
    this.button_parent_name = parent;
    this.button_reference_int = reference_int;
    this.button_text = text;
  }
  
  public void renderButton()
  {
    fill(0, 0, 0);
    rect(button_location[0], button_location[1], button_size[0], button_size[1]);
    fill(255, 255, 255);
    textSize(button_size[1]);
    text(button_text, button_location[0], button_location[1] + button_size[1] * 8/9);
  }
}
