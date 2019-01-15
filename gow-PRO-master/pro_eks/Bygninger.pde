class bygninger {
  int sted;
  bygninger() {
  }

  void click(int x, int y) {
    println(ingenPenge);
    fill(255, 0, 0);
    sted = ((y/70)*10)+(x/70+1);
    text(sted, x, y);
    clickEllers(sted,x,y);
  }
  void display() {
    textSize(20);
    fill(255);
    textAlign(CORNER);
    text(penge, 0, 20);
    displayEllers();
  }
}
