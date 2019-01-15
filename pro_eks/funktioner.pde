int[] priser = {1000, 2000, 3000, 4000, 5000, 6000};

void popUpKob() {
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
void popUp(int kob) {

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

void luk() {
  image(luk, 555, 105, 40, 40);
}
void lukClick() {
  if (mouseX >= 555 && mouseX <= 595 && mouseY >= 105 && mouseY <= 145) {
    pop = false;
    kobPop = false;
    upPop = false;
    for (int i = 0; i < bygning.length; i++) {
      if (bygning[i] == 99) {
        bygning[i] = 0;
      }
    }
  }
}
void upgrade() {
  image(wood1, 100, 100);
  for (int i = 0; i < 5; i++) {
    image(lilleKnap, 125, 50 + ((i+1)*70));
  }
  image(knap, 200, 475);
}

void kob(int sted, int x, int y) {
  if (bygning[sted] == 0 && kobPop == false) {
    kobPop = true;
  }
}

void Penge(int mus) {
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

  void ikkeNok() {
    int pris = int(penge) - (priser[mus1 -1]);
    image(maglerPenge,100, 200);
    fill(0);
    textAlign(CENTER);
    text(-1 * pris, 350,350);
    
    image(storKnap,200,400);
  }
