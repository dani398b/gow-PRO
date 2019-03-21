class bygninge {
  //opsætter vardier der bliver brugt i classen
  int stedC;
  int sted;
  int hus;
  int pladser = 15;
  int brugtPladser;

  void click(int x, int y) {
    //tjekker hvilket flet i gridet der bliver clicket på
    if (set == true || kobPop == false && pop== false && upPop == false && ingenPenge == false && beboer == false && dineMaend== false && stat == false && beboer == false && plads == false) {
      fill(255, 0, 0);
      sted = ((y/70)*10)+(x/70+1);
      text(sted, x, y);
      if (set == true) {
        stat = false;
        setHus(sted);
      }
    }
    //køre funktionen clickEllers der tjekker hvilket vindue der skal åbnes
    clickEllers(sted, x, y);
  }
  void display() {
    //visser hvor mange penge du har
    textSize(20);
    fill(255);
    textAlign(CORNER);
    text(penge, 0, 20);
    
    //køre funktionen displayEllers der tenge skærmen
    displayEllers(sted);
    //for (mennesker b : Mennesker) {
    //  b.visBilde(sted);
    //}
    //vis = 0;
  }
}
