class bygninge {
  int stedC;
  int sted;
  int hus;
  int pladser = 15;
  int brugtPladser;
  bygninge() {
  }

  void click(int x, int y) {
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
  void display() {
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
