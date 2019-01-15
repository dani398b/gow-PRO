bygninger byg = new bygninger();
int [] bygning = new int [100];
boolean kobPop = false;
boolean pop = false;
int mus1;

PImage[] byger = new PImage[4];
PImage baggrund;
PImage wood;

void setup(){
  for(int i = 0; i < byger.length; i++){
    byger[i] = loadImage("pic/byg"+i+".png");
  }
  baggrund = loadImage("pic/græs.png");
  wood = loadImage("pic/500x500.png");
  size(700,700, P2D);
}

void draw(){
  image(baggrund,0,0);
  for(int i = 0; i < 9; i++){
    line(width,height/10*(i+1),0,height/10*(i+1));
    line(width/10*(i+1),0,width/10*(i+1),height);
  }
  byg.display();
} 
void mousePressed(){
  byg.click(mouseX,mouseY);
}
