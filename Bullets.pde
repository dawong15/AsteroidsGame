public class Bullet extends Floater
{ 
private double dRadians;     
 Bullet(SpaceShip bilbo){


    myCenterX=bilbo.getX();
    myCenterY=bilbo.getY();
    myDirectionX=5*Math.cos(dRadians)+bilbo.getDirectionX();
    myDirectionY=5*Math.sin(dRadians)+bilbo.getDirectionY();
    myPointDirection=bilbo.getPointDirection();
    dRadians=myPointDirection*(Math.PI/180);
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
   
   public void show(){
    fill(255,0,0);   
    noStroke();                 
    ellipse((int)myCenterX,(int)myCenterY,(int)5,(int)5);
   } 




  
  }   




