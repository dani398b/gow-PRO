class bygninger {
  int sted;
  bygninger() {
  }

  void click(int x, int y) {
    println(ingenPenge);
    fill(255, 0, 0);
    sted = ((y/70)*10)+(x/70+1);
    text(sted, x, y);
    if (x >= 200 && x <= 500 && y >= 400 && y <= 450 && ingenPenge == true) {
      ingenPenge = false;
    } else if (kobPop == false && pop == false && bygning[sted-1] == 0) {
      kobPop = true; 
      bygning[sted-1] = 99;
    } else if (kobPop == true && pop == false &&
      x <= 600 && x >= 100 && y >= 100 && y <= 600) {
      pop = true;
      kobPop = false;
      mus1 = round((mouseY-100)/50)+1;
      // println(mus1);
      popUp(mus1);
    } else if (x <= 500 && x >= 200 && y <= 350 && y >= 250 && pop == true) {
      Penge(mus1);
      pop = false;
      kobPop = false;
    } else if (kobPop == false && pop == false && bygning[sted -1] >= 1 && bygning[sted -1] < 99) {
      upPop = true;
    } 
    if (kobPop == true || pop == true || upPop == true) {
      lukClick();
    }
  }
  void display() {
    textSize(20);
    fill(255);
    textAlign(CORNER);
    text(penge, 0, 20);
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
    } else if (kobPop == true) {
      popUpKob();
    } else if (upPop == true) {
      upgrade();
    }
    if (upPop == true || kobPop == true || pop == true) {
      luk();
    }
  }
}
