class EnemyAI
{
  private PVector location;
  private PVector targetLocation;
  
  private boolean target_visible =false;
  private boolean shot_safe = false;
  private boolean shoot = false;
  
  public EnemyAI(EnemyTank enemy)
  {
    location = new PVector(enemy.getPosition().x, enemy.getPosition().y);
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
