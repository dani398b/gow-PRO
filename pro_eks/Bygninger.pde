class bygninger {
  int sted;
  bygninger() {
  }

  void click(int x, int y) {

    fill(255, 0, 0);
    sted = ((y/70)*10)+(x/70+1);
    text(sted, x, y);
    println(kobPop);
    if (kobPop == false) {
      kob(sted, x, y);
    } else {
      kobF(sted, x, y);
    } 
    if (x <= 600 && x >= 100 && y >= 100 && y <= 150) {
      popSmed = true;
      kobPop = false;
    }
  }
  void display() {
    for (int i = 0; i < bygning.length; i++) {
      if (bygning[i] == 1) {
        image(smed, ((i)%10)*70, (round(i/10))*70);
      }
    }
    if (popSmed == true) {
      popSmed();
    }
    if (kobPop == true) {
      popUpKob();
    }
  }
}
