import java.util.LinkedList;
class Controller
{
  private LinkedList<Bullet> b = new LinkedList<Bullet>();
  Bullet TempBullet;
  PlayerTank myTank;
  EnemyTank enemyTank;
  
  public Controller(PlayerTank myTank)
  {
    this.myTank = myTank;
  }
  public Controller(EnemyTank enemyTank)
  {
    this.enemyTank = enemyTank;
  }
  
  
  public void update()
  {
    for(int i = 0; i < b.size(); i++)
    {
      TempBullet = b.get(i);
      TempBullet.updatePosition();
    }
    
    for(int i = 0; i < getBList().size(); i++)
    {
      for(int a = i+1; a < getBList().size(); a++)
        if(dist(getBList().get(a).getRealPosition()[0], getBList().get(a).getRealPosition()[1], getBList().get(i).getRealPosition()[0], getBList().get(i).getRealPosition()[1]) 
        <= getBList().get(a).getSize() / 2 + getBList().get(i).getSize() / 2)
        {
          if(getBList().get(i).playerBulletCollision() && getBList().get(a).enemyBulletCollision()
          || getBList().get(i).enemyBulletCollision() && getBList().get(a).playerBulletCollision())
          {
            removeBullet(getBList().get(i));
            removeBullet(getBList().get(a-1));
          }
        }
    }
  }
  
  public void render()
  {
    for(int i = 0; i < b.size(); i++)
    {
      TempBullet = b.get(i);
      TempBullet.renderBullet();
    }
  }
  
  public void addBullet(Bullet block)
  {
    b.add(block);
  }
  
  public void removeBullet(Bullet block)
  {
    b.remove(block);
  }
  
  public LinkedList<Bullet> getBList()
  {
    return b;
  }
}
