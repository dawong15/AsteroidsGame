//WOOP WOOP.

SpaceShip bilbo = new SpaceShip();
//Asteroid[] ast = new Asteroid[30];
ArrayList <Asteroid> ast;
ArrayList <Bullet>bang;
Stars[] writtenInTheStars = new Stars[200];
public void setup() 
{
  size(500,500);
  bang=new ArrayList <Bullet>();
  for(int i=0;i<writtenInTheStars.length;i++){
    writtenInTheStars[i]=new Stars();
  }
  //for(int j=0;j<ast.length;j++){
    //ast[j]=new Asteroid();
  //}
  ast=new ArrayList <Asteroid>();
  for(int j=0;j<20;j++){
    ast.add(new Asteroid());
  }
}
public void draw() 
{
  background(0); 
  bilbo.show();
  bilbo.move();

  for (int i=0;i<writtenInTheStars.length;i++)
  {
    writtenInTheStars[i].show();
  }
  for(int j=0;j<ast.size();j++){
    ast.get(j).show();
    ast.get(j).move();
    double distance=dist(bilbo.getX(),bilbo.getY(),ast.get(j).getX(),ast.get(j).getY());
    if(distance<20){
      ast.remove(j);
      ast.add(new Asteroid());
    }
  
  for(int k=0;k<bang.size();k++){
    bang.get(k).show();
    bang.get(k).move();
    double distance2=dist(bang.get(k).getX(),bang.get(k).getY(),ast.get(j).getX(),ast.get(j).getY());
    if(distance2<30){
      bang.remove(k);
      ast.remove(j);
      ast.add(new Asteroid());
      }
      else if(bang.get(k).getX()>400||bang.get(k).getX()>400){
        bang.remove(k);
      }
    }
  }
  }

  //for(int j=0;j<ast.length;j++){
    //ast[j].show();
    //ast[j].move();
  //}


class SpaceShip extends Floater  
{   
  SpaceShip(){
    corners=4;
    xCorners=new int[corners];
    yCorners=new int[corners];
    myColor=color(255);
    xCorners[0]=-8;
    yCorners[0]=-8;
    xCorners[1]=16;
    yCorners[1]=0;
    xCorners[2]=-8;
    yCorners[2]=8;
    myCenterX=250;
    myCenterY=250;
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;
  }

   public void setX(int x){myCenterX = x;}
   public int getX(){return (int)myCenterX;}   
   public void setY(int y){myCenterY = y;}   
   public int getY(){return (int)myCenterY;}   
   public void setDirectionX(double x){myDirectionX = x;}   
   public double getDirectionX(){return myDirectionX;}   
   public void setDirectionY(double y){myDirectionY = y;}   
   public double getDirectionY(){return myDirectionY;}   
   public void setPointDirection(int degrees){myPointDirection = degrees;}   
   public double getPointDirection(){return myPointDirection;} 
    
}

class Stars
{
  int myX, myY;
  Stars(){
    myX=(int)(Math.random()*500);
    myY=(int)(Math.random()*500);
  }
  void show(){
    noStroke();
    fill(255);
    ellipse(myX,myY,5,5);
  }
}
public void keyPressed(){
  if(key=='h'){
    bilbo.setX((int)(Math.random()*500));
    bilbo.setY((int)(Math.random()*500));
    bilbo.setDirectionX(0);
    bilbo.setDirectionY(0);
    bilbo.setPointDirection((int)(Math.random()*500));
  }
  if(key=='w')
    bilbo.accelerate(4);
  if(key=='s')
    bilbo.accelerate(-4);
  if(key=='a')
    bilbo.rotate(-30);
  if(key=='d')
    bilbo.rotate(30);
}
public void mouseClicked(){
  for(int i=0;i<1;i++)
  {
    bang.add(new Bullet(bilbo));
  }
}
public class Asteroid extends Floater{

  private int rotSpd;
  public Asteroid(){
    rotSpd=2;
    corners=6;
    myColor=color(110,100,101);
    xCorners=new int[corners];
    yCorners=new int[corners];
    xCorners[0]=-11;
    yCorners[0]=-8;
    xCorners[1]=7;
    yCorners[1]=-8;
    xCorners[2]=13;
    yCorners[2]=13;
    xCorners[3]=6;
    yCorners[3]=10;
    xCorners[4]=-11;
    yCorners[4]=8;
    xCorners[5]=-5;
    yCorners[5]=0;
    myCenterX = (int)(Math.random()*400);
    myCenterY = (int)(Math.random()*400);
    myDirectionX = (int)(Math.random()*5)-3;
    myDirectionY = (int)(Math.random()*5)-3;
    myPointDirection = 0;
    rotSpd=(int)(Math.random()*4)-1;
  }

    public void setX(int x) {myCenterX = x;}
    public int getX() {return (int)myCenterX;}   
    public void setY(int y) {myCenterY = y;}   
    public int getY(){return (int)myCenterY;}    
    public void setDirectionX(double x){myDirectionX = x;}  
    public double getDirectionX(){return myDirectionX;}   
    public void setDirectionY(double y){myDirectionY = y;} 
    public double getDirectionY(){return myDirectionY;}  
    public void setPointDirection(int degrees){myPointDirection = degrees;}   
    public double getPointDirection(){return myPointDirection;}
    public void move() {
    super.move();
    rotate(rotSpd);
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
