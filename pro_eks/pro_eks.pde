bygninger byg = new bygninger();
int [] bygning = new int [100];

getFil fil = new getFil();
PImage smed;

void setup(){
  smed = loadImage("smed.png");
  size(700,700, P2D);
  noLoop();
  
}

void draw(){
  fil.skriv("positions.txt", 6000);
  fil.laes("positions.txt", 1220);
  for(int i = 0; i < 9; i++){
    line(width,height/10*(i+1),0,height/10*(i+1));
    line(width/10*(i+1),0,width/10*(i+1),height);
  }
} 
void mousePressed(){
  byg.click(mouseX,mouseY);
}
