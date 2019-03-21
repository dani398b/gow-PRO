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
    familie = int(random(9999));
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

  void visBilde(int sted) {
    if (dineMaend == true) {
      if (sted == hus) {
        if (hus == 0) {
          image(qu, 100, 100);
        }
      }
    }
  }
  void display() {
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
    void fam(){
      if(foraeldre[0] != 0){
    text(foraeldre[0] + "," +foraeldre[1],100,500);
  }
}
}
