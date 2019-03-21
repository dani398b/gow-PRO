
boolean kobPop, pop, upPop, ingenPenge, beboer, dineMaend, stat, maend, plads, set, upgrade, ikkePlads, sMaend = false;

void clickEllers(int sted, int x, int y) {
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

void displayEllers(int sted) {
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
