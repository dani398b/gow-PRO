int[] priser = {1000, 2000, 3000, 4000, 5000, 6000};

//Laver menuen hvor man kan vælge bygning
void popUpKob() {
  //laver baggrunds bilde for menuen
  image(wood, 100, 100);
  
  //Laver linjer mellem valgne
  for (int i = 0; i < 9; i++) {
    line(100, 500/10*(i+1)+100, 600, 500/10*(i+1)+100);
  }
  
  //Sætter tekstens værdiger og skriver dem
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

//Tegner menuen hvor man betaler for husset
void popUp(int kob) {
  //Sætter tekstens værdiger
  fill(255, 0, 0);
  image(wood1, 100, 100);
  textAlign(CENTER); 
  textSize(50);
  fill(0);
  //Vælge hvilken bygning du har valgt og skriver passende tekst
  if (mus1 == 1) {
    text("køb en smed:", 350, 200);
  } else if (mus1 < 5 && mus1 > 1) {
    text("køb et hjem " + (mus1 - 1) + ":", 350, 200);
  } else if (mus1 == 5) {
    text("køb bank", 350, 200);
  } else if (mus1 == 6) {
    text("køb et fængsel", 350, 200);
  }
  //laver et bilde af en knap
  image(knap, 200, 250);
  fill(255);
  
  //regner og skriver prisen
  int pris = priser[kob - 1];
  text(pris + " Kr.", 350, 325);
}

//Funktion det tegner et kryds til at lukke menuer ned
void luk() {
  image(luk, 555, 105, 40, 40);
}

// funktion der lukker alle vinduer
void lukClick() {
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
    lukVisMen();
    for (int i = 0; i < bygning.length; i++) {
      if (bygning[i] == 99) {
        bygning[i] = 0;
      }
    }
  }
}

//Funktion der bliver kaldt når man køber noget og regner dine penge ud
void Penge(int mus) {
  //finder prisen
  int pris = priser[mus -1];
  
  //funktion der kørehvis man har råd til sit køb
  if (penge - pris >= 0) {
    penge = penge - pris;
    
    // Giver dig bygningen
    for (int i = 0; i < bygning.length; i++) {
      if (bygning[i] == 99) {
        bygning[i] = mus1;
      }
    }
  } else {
    //Gøre så der åbner et vindue med at man ikke har penge nok!
    ingenPenge = true;
  }
}

//Åbner vinduet med at man ikke har penge nok
void ikkeNok() {
  //Finder hvad man mangler
  int pris = int(penge) - (priser[mus1 -1]);
  
  //Visser bidler og printer tekst
  image(maglerPenge, 100, 200);
  fill(255);
  textAlign(CENTER);
  text(-1 * pris, 350, 350);
  text("Du mangler:", 350, 325);

  image(storKnap, 200, 400);
  text("Okay", 350, 430);
}

//Funktionen der køre efter tid
void sekFunc() {
  float smed = 0;
  int base = 1;
  if (sek != pSek) {
    //gøre menneskerne ældre
    for(mennesker b: Mennesker){
      b.alder = b.alder + 0.00;
    }
    
    // giver dig flere penge
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

int antal1 = 0;

//Laver menuen over dine mænd
void maendMenu() {
  //Laver de bidlere der skal bruges
  image(wood3, 100, 100); 
  image(wood3, 100, 100);
  knapper(3, 4);
  image(left, 200, 500);
  image(right, 400, 500);
  
  //Opstiller bidlerne så de passe i et grid
  manB = 0;
  manH = 0;
  for (int i = antal1; i < Mennesker.size(); i++) {
    if (manH <=2) {
      if (Mennesker.get(i).hus == 0) {
        manB++;
        image(man[Mennesker.get(i).bilde], 120*manB, 120*(manH+1), 100, 100);
        if (manB == 4) {
          manH++;
          manB = 0;
        }
      }
    }
  }
}

//funktion til at se om der bliver trykket på en recktangel
boolean click(int x, int y, int h, int b, int mx, int my) {
  if (mx >= x && mx <= x + b && my >= y && my <= y + h) {
    return true;
  } else {
    return false;
  }
}

//Lukker for alle menneskers visstat funktion!
void lukVisMen(){
   for(mennesker b: Mennesker){
     b.visStat = false;
   }
}
