class EnemyAI
{
  private float[] enemy_position = {0, 0};
  private float[] target_position = {0, 0};
  
  private boolean target_visible =false;
  private boolean shot_safe = false;
  private boolean shoot = false;
  
  public EnemyAI(EnemyTank enemy, PlayerTank myTank)
  {
    this.enemy_position[0] = enemy.getPosition()[0];
    this.enemy_position[1] = enemy.getPosition()[1];
    this.target_position[0] = myTank.getPosition()[0];
    this.target_position[1] = myTank.getPosition()[1];
  }
  
  public void shootCheck()
  {
    targetVisible();
    shotSafe();
    if(target_visible && shot_safe)
      shoot = true;
  }
  
  private void targetVisible()
  {
    if(true)
      target_visible = true;
  }
  
  private void shotSafe()
  {
    if(true)
      shot_safe = true;
  }
  
  public boolean canShoot()
  {
    return shoot;
  }
  
}
