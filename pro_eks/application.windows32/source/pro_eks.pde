PrintWriter output;

bygninge byg = new bygninge();
int [] bygning = new int [200];
int mus1, vis;

PImage[] byger = new PImage[6];
PImage baggrund, wood, wood1, luk, knap, lilleKnap, storKnap, maglerPenge, wood3, lilleKnap1, left, right, qu, kryds;

float penge = 9000;
int sek, pSek;

ArrayList <mennesker> Mennesker = new ArrayList <mennesker>();


void setup() {
  for (int i = 0; i < byger.length; i++) {
    byger[i] = loadImage("pic/byg"+i+".png");
  }
  maglerPenge = loadImage("pic/500x300.png");
  storKnap = loadImage("pic/300x50.png");
  knap = loadImage("pic/300x100.png");
  lilleKnap = loadImage("pic/50x50.png");
  lilleKnap1 = loadImage("pic/50x50x2.png");
  baggrund = loadImage("pic/graes.png");
  wood = loadImage("pic/500x500.png");
  wood1 = loadImage("pic/500x500x2.png");
  wood3 = loadImage("pic/500x500x4.png");
  luk = loadImage("pic/exit50x50.png");
  left = loadImage("pic/left.png");
  right = loadImage("pic/right.png");
  qu = loadImage("pic/idk.png");
  kryds = loadImage("pic/50x50X.png");
  size(700, 700);

  for (int i = 0; i < 14; i++) {
    Mennesker.add(new mennesker());
  }
}

void draw() {
  image(baggrund, 0, 0);
  sek = second();
  sekFunc();
  pSek = sek;
  for (int i = 0; i < 9; i++) {
    stroke(0, 190, 0, 200);
    line(width, height/10*(i+1), 0, height/10*(i+1));
    line(width/10*(i+1), 0, width/10*(i+1), height);
  }
  byg.display();

  for (mennesker b : Mennesker) {
    b.fam();
  }
} 
void mousePressed() {
  byg.click(mouseX, mouseY);
}


void keyPressed() {
  if (key == 'p') {
    save();
  }

  if (key == 'o') {
    read();
  }
//  if(key == 'i') {
//    int face=0;
//   saveFrame("face"+face+".PNG"); 
//   face++;  
//}
}
