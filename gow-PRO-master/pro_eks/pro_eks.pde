bygninger byg = new bygninger();
int [] bygning = new int [100];
boolean kobPop, pop, upPop, ingenPenge, beboer = false;
int mus1;

PImage[] byger = new PImage[6];
PImage baggrund, wood, wood1, luk, knap, lilleKnap, storKnap, maglerPenge, grid;
 
float penge = 9000;
int sek, pSek;

void setup(){
  for(int i = 0; i < byger.length; i++){
    byger[i] = loadImage("pic/byg"+i+".png");
  }
  maglerPenge = loadImage("pic/500x300.png");
  storKnap = loadImage("pic/300x50.png");
  knap = loadImage("pic/300x100.png");
  lilleKnap = loadImage("pic/50x50.png");
  baggrund = loadImage("pic/graes.png");
  wood = loadImage("pic/500x500.png");
  wood1 = loadImage("pic/500x500x2.png");
  grid = loadImage("pic/500x500x3.png");
  luk = loadImage("pic/exit50x50.png");
  size(700,700);
}

void draw(){
  image(baggrund,0,0);
  sek = second();
  sekFunc();
  pSek = sek;
  for(int i = 0; i < 9; i++){
    stroke(0,190,0,200);
    line(width,height/10*(i+1),0,height/10*(i+1));
    line(width/10*(i+1),0,width/10*(i+1),height);
  }
  byg.display();
} 
void mousePressed(){
  byg.click(mouseX,mouseY);
}

void keyPressed(){
  if(key == 'p'){
    String[] text = new String[101];
    for(int i = 0; i < bygning.length; i++){
      text[i] = str(bygning[i]);
    }
    text[100] = str(penge);
    saveStrings("lolol.txt", text);
  }
  if(key == 'o'){
    String[] fil = loadStrings("lolol.txt"); 
    
      for(int i = 0; i < bygning.length; i++){
      bygning[i] = int(fil[i]);
  }
  penge = float(fil[100]);
}
}
