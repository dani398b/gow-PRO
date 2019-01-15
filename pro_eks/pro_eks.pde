bygninger byg = new bygninger();
int [] bygning = new int [100];
boolean kobPop = false;
boolean popSmed = false;

PImage smed;
PImage baggrund;

void setup(){
  smed = loadImage("smed.png");
  baggrund = loadImage("græs.png");
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
  println(bygning);
}
