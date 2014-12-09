//your variable declarations here
private boolean keyUp = false;
private boolean keyDown = false;
private boolean keyLeft = false;
private boolean keyRight = false;
private boolean keySpace = false;
private float asteroidaccel = 0; 
private int count = 0;

Star [] sfield;
SpaceShip player;
ArrayList <Asteroid> astList = new ArrayList<Asteroid>();
ArrayList <Bullet> shoot = new ArrayList<Bullet>();
public void setup() 
{
  //your code here
  size(1000,600);
  sfield = new Star[1000];


  for (int i = 0; i < sfield.length; i ++)
  {
   sfield[i] = new Star();
 }
 
 for(int i = 0; i < 6; i++)
 {
  astList.add(new Asteroid());
  astList.get(i).rotate((int)(Math.random()*360));
  astList.get(i).setDirectionX(Math.random()*6-3);
  astList.get(i).setDirectionY(Math.random()*6-3);
}

player = new SpaceShip();
}
public void draw() 
{
  background(0);
  player.show();
  player.move();
  //player controls
  if(keyUp == true){player.accelerate();}
  if(keyDown == true){player.accelerate();}
  if(keyRight == true){player.rotate(5);}
  if(keyLeft == true){player.rotate(-5);}
  //if u press spacebar u create bullet
  if(keySpace == true)
  {
    shoot.add(new Bullet(player));
    count++;
  }
  //draws bullet/move/removes
  for(int i = 0; i< shoot.size(); i++)
  {
    shoot.get(i).show();
    shoot.get(i).move();

    for(int j= 0; j< astList.size(); j++)
    {

      if(dist(shoot.get(i).getX(),shoot.get(i).getY(), astList.get(j).getX(), astList.get(j).getY()) < 15)
      {
        shoot.remove(i);
        astList.remove(j);
        break;
      }

    }
  }
  for(int i = 0; i< shoot.size(); i++)
  {
    if(shoot.get(i).getX()>=width||shoot.get(i).getX()<=0||shoot.get(i).getY()>=height||shoot.get(i).getY()<=0)
    {
      shoot.remove(i);
    }
  }

  for (int i =0; i < sfield.length; i ++)
  {
    sfield[i].show();
  }
  for(int i =0; i < astList.size(); i++)
  {
    astList.get(i).show();
    astList.get(i).move();
  }
}

public void keyPressed()
{
 if(keyCode == UP){keyUp = true;}
 if(keyCode == DOWN){keyDown = true;}
 if(keyCode == RIGHT){keyRight = true;}
 if(keyCode == LEFT){keyLeft = true;}
 if(key == 32){keySpace = true;}
 if(key == 'h')
 {
  player.setX((int)(Math.random()*width));
  player.setY((int)(Math.random()*height));
  player.setDirectionX(0);
  player.setDirectionY(0);
  player.setPointDirection((int)(Math.random()*360));
}
}
public void keyReleased()
{
  if(keyCode == UP){keyUp = false;}
  if(keyCode == DOWN){keyDown = false;}
  if(keyCode == RIGHT){keyRight = false;}
  if(keyCode == LEFT){keyLeft = false;}
  if(key == 32){keySpace = false;}
}


class SpaceShip extends Floater  
{   
    //your code here
    float shipaccel;
    SpaceShip()
    {
      corners = 6;
      xCorners = new int[corners];
      xCorners[0] = -12;
      xCorners[1] = -6;
      xCorners[2] = -0;
      xCorners[3] = -6;
      xCorners[4] = -12;
      xCorners[5] = 12;
      yCorners = new int[corners];  
      yCorners[0] = -12;
      yCorners[1] = -5;
      yCorners[2] = 0;
      yCorners[3] = 5;
      yCorners[4] = 12;
      yCorners[5] = 0;

      myColor = 255;

      myCenterX = 300;
      myCenterY = 300;
      
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;

      shipaccel = 0.1;
    }
//INCOMPLETE
public void accelerate()
{
  if(myDirectionX < 5 && myDirectionY < 5 && myDirectionX > -5 && myDirectionY > -5)
  {
    super.accelerate(shipaccel);
  }

  if(myDirectionX >= 5)
  {
    super.accelerate(0);
    myDirectionX = 4.9;
  }
  else if(myDirectionX <= -5)
  {
    super.accelerate(0);
    myDirectionX = -4.9;
  }
  if(myDirectionY >= 5)
  {
    super.accelerate(0);
    myDirectionY = 4.9;  
  }
  else if(myDirectionY <= -5)
  {
    super.accelerate(0);
    myDirectionY = -4.9;
  }
}


public void setX(int x){myCenterX = x;}  
public int getX(){return ((int)myCenterX);}   

public void setY(int y){myCenterY = y;}  
public int getY(){return ((int)myCenterY);}

public void setDirectionX(double x){myDirectionX = x;}   
public double getDirectionX(){return myDirectionX;}  

public void setDirectionY(double y){myDirectionY = y;}   
public double getDirectionY(){return myDirectionY;}  

public void setPointDirection(int degrees){myPointDirection = degrees;}   
public double getPointDirection(){return myPointDirection;} 
}


  //INCOMPLETE 
  class Asteroid extends Floater
  {
    Asteroid()
    {
      corners = 7;
      xCorners = new int[corners];
      xCorners[0] = -15;
      xCorners[1] = -10;
      xCorners[2] = 10;
      xCorners[3] = 10;
      xCorners[4] = 15;
      xCorners[5] = 10;
      xCorners[6] = -9;
      yCorners = new int[corners];  
      yCorners[0] = 0;
      yCorners[1] = 9;
      yCorners[2] = 15;
      yCorners[3] = 9;
      yCorners[4] = 0;
      yCorners[5] = -11;
      yCorners[6] = -10;

      myColor = 255;

      myCenterX = Math.random()*width;
      myCenterY = Math.random()*height;
      
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;

    }

    public void setX(int x){myCenterX = x;}  
    public int getX(){return ((int)myCenterX);}   

    public void setY(int y){myCenterY = y;}  
    public int getY(){return ((int)myCenterY);}

    public void setDirectionX(double x){myDirectionX = x;}   
    public double getDirectionX(){return myDirectionX;}  

    public void setDirectionY(double y){myDirectionY = y;}   
    public double getDirectionY(){return myDirectionY;}  

    public void setPointDirection(int degrees){myPointDirection = degrees;}   
    public double getPointDirection(){return myPointDirection;} 
  }

  class Bullet extends Floater
  {
    Bullet(SpaceShip sp)
    {
      myColor = 255;

      myCenterX = sp.getX();
      myCenterY = sp.getY();

      myPointDirection = sp.getPointDirection();
      double dRadians = myPointDirection*Math.PI/180;

      myDirectionX = 5 * Math.cos(dRadians) + sp.getDirectionX();
      myDirectionY = 5 * Math.sin(dRadians) + sp.getDirectionY();
      
    }
    public void show()
    {
      {
        fill(255);  
      }
      
      ellipse((float)myCenterX,(float)myCenterY,7,7);
    }

    public void setX(int x){myCenterX = x;}  
    public int getX(){return ((int)myCenterX);}   

    public void setY(int y){myCenterY = y;}  
    public int getY(){return ((int)myCenterY);}

    public void setDirectionX(double x){myDirectionX = x;}   
    public double getDirectionX(){return myDirectionX;}  

    public void setDirectionY(double y){myDirectionY = y;}   
    public double getDirectionY(){return myDirectionY;}  

    public void setPointDirection(int degrees){myPointDirection = degrees;}   
    public double getPointDirection(){return myPointDirection;} 
  }

  class Star
  {
    private int starX,starY,starSize;
    public Star()
    {
      starX = (int)(Math.random()*width);
      starY = (int)(Math.random()*width);
      starSize = (int)(Math.random()*6+1);
    }
    public void show()
    {
      noStroke();
      if(starSize >5)
      {
        fill(255, 160, 123,100);
      }else if(starSize < 4)
      {
        fill(165, 185, 255,160);

      }else
      {
        fill(240, 240, 150,120);  
      }
      ellipse(starX,starY,starSize,starSize);
    }
  } 
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);
  abstract public int getX();   
  abstract public void setY(int y);  
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  } 
} 

