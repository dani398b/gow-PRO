import processing.sound.*;
SoundFile[] file = new SoundFile[5];
int song = 0;

//bruges til at gemme
PrintWriter output;

//classen bygninge sættes op
bygninge byg = new bygninge();
int [] bygning = new int [200];

//opsætter variablerne der skal holde på de bidler der skal bruges
PImage[] byger = new PImage[6];
PImage[] man = new PImage[24];
PImage baggrund, wood, wood1, luk, knap, lilleKnap, storKnap, maglerPenge, wood3, lilleKnap1, left, right, qu, kryds;

//opsætter globale værdiger
int mus1, vis;
float penge = 9000;
int sek, pSek;
int slet;

//laver en arrayliste der holder på alle menneskerne
ArrayList <mennesker> Mennesker = new ArrayList <mennesker>();


void setup() {
  //Loader alle bidlerne der skal bruges
  for (int i = 0; i < byger.length; i++) {
    byger[i] = loadImage("pic/byg"+i+".png");
  }
  for (int i = 0; i < man.length; i++) {
    man[i] = loadImage("pic/man"+i+".png");
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
  //Sætter størelsen af skærmen
  size(700, 700);

  //Indsætter 14 mennesker i Arraylist dette er de fjorten mennesker man starter med som blive genereret tilfældigt
  for (int i = 0; i < 14; i++) {
    Mennesker.add(new mennesker());
  }
  for (int i = 0; i < file.length; i++) {
    file[i] = new SoundFile(this, i +".mp3");
  }
  file[song].play();
}

void draw() {
  if(song > file.length){
   song = 0; 
  }
  //Starter med at tegne baggrunden
  image(baggrund, 0, 0);

  //Dette bruges til at lave tid i spillet
  sek = second();
  sekFunc();
  pSek = sek;

  //tegener et grid på baggrunden
  for (int i = 0; i < 9; i++) {
    stroke(0, 190, 0, 200);
    line(width, height/10*(i+1), 0, height/10*(i+1));
    line(width/10*(i+1), 0, width/10*(i+1), height);
  }
  //dette kalder en funktion i classen bygning der står for at tegne spillet
  byg.display();
} 

// tjekker om der bliver clikket på musen
void mousePressed() {
  //klader click funktionen i classen bygning denne står for at tjekke hvad der er clicket på
  byg.click(mouseX, mouseY);
}

int face=0;
// tjekker om der bliver trykket på tastaturet
void keyPressed() {
  //tjekker om der er trykket på p og hvis der er køre den funktionen save
  if (key == 'p') {
    save();
  }

  //tjekker om der er trykket på o og hvis der er køre den funktionen read
  if (key == 'o') {
    read();
  }
  if (key == 'i') {
    
    saveFrame("face"+face+".PNG"); 
    face++;
  }

  if (key == 'k') {
    for (int i = 0; i < file.length; i++) {
      if (file[i].isPlaying()) {
        file[i].pause();
        song = i;
      } else if (i == song) {
        file[song].play();
      }
    }
  }
  if (key == 'l') {
    file[song].stop();
    song++;
    if (song > file.length - 1)song = 0;
    println(song);
    file[song].play();
  }

  if (key == 'j') {
    file[song].stop();
    song--;
    if (song < 0)song = file.length -1;
    file[song].play();
  }
}
