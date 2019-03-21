import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class pro_eks extends PApplet {

PrintWriter output;

bygninge byg = new bygninge();
int [] bygning = new int [200];
int mus1, vis;

PImage[] byger = new PImage[6];
PImage baggrund, wood, wood1, luk, knap, lilleKnap, storKnap, maglerPenge, wood3, lilleKnap1, left, right, qu, kryds;

float penge = 9000;
int sek, pSek;

ArrayList <mennesker> Mennesker = new ArrayList <mennesker>();


public void setup() {
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
  

  for (int i = 0; i < 14; i++) {
    Mennesker.add(new mennesker());
  }
}

public void draw() {
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
public void mousePressed() {
  byg.click(mouseX, mouseY);
}


public void keyPressed() {
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
int manB = 0;
int manH = 0;
boolean click = false;
int _q;
int _w;
int up;

public void upgrade(int sted) {
  image(wood1, 100, 100);
  for (int i = 0; i < 5; i++) {
    image(lilleKnap, 125, 50 + ((i+1)*70));
    fill(255);
    text(i + 1, 145, 150+i*70);
    fill(0);
    text("Køb upgrade", 180, 150+i*70);
  }
  fill(255);
  image(knap, 200, 475);
  textAlign(CENTER);
  textSize(40);
  if (bygning[sted -1] == 1 || bygning[sted-1] == 5) {
    text("Arbejder", 350, 535);
  } else if (bygning[sted - 1] == 2|| bygning[sted - 1] == 3 || bygning[sted - 1] ==4) {
    text("Beboer", 350, 535);
  } else if (bygning[sted -1] == 6) {
    text("Fanger", 350, 535);
  }
}

public void kobUp(int x, int y) {
  for (int i = 0; i < 5; i++) {
    if (x >=125 && x <= 175 && y >= 125 + i *70 && y <= 175 + i*70) {
      image(lilleKnap, 125, 50 + ((i+1)*70));
      upgrade = true;
      upPop = false;
      up = i;
    }
  }
}

public void kobUpS(int sted) {
  image(wood3, 100, 100);
  if (bygning[sted-1] == 1) {
    textAlign(CENTER);
    textSize(40);
    text("Køb upgrade smed", 350, 150);
    textAlign(CORNER);
    textSize(25);
    text("Pris: " + (up + 1) * 1500, 120, 200);
    if (up == 4) {
      text("Plads til to extra medarbejdere: ", 120, 250);
    } else {
      text("Plads til en extra medarbejder: ", 120, 250);
    }
    text("Start omsætning øges \nmed 0,5 pr. sekund: ", 120, 300);
  }

  image(knap, 200, 475);
  textAlign(CENTER);
  textSize(40);
}

public void beboer(int sted) {
  image(wood3, 100, 100);
  knapper(4, 4);
  text("vælg dine \n   mænd", 483, 525);
  manB = 0;
  manH = 0;
  for (mennesker b : Mennesker) {
    if (b.hus == sted) {
      manB++;
      image(qu, 120*manB, 120*(manH+1), 100, 100);
      if (manB == 4) {
        manH++;
        manB = 0;
      }
    }
  }
  if (bygning[sted -1] == 1) {
    if (bygning[sted + 99] == 0) {
      for (int q = 0; q < 4; q++) {
        for (int i = 0; i < 4; i++) {
          if (q > 0) {
            if (q == 3 && i == 3) {
              break;
            }
            //image(kryds, 120 + ((i) * 120), 120 + (q * 120), 100, 100);
          }
        }
      }
    }
  }
}

public void stat() {
  image(wood3, 100, 100);
  image(lilleKnap1, 400, 150, 150, 150);
  Mennesker.get(_q).display();
  image(knap, 375, 450, 200, 100);
  image(knap, 125, 450, 200, 100);
  textAlign(CENTER);
  textSize(30);
  text("Sæt i hus", 475, 505);
  text("Lav barn", 225, 505);
}

public void statClick(int x, int y, int sted) {
  int[] num = new int[100];
  int p = 0;
  if (maend == true) {
    for (mennesker b : Mennesker) {
      if (b.hus == 0) {
        num[p] = b.nummer;
        p++;
      }
    }
  } else {
    for (mennesker b : Mennesker) {
      if (b.hus == sted) {
        num[p] = b.nummer;
        p++;
      }
    }
  }
  for (int i = 0; i < 4; i++) {
    for (int q = 0; q < 3; q++) {
      if (x >= 120 * (i+1) && x <= 120 * (i+1) + 100 && y >= 120 * (q + 1)  && y <= 120 * (q + 1)  + 100) {
        _q = num[((q*4)+i)];
        click = true;
        stat = true;
        beboer = false;
      }
    }
  }
}

public void knapper(int w, int o) {
  for (int q = 0; q < w; q++) {
    for (int i = 0; i < o; i++) {
      image(lilleKnap1, 120 + ((i) * 120), 120 + (q * 120), 100, 100);
    }
  }
}

public void plads() {
  image(wood3, 100, 100); 
  image(wood3, 100, 100);
  knapper(3, 4);
  image(left, 200, 500);
  image(right, 400, 500);

  manB = 0;
  manH = 0;
  for (mennesker b : Mennesker) {
    if (b.hus == 0) {
      manB++;
      image(qu, 120*manB, 120*(manH+1), 100, 100);
      if (manB == 4) {
        manH++; 
        manB = 0;
      }
    }
  }
}

public void pladsClick(int x, int y, int sted) {
  for (int i = 0; i < 4; i++) {
    for (int q = 0; q < 3; q++) {
      if (x >= 120 * (i+1) && x <= 120 * (i+1) + 100 && y >= 120 * (q+1)  && y <= 120 * (q+1)  + 100) {
        _w = Mennesker.get((q*4)+i).nummer;
        click = true;
        beboer = false;
        pop = false;
        ingenPenge = false;
        kobPop = false;
        upPop = false;
        dineMaend = false;
        stat = false;
        maend = false;
        plads = false;
        lukClick();
        Mennesker.add(new mennesker(Mennesker.get(_q), Mennesker.get(_w)));
      }
    }
  }
}

public void setHus(int sted) {
  boolean ikkePlads = false;
  for (int i = 0; i < 10; i++) {
    if (bygning[sted - 1] == i) { 
      tjekPlads(sted, i);
      ikkePlads = true;
    } else if(ikkePlads == true) {
      ikkePlads = true;
    }
    set = false;
  }
}

public void tjekPlads(int sted, int husHer) {
  int i = 0;
  if (bygning[sted - 1] == husHer) {
    for (mennesker b : Mennesker) {
      if (b.hus == sted) {
        i++;
      }
    }
    if (i < 4) {
      Mennesker.get(_q).hus = sted;
    } else{
      ikkePlads = true; 
    }
  }
}

public void ikkeNokPlads() {
  image(wood3, 100, 100);
  textAlign(CENTER);
  fill(0);
  textSize(50);
  text("Ikke mere plads",350,200);
  
  image(knap,200,500);
}
class bygninge {
  int stedC;
  int sted;
  int hus;
  int pladser = 15;
  int brugtPladser;
  bygninge() {
  }

  public void click(int x, int y) {
    println(sted);
    
    if (set == true) {
      sted = ((y/70)*10)+(x/70+1);
      stat = false;
      setHus(sted);
    }
    if (kobPop == false && pop== false && upPop == false && ingenPenge == false && beboer == false && dineMaend== false && stat == false && beboer == false && plads == false) {
      fill(255, 0, 0);
      sted = ((y/70)*10)+(x/70+1);
      text(sted, x, y);
    }
    clickEllers(sted, x, y);
  }
  public void display() {
    textSize(20);
    fill(255);
    textAlign(CORNER);
    text(penge, 0, 20);
    displayEllers(sted);
    for (mennesker b : Mennesker) {
      b.visBilde(sted);
    }
    vis = 0;
  }
}

boolean kobPop, pop, upPop, ingenPenge, beboer, dineMaend, stat, maend, plads, set, upgrade, ikkePlads, sMaend = false;

public void clickEllers(int sted, int x, int y) {
  if (ikkePlads == true && x >= 200 && x <= 500 && y >= 500 && y <= 700) {
    ikkePlads = false;
  } else if (stat == true && x >= 375 && x <= 575 && y >= 450 && y <= 550) {
    set = true;
    stat = false;
  } else if (plads == true && x >= 100 && x <= 600 && y >= 100 && y <= 600) {
    pladsClick(x, y, sted);
  } else if (stat == true && x >= 125 && x <= 325 && y >= 450 && y <= 550) {
    plads = true;
    stat = false;
  } else if (maend == true && x >= 100 && x <= 600 && y >= 100 && y <= 600) {
    statClick(x, y, sted);
    lukClick();
    maend = false;
    sMaend = false;
  } else if (x <= 675 && x >= 625 && y <= 675 && y > 625) {
    maend = true;
    sMaend = true;
  } else if (dineMaend == true) {
    if (click(200, 500, left.height, left.width,x,y)) {
      if (antal > 0){
        antal =- 12;
        dineMaend = true;
      }
    } else if (click(400, 500, right.height, right.width,x,y)) {
        antal =+ 12;
        dineMaend = true;
    }
  } else if (x >= 476 && x <= 574 && y >= 478 && y <= 568 && dineMaend == true) {
    stat = true;
    dineMaend = false;
  } else if (x >= 480 && x <= 580 && y >= 480 && y <= 580 && beboer == true) {
    maend = true;
    beboer = false;
  } else if (x >= 100 && x <= 600 && y >= 100 && y <= 600 && beboer == true) {
    statClick(x, y, 0);
  } else if (x >= 200 && x <= 500 && y >= 475 && y <= 575 && upPop == true) {
    upPop = false;
    beboer = true;
  } else if (upPop == true && x >= 100 && x<=600 && y >= 100 && y <= 600) {
    kobUp(x, y);
  } else if (x >= 200 && x <= 500 && y >= 400 && y <= 450 && ingenPenge == true) {
    ingenPenge = false;
  } else if (kobPop == false && pop == false && bygning[sted-1] == 0) {
    kobPop = true; 
    bygning[sted-1] = 99;
  } else if (kobPop == true && pop == false &&
    x <= 600 && x >= 100 && y >= 100 && y <= 600 && set == false) {
    pop = true;
    kobPop = false;
    mus1 = round((y-100)/50)+1;
    popUp(mus1);
  } else if (x <= 500 && x >= 200 && y <= 350 && y >= 250 && pop == true) {
    Penge(mus1);
    pop = false;
    kobPop = false;
  } else if (kobPop == false && pop == false && bygning[sted -1] >= 1 && bygning[sted -1] < 99) {
    upPop = true;
    //stedQ = sted;
  }
  if (kobPop == true|| ikkePlads == true || pop == true || upPop == true || beboer == true || dineMaend == true || stat == true || maend == true || plads == true || upgrade == true) {
    lukClick();
  }
}

public void displayEllers(int sted) {
  for (int i = 0; i < bygning.length; i++) {
    if (bygning[i] != 0 && bygning[i] != 99) {
      image(byger[bygning[i]-1], ((i)%10)*70, (round(i/10))*70);
    }
  }
  if (ingenPenge == true) {
    ikkeNok();
  } 
  if (pop == true) {
    popUp(mus1);
  } else if (ikkePlads == true) {
    ikkeNokPlads();
  } else if (ikkePlads == true) {
    ikkeNokPlads();
  } else if (kobPop == true) {
    popUpKob();
  } else if (upPop == true) {
    upgrade(sted);
  } else if (beboer == true) {
    beboer(sted);
  } else if (dineMaend == true) {
    maendMenu();
  } else if (stat == true) {
    stat();
  } else if (maend == true) {
    maendMenu();
  } else if (plads == true) {
    plads();
  } else if ( upgrade == true) {
    kobUpS(sted);
  }
  if (upPop == true ||ikkePlads == true|| kobPop == true || pop == true || beboer == true || dineMaend == true || stat == true ||maend == true || plads == true || upgrade == true) {
    luk();
  } else {
    image(lilleKnap1, 625, 625);
  }
}
int[] priser = {1000, 2000, 3000, 4000, 5000, 6000};

public void popUpKob() {
  image(wood, 100, 100);
  for (int i = 0; i < 9; i++) {
    line(100, 500/10*(i+1)+100, 600, 500/10*(i+1)+100);
  }
  fill(0);
  textSize(50);
  textAlign(CORNER);
  text("Smed", 105, 150);
  text("Hjem 1", 105, 200);
  text("Hjem 2", 105, 250);
  text("Hjem 3", 105, 300);
  text("Bank", 105, 350);
  text("Fængsel", 105, 400);
  text("Smed", 105, 450);
  text("Smed", 105, 500);
  text("Smed", 105, 550);
  text("Smed", 105, 600);
}
public void popUp(int kob) {

  fill(255, 0, 0);
  image(wood1, 100, 100);
  textAlign(CENTER); 
  textSize(50);
  fill(0);
  if (mus1 == 1) {
    text("køb en smed:", 350, 200);
  } else if (mus1 < 5 && mus1 > 1) {
    text("køb et hjem " + (mus1 - 1) + ":", 350, 200);
  } else if (mus1 == 5) {
    text("køb bank", 350, 200);
  } else if (mus1 == 6) {
    text("køb et fængsel", 350, 200);
  }
  fill(0, 255, 0);
  image(knap, 200, 250);
  fill(255);
  int pris = priser[kob - 1];
  text(pris + " Kr.", 350, 325);
}

public void luk() {
  image(luk, 555, 105, 40, 40);
}
public void lukClick() {
  if (mouseX >= 555 && mouseX <= 595 && mouseY >= 105 && mouseY <= 145) {
    pop = false;
    beboer = false;
    ingenPenge = false;
    kobPop = false;
    upPop = false;
    dineMaend = false;
    stat = false;
    maend = false;
    plads = false;
    upgrade = false;
    ikkePlads = false;
    sMaend = false;
    for (int i = 0; i < bygning.length; i++) {
      if (bygning[i] == 99) {
        bygning[i] = 0;
      }
    }
  }
}

public void Penge(int mus) {
  int pris = priser[mus -1];
  if (penge - pris >= 0) {
    penge = penge - pris;
    for (int i = 0; i < bygning.length; i++) {
      if (bygning[i] == 99) {
        bygning[i] = mus1;
      }
    }
  } else {
    ingenPenge = true;
  }
}

public void ikkeNok() {
  int pris = PApplet.parseInt(penge) - (priser[mus1 -1]);
  image(maglerPenge, 100, 200);
  fill(255);
  textAlign(CENTER);
  text(-1 * pris, 350, 350);
  text("Du mangler:", 350, 325);

  image(storKnap, 200, 400);
  text("Okay", 350, 430);
}

public void sekFunc() {
  float smed = 0;
  int base = 1;
  if (sek != pSek) {
    for (int i = 0; i < 100; i++) {
      if (bygning[i] == 1) {
        smed++;
        for (mennesker b : Mennesker) {
          if (b.hus == i + 1) { 
            smed = b.styrke/10 * base + smed;
          }
        }
      }
    }
    penge = smed + penge;
  }
}

int antal = 0;

public void maendMenu() {
  image(wood3, 100, 100); 
  image(wood3, 100, 100);
  knapper(3, 4);
  image(left, 200, 500);
  image(right, 400, 500);

  manB = 0;
  manH = 0;
  for (int i = antal; i < Mennesker.size(); i++) {
    if (manH <=2) {
      if (Mennesker.get(i).hus == 0) {
        manB++;
        image(qu, 120*manB, 120*(manH+1), 100, 100);
        if (manB == 4) {
          manH++;
          manB = 0;
        }
      }
    }
  }
}

public boolean click(int x, int y, int h, int b, int mx, int my) {
  if (mx >= x && mx <= x + b && my >= y && my <= y + h) {
    return true;
  } else {
    return false;
  }
}

public void save() {
  output = createWriter("lololololol.txt");
  for (int i = 0; i < bygning.length; i++) {
    output.print(bygning[i] +",");
  }
  output.print(penge);
  output.close();

  output = createWriter("positions.txt"); 
  for (mennesker b : Mennesker) {
    output.print(b.alder +",");
    output.print(b.styrke+",");
    output.print(b.iq+",");
    output.print(b.sygdom+",");
    output.print(b.farve+",");
    output.print(b.familie+",");
    output.print(b.hus+",");
    // output.print(",,");
  }
  for (mennesker b : Mennesker) {
    output.print(b.alder +",");
    output.print(b.styrke+",");
    output.print(b.iq+",");
    output.print(b.sygdom+",");
    output.print(b.farve+",");
    output.print(b.familie+",");
    output.print(b.hus+",");
    // output.print(",,");
  }


  output.close();
}

public void read() {
      BufferedReader reader = createReader("lololololol.txt");
    String line = null;
    try {
      while ((line = reader.readLine()) != null) {
        String[] pieces = split(line, ",");
        int q = 0;

        for (int i = 0; i < bygning.length; i++) {
          bygning[i] = PApplet.parseInt(pieces[q]);
          q++;
        }
        penge = PApplet.parseFloat(pieces[q]);
      }
      reader.close();
    }
    catch (IOException e) {
      e.printStackTrace();
    }

  BufferedReader read = createReader("positions.txt");
  String lines = null;
  try {
    while ((lines = read.readLine()) != null) {
      String[] pieces = split(lines, ",");
      int i = 0;
      for (mennesker b : Mennesker ) {
        b.alder = PApplet.parseInt(pieces[i]);
        i++;
        b.styrke = PApplet.parseInt(pieces[i]);
        i++;
        b.iq = PApplet.parseInt(pieces[i]);
        i++;
        b.sygdom = PApplet.parseInt(pieces[i]);
        i++;
        b.farve = PApplet.parseInt(pieces[i]);
        i++;
        b.familie = PApplet.parseInt(pieces[i]);
        i++;
        b.hus = PApplet.parseInt(pieces[i]);
        i++;
      }
      i = 0;
      for (mennesker b : Mennesker ) {
        b.alder = PApplet.parseInt(pieces[i]);
        i++;
        b.styrke = PApplet.parseInt(pieces[i]);
        i++;
        b.iq = PApplet.parseInt(pieces[i]);
        i++;
        b.sygdom = PApplet.parseInt(pieces[i]);
        i++;
        b.farve = PApplet.parseInt(pieces[i]);
        i++;
        b.familie = PApplet.parseInt(pieces[i]);
        i++;
        b.hus = PApplet.parseInt(pieces[i]);
        i++;
      }
    }
    read.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}
int _nummer;
class mennesker {
  float alder;
  float styrke;
  float iq;
  int sygdom;
  int farve;
  int kon;
  int familie;
  int hus;
  boolean visStat = false;
  boolean Vis = false;
  int nummer;
  int[] foraeldre = new int [2];
  mennesker() {
    hus = 0;
    alder = random(99);
    styrke = random(10);
    iq = random(50, 160);
    sygdom = round(random(100));
    farve = round(random(3));
    kon = round(random(1, 2));
    familie = PApplet.parseInt(random(9999));
    nummer = _nummer;
    _nummer++;
  }
  mennesker(mennesker other, mennesker other1) {
    alder = 0;
    
    if (other.styrke <= other1.styrke) {
      styrke = random(other.styrke - 1, other1.styrke + 1);
    } else {
      styrke = random(other1.styrke - 1, other.styrke + 1);
    }
    if (other.iq <= other1.iq) {
      iq = random(other.iq - 10, other1.iq + 10);
    } else {
      iq = random(other1.iq - 10, other.iq + 10);
    }
    if (other.sygdom <= other1.sygdom) {
      sygdom = round(random(other.sygdom - 5, other1.sygdom + 5));
    } else {
      sygdom = round(random(other1.sygdom - 5, other.sygdom + 5));
    }  
    farve = round((other.farve + other1.farve)/2);
    kon = round(random(1, 2));
    foraeldre[0] = other.familie;
    foraeldre[1] = other1.familie;
    nummer = _nummer;
    _nummer++;
  }

  public void visBilde(int sted) {
    if (dineMaend == true) {
      if (sted == hus) {
        if (hus == 0) {
          image(qu, 100, 100);
        }
      }
    }
  }
  public void display() {
      textSize(20);
      fill(255);
      text("Alder: " + alder, 150, 160);
      text("Styrke: " + styrke, 150, 185);
      text("Iq: " + iq, 150, 210);
      text("Sygdom: " + sygdom, 150, 235);
      text("Farve: " + farve, 150, 260);
      text("Køn: " + kon, 150, 285);
      text("Familie: " + familie, 150, 310);
      text("Forældre: " + foraeldre[0] +","+foraeldre[1], 150, 335);

  }
    public void fam(){
      if(foraeldre[0] != 0){
    text(foraeldre[0] + "," +foraeldre[1],100,500);
  }
}
}
  public void settings() {  size(700, 700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "pro_eks" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
